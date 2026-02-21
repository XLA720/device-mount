<h1>My First script</h1>
<pre>
  这是我的第一个相对完善的脚本，后续将持续更新
  我非常高兴
  下面我将讲讲我定义的变量及作用
  挂载目录与挂载权限请自行修改
</pre>
<h3>SHELL部分内容：</h3>
<ul>
  <li>time        ==> 一个辅助提示变量，无作用</li>
  <li>devicename  ==> 通过python获取设备名称</li>
  <li>maxnumber   ==> 通过python获取最大设备数</li>
  <li>dev         ==> 选择的设备编号</li>
  <li>userchoose  ==> 根据设备编号判断选择的具体设备</li>
  <li>dir         ==> 输入的设备挂载目录</li>
  <li>re          ==> 一个辅助提示变量，无作用</li>
  <li>jbm         ==> 一个验证变量，提醒用户检查输入</li>
  <li>mountroot   ==> 通过python输出挂载设备与设备挂载目录</li>
  <li>i           ==> 无</li>
  <li>mdev        ==> 挂载设备</li>
  <li>mdir        ==> 挂载路径 </li>
  <li>$1          ==> 传入第一个脚本参数进行开始选择</li>
  <li>wish        ==> 提示语</li>
  <li>file        ==> 文件路径</li>
</ul>
<h3>PYTHON部分内容：</h3>
<ul>
  <li>Device()    ==> 通过硬编写文件读取位置读取并生成 device「设备列表」 与 result「打印列表」 输出到终端显示</li>
  <li>userchoose  ==> 通过传入的 maxnumber「设备大小」与dev「选择设备」 参数进行选择设备判断</li>
  <li>path        ==> 通过传入的 dir「挂载根目录」与userchoose「选择设备」 生成挂载目录</li>
  <li>exe         ==> 判断程序，python调用格式：「自定义名称」=($(python .device.py 「调用函数」 「传入参数」))</li>
</ul>
<p>
  <b>注意</b>：因为会用到python进行设备名读取，所以设备信息被存储在 /home/device.txt 中。可自行修改存储位置。但是可能造成意料之外的破坏。（因为我的系统为kali，默认root）
</p>
