# dotfile_for_container

#### 介绍
旨在用gitee内源维护一个针对GPU服务器上容器运维脚本的仓库。
dotfile能够针对干净的容器自动安装相关需要的软件，进行配置。（主要别人家的dockerfile各种失败中途推翻重建，严重差评）

可能起到的作用类似于以下awesome项目

https://github.com/louiehelm/manjaro-ml-dotfiles

https://github.com/webpro/awesome-dotfiles



#### 安装教程

纯净的容器更新后，安装好git

```
cd /data
apt update
apt install git
git clone https://gitee.com/ecnu-vis/dotfile_for_container.git
```







#### 使用说明

如果只是想给容器加个ssh，请先向管理人员确定该容器已经暴露了22号的ssh端口

```
cd /data
cd ./dotfile_for_container/ssh/
./ssh_create.sh
cd ../../
```

如果准备把这个容器当做主力开发环境，下面的方法可以自动配置好ssh_server,zsh命令行（一种很waaaaaaaaaaaaaaaag的命令行）tmux（后台分屏的工具，方面长期后台运行训练任务）vim（虽然很推荐用vscode pycharm之类的远程编辑或者tftp实时同步代码和开发，但是总有人喜欢vim，这里给出了一个比较好用的配置）

```
cd /data
cd dotfile_for_container
chmod -R 777 ./
./ubuntu-install.sh
```
当前版本下ohmyzsh有bug，修复方法是：
- 安装过程中提示是否设置为默认命令行，输入`Y`回车，然后命令行输入`exit`，继续安装，安装完成过程中会爆很多错误，不用理会
- 命令行输入`zsh`切换到ohmyzsh命令行，然后运行`./ubuntu-install.sh`
`git_prompt_info:20: character not in range    `的解决方法为https://blog.csdn.net/weixin_30839881/article/details/101812099


如果出现了意外，比如中间中断了，欢迎发issue。此外，可以考虑用文本形式打开sh文件，然后一行行复制到命令行运行，看看到哪一步出问题了。通常是因为如下原因：

- 多加了sudo之类的小问题
- 已经有文件夹了，无法作为目标目录 
- 权限问题 chmod完成

- git clone github的项目的时候http 超时，需要用github镜像来解决这个问题。

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request

