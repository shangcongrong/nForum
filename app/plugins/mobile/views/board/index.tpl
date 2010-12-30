<{include file="../plugins/mobile/views/header.tpl"}>
<div class="sec nav">
<{if $canPost}>
	<a href="<{$mbase}>/article/<{$bName}>/post<{if !$threads}>?m=1<{/if}>">发表</a>|
<{/if}>
<{if $threads}>
	<a href="<{$mbase}>/board/<{$bName}>/0">经典</a>|
<{else}>
	<a href="<{$mbase}>/board/<{$bName}>">同主题</a>|
<{/if}>
</div>
<ul class="list sec">
<{if $info}>
<{foreach from=$info item=item key=k}>
<li<{cycle values=', class="hla"'}>>
<{if $threads}>
		<a href="<{$mbase}>/article/<{$bName}>/<{$item.gid}>"<{if $item.tag}> class="<{$item.tag}>"<{/if}>><{$item.title}></a>(<{$item.num}>)<br />
		<{$item.postTime}>&nbsp;<a href="<{$mbase}>/user/query/<{$item.poster}>"><{$item.poster}></a>|
		<{$item.replyTime}>&nbsp;<a href="<{$mbase}>/user/query/<{$item.last}>"><{$item.last}></a>
<{else}>
		<a href="<{$mbase}>/article/<{$bName}>/single/<{$item.gid}>"<{if $item.tag}> class="<{$item.tag}>"<{/if}>><{if $item.subject}>●&nbsp;<{/if}><{$item.title}></a><{if $threads}>(<{$item.num}>)<{/if}><br />
		<{if $item.top}>[提示]<{else}><{$item.pos}><{/if}>&nbsp;<{$item.postTime}>&nbsp;<a href="<{$mbase}>/user/query/<{$item.poster}>"><{$item.poster}></a>
<{/if}>
</li>
<{/foreach}>
<{else}>
<li>该版面没有任何主题</li>
<{/if}>
</ul>
<div class="sec nav">
<form action="<{$mbase}>/board/<{$bName}><{if !$threads}>/<{$mode}><{/if}>" method="get">
<{if $curPage != 1}>
	<a href="<{$mbase}>/board/<{$bName}><{if !$threads}>/<{$mode}><{/if}>?p=1">首页</a>|

	<a href="<{$mbase}>/board/<{$bName}><{if !$threads}>/<{$mode}><{/if}>?p=<{$curPage-1}>">上页</a>|
<{/if}>
<{if $curPage != $totalPage}>
	<a href="<{$mbase}>/board/<{$bName}><{if !$threads}>/<{$mode}><{/if}>?p=<{$curPage+1}>">下页</a>|
	<a href="<{$mbase}>/board/<{$bName}><{if !$threads}>/<{$mode}><{/if}>?p=<{$totalPage}>">尾页</a>|
<{/if}>
	<a class="plant"><{$curPage}>/<{$totalPage}></a>|
	<a class="plant">转到<input type="text" name="p" size="2" /><input type="submit" value="GO" class="btn" /></a>|
</form>
</div>
<{include file="../plugins/mobile/views/footer.tpl"}>
