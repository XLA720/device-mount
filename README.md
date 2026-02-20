<h1>My First script</h1>
<pre>
  这是我的第一个相对完善的脚本，后续将持续更新
  我非常高兴
  下面我将讲讲我定义的变量及作用
  挂载目录与挂载权限请自行修改
</pre>
<h3>SHELL部分内容：</h3>
<ul>
  <p>time        ==> 一个辅助提示变量，无作用</p>
  <p>devicename  ==> 通过python获取设备名称</p>
  <p>maxnumber   ==> 通过python获取最大设备数</p>
  <p>dev         ==> 选择的设备编号</p>
  <p>userchoose  ==> 根据设备编号判断选择的具体设备</p>
  <p>dir         ==> 输入的设备挂载目录</p>
  <p>re          ==> 一个辅助提示变量，无作用</p>
  <p>jbm         ==> 一个验证变量，提醒用户检查输入</p>
  <p>mountroot   ==> 通过python输出挂载设备与设备挂载目录</p>
  <p>i           ==> 无</p>
  <p>mdev        ==> 挂载设备</p>
  <p>mdir        ==> 挂载路径 </p>
</ul>
<h3>PYTHON部分内容：</h3>
<ul>
  <p>Device()    ==> 通过硬编写文件读取位置读取并生成 device「设备列表」 与 result「打印列表」 输出到终端显示</p>
  <p>userchoose  ==> 通过传入的 maxnumber「设备大小」与dev「选择设备」 参数进行选择设备判断</p>
  <p>path        ==> 通过传入的 dir「挂载根目录」与userchoose「选择设备」 生成挂载目录</p>
  <p>exe         ==> 判断程序，python调用格式：「自定义名称」=($(python .device.py 「调用函数」 「传入参数」))</p>
</ul>
<p>
  <b>注意</b>：因为会用到python进行设备名读取，所以设备信息被存储在 /home/device.txt 中。可自行修改存储位置。但是可能造成意料之外的破坏。（因为我的系统为kali，默认root）
</p>
