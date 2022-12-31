NAME = inception

FILE = ./srcs/docker-compose.yml
VOLUME = /home/sunbchoi/data

all : $(NAME)

$(NAME):
	@ sudo mkdir -p $(VOLUME)/wp $(VOLUME)/db $(VOLUME)/log
	@ docker-compose -f $(FILE) -p $(NAME) up -d --build

clean:
	@ docker-compose -f $(FILE) -p $(NAME) down --rmi all --volumes --remove-orphans

fclean: clean
	@ sudo rm -rf $(VOLUME)
	@ docker system prune -a

re: fclean all

logs:
	@ docker-compose -f $(FILE) -p $(NAME) logs

.PHONY: all, clean, fclean, re, logs