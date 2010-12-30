<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<{$encoding}>" />
<title><{$webTitle}></title>
<{include file="css.tpl"}>
</head>
<body>
	<div id="wrap">
	<p class="title"><{$siteName}>广告管理系统</p>
	<div id="op" class="ui-corner-all" >
	<ul id="selection">
		<li><a href="<{$base}>/adv/1" <{if $advType==1}>class="selected"<{/if}>>进站</a></li>
		<li><a href="<{$base}>/adv/2" <{if $advType==2}>class="selected"<{/if}>>banner</a></li>
		<li><a href="<{$base}>/adv/3" <{if $advType==3}>class="selected"<{/if}>>进站广告</a></li>
		<li><a href="<{$base}>/adv/4" <{if $advType==4}>class="selected"<{/if}>>左侧广告</a></li>
	</ul>
	<div id="page">
	<ul class="pagination" >
		<li class="page-pre">总数:<{$total}>&nbsp;&nbsp;分页:</li>
		<li><ol title="分页列表" class="page-main"><{$pageBar}></ol></li>
		<li class="page-suf">&nbsp;&nbsp;当前页:<{$page}>&nbsp;/&nbsp;<{$totalPage}></li>
		<li id="add"><input type="button" class="button" value="增加" id="b_add"/></li>
	</ul>
	</div>
	</div>
	<div id="adv_main">
	<table id="adv" class="ui-corner-all" cellpadding="0" cellspacing="0">
		<tr>
			<th class="ui-state-default c_1">序号</th>
			<th class="ui-state-default c_2">文件名</th>
			<th class="ui-state-default c_3">链接</th>
<{if ($type)}>
			<th class="ui-state-default c_4">开始时间</th>
			<th class="ui-state-default c_5">结束时间</th>
			<th class="ui-state-default c_6">特权</th>
<{else}>
			<th class="ui-state-default c_4">启用</th>
			<th class="ui-state-default c_5">顺序</th>
<{/if}>
			<th class="ui-state-default c_8">备注</th>
			<th class="ui-state-default c_7">操作</th>
		</tr>
<{if isset($info)}>
<{foreach from=$info item=item key=k}>
		<tr class="ui-widget-content<{if (strtotime($item.sTime)<time() && (strtotime($item.eTime)+86400)>time()) || $item.switch == 1}> used<{/if}>">
			<td class="c_1" id="<{$item.aid}>"><{$k+1}></td>
			<td class="c_2"><a href="<{$base}>/<{$dir}>/<{$item.file}>"><{$item.file}></a></td>
			<td class="c_3"><a href="<{$item.url}>"><{$item.url|default:"&nbsp;"}></a></td>
<{if ($type)}>
			<td class="c_4"><{$item.sTime}></td>
			<td class="c_5"><{$item.eTime}></td>
			<td class="c_6"><{if $item.privilege == 1}>是<{else}>否<{/if}></td>
<{else}>
			<td class="c_4"><{if $item.switch == 1}>是<{else}>否<{/if}></td>
			<td class="c_5"><{$item.weight}></td>
<{/if}>
			<td class="c_8"><{$item.remark|default:"&nbsp;"}></td>
			<td class="c_7">
				<input type="button" class="button b_pre" value="预览" onclick="$('#preview').dialog('open').find('img').attr('src', '<{$base}>/<{$aPath}>/<{$item.file}>');"/>
				<input type="button" class="button b_mod" _type="<{$type}>"value="修改" />
				<input type="button" class="button b_del" value="删除" />
			</td>
		</tr>
<{/foreach}>
<{else}>
		<tr class="ui-widget-content">
<{if ($type)}>
			<td colspan="8">没有文件</td>
<{else}>
			<td colspan="7">没有文件</td>
<{/if}>
		</tr>
<{/if}>
	</table> 
	</div>
</div>
<form id="modifyform" style="display:none" action="<{$base}>/adv/<{$advType}>/set" method="post" class="dialog-form">
	<ul>
	<li><span>链接:</span><input type="text" name="url" class="input-text"/></li>
<{if ($type)}>
	<li><span>开始时间:</span><input type="text" name="sTime" class="input-text"/></li>
	<li><span>结束时间:</span><input type="text" name="eTime" class="input-text"/></li>
	<li><span>特权:</span><input type="checkbox" name="privilege" /></li>
<{else}>
	<li><span>开启:</span><input type="checkbox" name="switch" /></li>
	<li><span>顺序:</span><input type="text" name="weight" class="input-text"/></li>
<{/if}>
	<li><span>备注:</span><input type="text" name="remark" class="input-text"/></li>
	<li><input type="submit" class="submit" value="提交修改"/></li>
	</ul>
	<input type="hidden" name="aid" />
	<input type="hidden" name="p" value="<{$page}>"/>
</form>
<div id="preview" style="display:none;text-align:center">
	<img />
</div>
<form id="delform" style="display:none" action="<{$base}>/adv/<{$advType}>/del" method="post">
	<input type="hidden" name="aid"/>
	<input type="hidden" name="p" value="<{$page}>"/>
</form>
<form id="addform" style="display:none" action="<{$base}>/adv/<{$advType}>/add" method="post" class="dialog-form" ENCTYPE="multipart/form-data">
	<ul>
	<li><span>图片:</span><input type="file" name="img"/></li>
	<li><span>链接:</span><input type="text" name="url" class="input-text"/></li>
<{if ($type)}>
	<li><span>开始时间:</span><input type="text" name="sTime" class="input-text"/></li>
	<li><span>结束时间:</span><input type="text" name="eTime" class="input-text"/></li>
	<li><span>特权:</span><input type="checkbox" name="privilege" /></li>
<{else}>
	<li><span>开启:</span><input type="checkbox" name="switch" /></li>
	<li><span>顺序:</span><input type="text" name="weight" class="input-text"/></li>
<{/if}>
	<li><span>备注:</span><input type="text" name="remark" class="input-text"/></li>
	<li><input type="submit" class="submit" value="添加"/></li>
	</ul>
	<input type="hidden" name="p" value="<{$page}>"/>
</form>
</body>
<{include file="script.tpl"}>
<html>
