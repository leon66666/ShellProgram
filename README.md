# ShellProgram

### 已完成
#### 一、HelloDemo.sh	        第一个例子
#### 二、VariableDemo.sh	    变量demo 
#### 三、StringDemo.sh	      字符串demo
#### 四、ReplaceDemo.sh	      替换demo（转义字符替换，命令替换，变量替换）
#### 五、ArrayDemo.sh	        数组demo
#### 六、FunctionDemo.sh	    函数demo
#### 七、LoopDemo.sh	        循环demo（for循环，while循环，util循环，break跳出循环，continue跳出循环）
#### 八、SentenceDemo.sh	    语法 demo（if else 语句，case esac语句）
#### 九、OperatorDemo.sh	    运算符demo（算数运算符expr，关系运算符，布尔运算符，字符串运算符，文件测试运算符）

### 实际应用
#### 一、nginx.sh             ngxin负载多个tomcat，更新代码脚本。
###### 具体步骤：
1、更新代码到备用tomcat，web2，执行/opt/bin/nginx-web.sh 8072</br>
2、更新代码到主用tomcat，web，执行/opt/bin/nginx-web.sh 8071
#### 二、automation.sh         自动化部署代码到线上脚本
###### 具体步骤：     
git拉取代码，mvn编译代码，按照nginx.sh的使用步骤逐个更新tomcat，切换nginx
#### 三、tomcat.sh      	     tomcat部署
###### 具体步骤：  
查询进程，杀进程，重启


### 待完成
#### Shell输入输出重定向    参考 http://c.biancheng.net/cpp/view/2738.html
#### Shell文件包含          参考 http://c.biancheng.net/cpp/view/2740.html
