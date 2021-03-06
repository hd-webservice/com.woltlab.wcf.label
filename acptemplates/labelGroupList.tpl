{include file='header'}

<header class="mainHeading">
	<img src="{@RELATIVE_WCF_DIR}icon/label1.svg" alt="" />
	<hgroup>
		<h1>{lang}wcf.acp.label.group.list{/lang}</h1>
		<h2>{lang}wcf.acp.label.group.subtitle{/lang}</h2>
	</hgroup>
	
	<script type="text/javascript">
		//<![CDATA[
		$(function() {
			new WCF.Action.Delete('wcf\\data\\label\\group\\LabelGroupAction', $('.labelGroupRow'));
		});
		//]]>
	</script>
</header>

<div class="contentHeader">
	{pages print=true assign=pagesLinks controller="LabelGroupList" link="pageNo=%d"}
	
	{if $__wcf->session->getPermission('admin.content.label.group.canAddLabelGroup')}
		<nav>
			<ul class="largeButtons">
				<li><a href="{link controller='LabelGroupAdd'}{/link}" title="{lang}wcf.acp.label.group.add{/lang}"><img src="{@RELATIVE_WCF_DIR}icon/add1.svg" alt="" /> <span>{lang}wcf.acp.label.group.add{/lang}</span></a></li>
			</ul>
		</nav>
	{/if}
</div>

{hascontent}
	<div class="border boxTitle">
		<hgroup>
			<h1>{lang}wcf.acp.label.group.list{/lang} <span class="badge" title="{lang}wcf.acp.label.group.list.count{/lang}">{#$items}</span></h1>
		</hgroup>
		
		<table>
			<thead>
				<tr>
					<th class="columnID columnLabelGroupID" colspan="2">{lang}wcf.global.objectID{/lang}</th>
					<th class="columnText columnLabel">{lang}wcf.acp.label.group.label{/lang}</th>
					
					{event name='headColumns'}
				</tr>
			</thead>
			
			<tbody>
				{content}
					{foreach from=$objects item=group}
						<tr class="labelGroupRow">
							<td class="columnIcon">
								{if $group->isEditable()}
									<a href="{link controller='LabelGroupEdit' id=$group->groupID}{/link}"><img src="{@RELATIVE_WCF_DIR}icon/edit1.svg" alt="" title="{lang}wcf.global.button.edit{/lang}" class="balloonTooltip" /></a>
								{else}
									<img src="{@RELATIVE_WCF_DIR}icon/edit1D.svg" alt="" title="{lang}wcf.global.button.edit{/lang}" />
								{/if}
								{if $group->isDeletable()}
									<img src="{@RELATIVE_WCF_DIR}icon/delete1.svg" alt="" title="{lang}wcf.global.button.delete{/lang}" class="deleteButton balloonTooltip" data-object-id="{@$group->groupID}" data-confirm-message="{lang}wcf.acp.label.group.delete.sure{/lang}" />
								{else}
									<img src="{@RELATIVE_WCF_DIR}icon/delete1D.svg" alt="" title="{lang}wcf.global.button.delete{/lang}" />
								{/if}

								{event name='buttons'}
							</td>
							<td class="columnID"><p>{@$group->groupID}</p></td>
							<td class="columnText columnLabel"><p class="{$group->cssClassName}">{lang}{$group->groupName}{/lang}</p></td>
					
							{event name='columns'}
						</tr>
					{/foreach}
				{/content}
			</tbody>
		</table>
		
	</div>
	
	<div class="contentFooter">
		{@$pagesLinks}
		
		{if $__wcf->session->getPermission('admin.content.label.group.canAddLabelGroup')}
			<nav>
				<ul class="largeButtons">
					<li><a href="{link controller='LabelGroupAdd'}{/link}" title="{lang}wcf.acp.label.group.add{/lang}"><img src="{@RELATIVE_WCF_DIR}icon/add1.svg" alt="" /> <span>{lang}wcf.acp.label.group.add{/lang}</span></a></li>
				</ul>
			</nav>
		{/if}
	</div>
{hascontentelse}
	<div class="border content">
		<div class="container-1">
			<p class="warning">{lang}wcf.acp.label.group.noneAvailable{/lang}</p>
		</div>
	</div>
{/hascontent}

{include file='footer'}
