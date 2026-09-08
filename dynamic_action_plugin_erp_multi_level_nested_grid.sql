--------------------------------------------------------------------------------
-- Copyright (c) 2024, 2026, المؤسسة العامة للطرق والجسور.
-- #G_CONNECTION_NAME# v2.1.0
--------------------------------------------------------------------------------
prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>100000
,p_default_application_id=>111
,p_default_id_offset=>437238032658578151
,p_default_owner=>'GCRBADMIN'
);
end;
/
 
prompt APPLICATION 111 - ERP_GCRB88
--
-- Application Export:
--   Application:     111
--   Name:            ERP_GCRB88
--   Date and Time:   22:34 Tuesday September 8, 2026
--   Exported By:     GCRB1
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 2211682078415307863
--   Manifest End
--   Version:         24.2.0
--   Instance ID:     716695067653462
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/erp_multi_level_nested_grid
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(2211682078415307863)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'ERP_MULTI_LEVEL_NESTED_GRID'
,p_display_name=>'ERP Multi-Level Nested Grid'
,p_category=>'EXECUTE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procedure validate_sql (p_sql in varchar2) is',
'begin',
'    if trim(p_sql) is null then',
'        raise_application_error(-20801, ''SQL Query is required.'');',
'    end if;',
'end validate_sql;',
'',
'function render_dynamic_action (',
'    p_dynamic_action in apex_plugin.t_dynamic_action,',
'    p_plugin         in apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_render_result',
'is',
'    l_result apex_plugin.t_dynamic_action_render_result;',
'    l_css    varchar2(32767);',
'    l_js     varchar2(32767);',
'begin',
'    l_css := ''.SUB_TABLE_EXPAND_BTN { display:inline-flex; align-items:center; justify-content:center; gap:6px; padding:3px 12px; font-size:11.5px; font-weight:700; border-radius:6px; cursor:pointer; transition:all .2s; } '' ||',
'             ''.SUB_TABLE_EXPAND_BTN:hover { transform:translateY(-1px); box-shadow:0 3px 8px rgba(0,0,0,.15); } '' ||',
'             ''.SUB_TABLE_EXPAND_BTN .SUB_TABLE_ARROW_ICON { font-size:9px; transition:transform .25s ease; } '' ||',
'             ''.SUB_TABLE_EXPAND_BTN.is-active .SUB_TABLE_ARROW_ICON { transform:rotate(90deg); } '' ||',
'             ''tr.SUB_TABLE_PARENT_ROW_ACTIVE { background-color:#f0f9ff !important; box-shadow:inset 4px 0 0 #0284c7; } '' ||',
'             ''tr.SUB_TABLE_HOST_ROW { height:auto !important; max-height:none !important; } '' ||',
'             ''tr.SUB_TABLE_HOST_ROW > td { height:auto !important; max-height:none !important; overflow:visible !important; white-space:normal !important; padding:0 !important; background-color:#f8fafc !important; border:none !important; } '' ||',
'             ''.lvl2-row-container { padding:10px 18px 16px 18px; } '' ||',
'             ''.lvl3-row-container { padding:10px 24px 16px 24px; background:#f8fafc; border-inline-start:4px solid #8b5cf6; } '' ||',
'             ''.SUB_TABLE_CONTAINER { background:#fff; border:1px solid #cbd5e1; border-radius:10px; box-shadow:0 8px 24px rgba(15,23,42,.08); overflow:hidden; } '' ||',
'             ''.SUB_TABLE_HEADER_RIBBON { position:sticky; top:0; z-index:20; display:flex; justify-content:space-between; align-items:center; padding:10px 16px; border-bottom:1px solid #e2e8f0; backdrop-filter:blur(6px); } '' ||',
'             ''.SUB_TABLE_TITLE_GROUP { display:flex; align-items:center; gap:8px; font-weight:700; font-size:13px; flex-wrap:wrap; } '' ||',
'             ''.SUB_TABLE_BADGE { display:inline-flex; align-items:center; gap:4px; font-size:11px; font-weight:700; padding:2px 9px; border-radius:20px; } '' ||',
'             ''.SUB_TABLE_PILL { display:inline-flex; align-items:center; gap:5px; padding:3px 10px; background:rgba(255,255,255,0.92); border:1px solid rgba(0,0,0,0.12); border-radius:6px; font-size:11.5px; font-weight:700; color:#1e293b; box-shadow:'
||'0 1px 2px rgba(0,0,0,0.04); margin-inline-start:6px; } '' ||',
'             ''.SUB_TABLE_CTRL_BTN { background:#fff; border:1px solid #cbd5e1; color:#475569; padding:4px 9px; border-radius:5px; cursor:pointer; font-size:11px; font-weight:600; transition:all .15s; } '' ||',
'             ''.SUB_TABLE_CTRL_BTN:hover { background:#f1f5f9; color:#0f172a; } '' ||',
'             ''.SUB_TABLE_CTRL_BTN.SUB_CLOSE:hover { background:#fee2e2; color:#dc2626; border-color:#fca5a5; } '' ||',
'             ''.SUB_TABLE_SEARCH_BOX { display:flex; align-items:center; gap:8px; padding:7px 16px; background:#fff; border-bottom:1px solid #f1f5f9; } '' ||',
'             ''.SUB_TABLE_SEARCH_INPUT { flex:1; max-width:300px; border:1px solid #cbd5e1; border-radius:6px; padding:5px 10px; font-size:12px; outline:none; transition:all .2s; } '' ||',
'             ''.SUB_TABLE_SEARCH_INPUT:focus { border-color:#0284c7; box-shadow:0 0 0 3px rgba(2,132,199,.15); } '' ||',
'             ''.SUB_TABLE_SCROLL { max-height:420px; overflow:auto; position:relative; } '' ||',
'             ''.SUB_TABLE_GRID { width:100%; border-collapse:separate; border-spacing:0; font-size:12px; } '' ||',
'             ''.SUB_TABLE_TH { position:sticky; top:0; z-index:10; padding:9px 12px; font-weight:700; text-align:center !important; vertical-align:middle !important; white-space:nowrap; } '' ||',
'             ''.SUB_TABLE_TD { padding:8px 12px; text-align:center !important; vertical-align:middle !important; border-bottom:1px solid #f1f5f9; white-space:nowrap; } '' ||',
'             ''.SUB_TABLE_LOADING, .SUB_TABLE_EMPTY { padding:24px; text-align:center; color:#64748b; font-weight:600; } '' ||',
'             ''.SUB_TABLE_ERROR { padding:14px; text-align:center; color:#b91c1c; background:#fef2f2; font-weight:700; border:1px solid #fecaca; border-radius:6px; } '' ||',
'             ''.STYLE_MODERN_BLUE .RIBBON_LVL2 { background:#f0f9ff; color:#0369a1; } .STYLE_MODERN_BLUE .SUB_TABLE_TH { background:#f8fafc; color:#334155; border-bottom:2px solid #0284c7; } .STYLE_MODERN_BLUE .SUB_TABLE_GRID tbody tr:hover { backgrou'
||'nd:#f0f9ff; } .STYLE_MODERN_BLUE .EXP_BTN_LVL1 { color:#0284c7; background:#f0f9ff; border:1px solid #bae6fd; } '' ||',
'             ''.STYLE_DARK_SLATE .RIBBON_LVL2 { background:#1e293b; color:#f8fafc; } .STYLE_DARK_SLATE .SUB_TABLE_TH { background:#334155; color:#fff; border-bottom:2px solid #0f172a; } .STYLE_DARK_SLATE .SUB_TABLE_GRID tbody tr:nth-child(even) { back'
||'ground:#f8fafc; } .STYLE_DARK_SLATE .SUB_TABLE_GRID tbody tr:hover { background:#e2e8f0; } .STYLE_DARK_SLATE .EXP_BTN_LVL1 { color:#fff; background:#334155; border:1px solid #1e293b; } '' ||',
'             ''.STYLE_EMERALD_MINT .RIBBON_LVL2 { background:#ecfdf5; color:#047857; } .STYLE_EMERALD_MINT .SUB_TABLE_TH { background:#f0fdf4; color:#166534; border-bottom:2px solid #059669; } .STYLE_EMERALD_MINT .SUB_TABLE_GRID tbody tr:hover { backg'
||'round:#f0fdf4; } .STYLE_EMERALD_MINT .EXP_BTN_LVL1 { color:#047857; background:#ecfdf5; border:1px solid #a7f3d0; } '' ||',
'             ''.STYLE_COMPACT_STRIPED .SUB_TABLE_TH { background:#e2e8f0; color:#1e293b; padding:5px 8px !important; font-size:11px !important; border-bottom:2px solid #94a3b8; } .STYLE_COMPACT_STRIPED .SUB_TABLE_TD { padding:4px 8px !important; font-'
||'size:11px !important; } .STYLE_COMPACT_STRIPED .SUB_TABLE_GRID tbody tr:nth-child(even) { background:#f8fafc; } .STYLE_COMPACT_STRIPED .SUB_TABLE_GRID tbody tr:hover { background:#f1f5f9; } .STYLE_COMPACT_STRIPED .EXP_BTN_LVL1 { color:#0284c7; backgr'
||'ound:#f0f9ff; border:1px solid #bae6fd; } '' ||',
'             ''.RIBBON_LVL3 { background:#f5f3ff !important; color:#6d28d9 !important; border-bottom-color:#ddd6fe !important; } .RIBBON_LVL3 .SUB_TABLE_BADGE { background:#ede9fe; color:#7c3aed; } .EXP_BTN_LVL2 { color:#7c3aed !important; background:'
||'#f5f3ff !important; border:1px solid #ddd6fe !important; } .EXP_BTN_LVL2:hover { background:#7c3aed !important; color:#fff !important; } .EXP_BTN_LVL2.is-active { background:#6d28d9 !important; color:#fff !important; }'';',
'',
'    l_js := ''(function(w,$,apex){"use strict";'' ||',
'            ''w.erpNestedGrid = w.erpNestedGrid || {}; w.erpNestedGridIG = w.erpNestedGrid; var NG = w.erpNestedGrid;'' ||',
'            ''function norm(v){ return v ? String(v).replace(/\u00a0/g," ").replace(/\s+/g," ").trim().toUpperCase() : ""; }'' ||',
'            ''NG.getItems = function(){ var o = {}; $("input[id^=P" + apex.env.APP_PAGE_ID + "_]").each(function(){'' ||',
'            ''if(this.id && this.id.indexOf("_CONTAINER") === -1 && this.id.indexOf("_LABEL") === -1){'' ||',
'            ''try{ var itm = apex.item(this.id); if(itm && itm.getValue){ var val = itm.getValue(); if(val !== undefined && val !== null) o[this.id.toUpperCase()] = Array.isArray(val) ? val.join(":") : String(val); } }catch(e){} } }); return o; };'' ||',
'            ''NG.findRowCell = function($row, colName){'' ||',
'            ''if(!colName) return null; var target = norm(colName); var $cells = $row.children("td"); if(!$cells.length) return null;'' ||',
'            ''var $table = $row.closest("table"); var matched = null;'' ||',
'            ''var $thList = $table.find("th");'' ||',
'            ''if(!$thList.length){ $thList = $row.closest(".a-IG, .t-Region").find(".a-GV-w-hdr table, .a-GV-hdr table").find("th"); }'' ||',
'            ''$thList.each(function(idx){'' ||',
'            ''if(matched) return; var $th = $(this); var txt = norm($th.text()); var dCol = norm($th.attr("data-apex-col")); var dName = norm($th.attr("data-column")); var thId = norm($th.attr("id"));'' ||',
'            ''if(txt === target || dCol === target || dName === target || thId === target || (target.length > 2 && (txt.indexOf(target) !== -1 || target.indexOf(txt) !== -1))){'' ||',
'            ''var lbl = $th.text().trim(); var rawId = $th.attr("id");'' ||',
'            ''if(rawId){ var $byH = $cells.filter(function(){ return String($(this).attr("headers")||"").split(" ").indexOf(rawId) !== -1; }).first(); if($byH.length){ matched = { cell: $byH, label: lbl }; return false; } }'' ||',
'            ''if(idx < $cells.length){ matched = { cell: $cells.eq(idx), label: lbl }; return false; } } });'' ||',
'            ''if(matched) return matched;'' ||',
'            ''var $direct = $cells.filter(function(){ var h = norm($(this).attr("headers")); return h === target || h.split(" ").indexOf(target) !== -1; }).first();'' ||',
'            ''if($direct.length) return { cell: $direct, label: colName };'' ||',
'            ''return null; };'' ||',
'            ''NG.getBadges = function($row, colsStr){'' ||',
'            ''if(!colsStr) return ""; var html = ""; var cols = colsStr.split(",");'' ||',
'            ''for(var i=0; i<cols.length; i++){'' ||',
'            ''var cName = cols[i].trim(); if(!cName) continue;'' ||',
'            ''var m = NG.findRowCell($row, cName);'' ||',
'            ''if(m && m.cell && m.cell.length){'' ||',
'            ''var val = m.cell.text().trim();'' ||',
'            ''if(val && val !== "-" && val.toLowerCase() !== "null"){'' ||',
'            ''html += "<span class=\"SUB_TABLE_PILL\"><i class=\"fa fa-tag\"></i> " + m.label + ": " + val + "</span>"; } } }'' ||',
'            ''return html; };'' ||',
'            ''NG.parseTitleConfig = function(rawStr){'' ||',
'            ''if(!rawStr) return { title: "", badges: "" };'' ||',
'            ''var parts = rawStr.split(":");'' ||',
'            ''return { title: parts[0].trim(), badges: parts.length > 1 ? parts[1].trim() : "" }; };'' ||',
'            ''NG.execute = function(){ var act = this.action;'' ||',
unistr('            ''var titles = (act.attribute06 || "\0627\0644\062A\0641\0627\0635\064A\0644 | \062A\0641\0627\0635\064A\0644 \0641\0631\0639\064A\0629").split("|");'' ||'),
'            ''var t2Cfg = NG.parseTitleConfig(titles[0]);'' ||',
'            ''var t3Cfg = NG.parseTitleConfig(titles.length > 1 ? titles[1] : "");'' ||',
'            ''var cfg = { sqlLvl2: act.attribute01 ? String(act.attribute01).trim() : null, targetRegion: act.attribute02 ? String(act.attribute02).trim() : null, keyLvl1: norm(act.attribute03 || "REQ_ID"), sqlLvl3: act.attribute04 ? String(act.attrib'
||unistr('ute04).trim() : null, keyLvl2: norm(act.attribute05 || "REQ_ROW_ID"), t2: t2Cfg.title || "\0627\0644\062A\0641\0627\0635\064A\0644", b2: t2Cfg.badges, t3: t3Cfg.title || "\062A\0641\0627\0635\064A\0644 \0641\0631\0639\064A\0629", b3: t3Cfg.badges, style: act.attribute07 || "MODERN_BLUE", search: act.attribute08 !== "N", rtl:')
||' act.attribute09 !== "N", ajax: act.ajaxIdentifier };'' ||',
'            ''if(!cfg.sqlLvl2) return;'' ||',
'            ''var run = function(){'' ||',
'            ''var region = cfg.targetRegion ? apex.region(cfg.targetRegion) : null;'' ||',
'            ''var $elem = region && region.element ? $(region.element) : (cfg.targetRegion ? $("#" + cfg.targetRegion) : $(".t-Region").first());'' ||',
'            ''var isIG = false; try{ if($elem.hasClass("a-IG") || $elem.find(".a-IG").length || (region && region.type === "InteractiveGrid")){ isIG = true; } }catch(e){}'' ||',
'            ''if(isIG){ NG.initIG(region, $elem, cfg); } else {'' ||',
'            ''var $tbl = $elem.find("table.a-IRR-table"); if(!$tbl.length) $tbl = $("table.a-IRR-table, table.t-Report-report").not(".SUB_TABLE_GRID").first();'' ||',
'            ''if($tbl.length) NG.initLvl($tbl, cfg, 1); } };'' ||',
'            ''run(); setTimeout(run, 300); setTimeout(run, 800);'' ||',
'            ''var attempts = 0; var poll = setInterval(function(){ run(); attempts++; if(attempts > 8) clearInterval(poll); }, 600);'' ||',
'            ''$(document).off("apexafterrefresh.lvl_univ interactivegridviewchange.lvl_univ gridpagechange.lvl_univ").on("apexafterrefresh.lvl_univ interactivegridviewchange.lvl_univ gridpagechange.lvl_univ", function(){ setTimeout(run, 150); }); };'' '
||'||',
'            ''NG.initIG = function(region, $elem, cfg){ try{'' ||',
'            ''var gView = null; if(region && typeof region.call === "function"){ try{ gView = region.call("getViews", "grid"); }catch(e){} }'' ||',
'            ''if(!gView && region && region.widget){ var ig$ = region.widget(); if(ig$ && typeof ig$.interactiveGrid === "function"){ gView = ig$.interactiveGrid("getViews", "grid"); } }'' ||',
'            ''var model = gView ? gView.model : null; var $tbl = $elem.find(".a-GV-bdy table.a-GV-table").last(); if(!$tbl.length) $tbl = $elem.find("table.a-GV-table").last(); if(!$tbl.length) return;'' ||',
'            ''var colIdx = -1; var $hdrTable = $elem.find(".a-GV-w-hdr table, .a-GV-hdr table");'' ||',
'            ''$hdrTable.find("th").each(function(idx){ var txt = norm($(this).text()); var dCol = norm($(this).attr("data-apex-col")); var id = norm($(this).attr("id")); if(txt === cfg.keyLvl1 || dCol === cfg.keyLvl1 || id.indexOf(cfg.keyLvl1) !== -1)'
||'{ colIdx = idx; return false; } });'' ||',
'            ''var $rows = $tbl.find("tbody > tr.a-GV-row"); if(!$rows.length) return;'' ||',
'            ''$rows.each(function(){ var $row = $(this); if($row.find(".EXP_BTN_LVL1").length) return;'' ||',
'            ''var raw = null; if(model){ var rId = $row.attr("data-id"); if(rId){ var rec = model.getRecord(rId); if(rec){ raw = model.getValue(rec, cfg.keyLvl1); if(typeof raw === "object" && raw !== null) raw = raw.v || raw.d; } } }'' ||',
'            ''var $cell = (colIdx >= 0) ? $row.children("td").eq(colIdx) : $();'' ||',
'            ''if(!$cell.length) $cell = $row.find("td").filter(function(){ var h = norm($(this).attr("headers")); return h.indexOf(cfg.keyLvl1) !== -1; }).first();'' ||',
'            ''if(!$cell.length) $cell = $row.find("td").not(".a-GV-cell--control").first(); if(!raw) raw = $cell.text().trim();'' ||',
'            ''if(!raw || raw === "-" || raw.toLowerCase() === "null") return; $row.data("lvl-val", String(raw));'' ||',
unistr('            ''var $btn = $("<button type=\005C"button\005C" class=\005C"SUB_TABLE_EXPAND_BTN EXP_BTN_LVL1\005C"><i class=\005C"fa fa-list-alt\005C"></i><span>\0639\0631\0636</span><i class=\005C"fa fa-chevron-right SUB_TABLE_ARROW_ICON\005C"></i></button>");'' ||'),
'            ''$cell.empty().css("text-align","center").append($btn); $btn.on("click", function(e){ e.preventDefault(); e.stopPropagation(); NG.toggle($row, cfg, $btn, 1); }); }); }catch(e){} };'' ||',
'            ''NG.initLvl = function($tbl, cfg, lvl){ var targetK = (lvl === 1) ? cfg.keyLvl1 : cfg.keyLvl2;'' ||',
'            ''var $rows = $tbl.find("tbody > tr, tr").filter(function(){ var $tr = $(this); return !$tr.hasClass("SUB_TABLE_HOST_ROW") && !$tr.hasClass("a-IRR-controlBreak") && !$tr.hasClass("a-IRR-aggregate") && !$tr.hasClass("a-IRR-noData") && $tr.c'
||'hildren("th").length === 0 && $tr.children("td").length > 1; });'' ||',
'            ''$rows.each(function(){ var $row = $(this); if($row.find(".EXP_BTN_LVL" + lvl).length) return;'' ||',
'            ''var m = NG.findRowCell($row, targetK); if(!m || !m.cell || !m.cell.length) return; var $cell = m.cell;'' ||',
'            ''var raw = $cell.text().trim();'' ||',
unistr('            ''if(!raw || raw === "-" || raw.toLowerCase() === "null" || /^(\0645\062C\0645\0648\0639|\0627\0644\0645\062C\0645\0648\0639|total|sum)$/i.test(raw)) return;'' ||'),
unistr('            ''$row.data("lvl-val", raw); var btnCls = "SUB_TABLE_EXPAND_BTN EXP_BTN_LVL" + lvl + (lvl===2 ? " EXP_BTN_LVL2" : ""); var lbl = (lvl===1 ? "\0639\0631\0636" : "\062A\0641\0627\0635\064A\0644"); var ico = (lvl===1 ? "fa-list-alt" : "fa-level-down");'' ||'),
'            ''var $btn = $("<button type=\"button\" class=\"" + btnCls + "\"><i class=\"fa " + ico + "\"></i><span>" + lbl + "</span><i class=\"fa fa-chevron-right SUB_TABLE_ARROW_ICON\"></i></button>");'' ||',
'            ''$cell.empty().css("text-align","center").append($btn); $btn.on("click", function(e){ e.preventDefault(); e.stopPropagation(); NG.toggle($row, cfg, $btn, lvl); }); }); };'' ||',
'            ''NG.toggle = function($row, cfg, $btn, lvl){ var $next = $row.next(".HOST_LVL" + lvl); if($next.length){ $next.toggle(); var isOp = $next.is(":visible"); $btn.toggleClass("is-active", isOp); $row.toggleClass("SUB_TABLE_PARENT_ROW_ACTIVE",'
||' isOp); return; }'' ||',
'            ''var span = $row.children("td").length || 15; var nxtLvl = lvl + 1;'' ||',
'            ''var $det = $("<tr class=\"SUB_TABLE_HOST_ROW HOST_LVL" + lvl + "\"><td colspan=\"" + span + "\"><div class=\"lvl" + nxtLvl + "-row-container\"><div class=\"SUB_TABLE_CONTAINER\"><div class=\"SUB_TABLE_LOADING\"><span class=\"u-Processing'
||unistr('-spinner\005C"></span><span>\062C\0627\0631\064A \0627\0644\062A\062D\0645\064A\0644...</span></div></div></div></td></tr>");'' ||'),
'            ''$row.after($det); $btn.addClass("is-active"); $row.addClass("SUB_TABLE_PARENT_ROW_ACTIVE"); NG.fetch($row, $det.find(".SUB_TABLE_CONTAINER"), cfg, $btn, nxtLvl); };'' ||',
'            ''NG.fetch = function($row, $cont, cfg, $btn, targetLvl){ var p = NG.getItems(); var val = $row.data("lvl-val");'' ||',
'            ''if(targetLvl === 2){ p[cfg.keyLvl1] = val; p["REQ_ID"] = val; p["ACC_ID"] = val; } else { p[cfg.keyLvl2] = val; p["REQ_ROW_ID"] = val; p["PEXPREV_ID"] = val; }'' ||',
unistr('            ''apex.server.plugin(cfg.ajax, { x02: JSON.stringify(p), x05: String(targetLvl) }, { success: function(d){ if(d && d.success) NG.render($cont, d, cfg, $row, $btn, targetLvl); else { var err = d && d.message ? d.message : "\062A\0639\0630\0631 \062C\0644\0628 \0627\0644\0628\064A\0627\0646\0627\062A')
||unistr('"; $cont.html("<div class=\005C"SUB_TABLE_ERROR\005C"><i class=\005C"fa fa-exclamation-triangle\005C"></i> " + err + "</div>"); } }, error: function(xhr, s, e){ $cont.html("<div class=\005C"SUB_TABLE_ERROR\005C"><i class=\005C"fa fa-plug\005C"></i> \0641\0634\0644 \0627\0644\0627\062A\0635\0627\0644 \0628\0627\0644\0633\064A\0631\0641\0631: " + e + "</')
||'div>"); } }); };'' ||',
'            ''NG.render = function($cont, d, cfg, $pRow, $btn, lvl){'' ||',
'            ''var title = (lvl === 2) ? cfg.t2 : cfg.t3;'' ||',
'            ''var badgeCols = (lvl === 2) ? cfg.b2 : cfg.b3;'' ||',
'            ''var badges = NG.getBadges($pRow, badgeCols);'' ||',
'            ''if(!d.rows || !d.rows.length){ $cont.html("<div class=\"SUB_TABLE_HEADER_RIBBON RIBBON_LVL" + lvl + "\"><div class=\"SUB_TABLE_TITLE_GROUP\"><i class=\"fa fa-table\"></i> " + title + badges + "</div><button type=\"button\" class=\"SUB_TA'
||unistr('BLE_CTRL_BTN SUB_CLOSE\005C"><i class=\005C"fa fa-times\005C"></i></button></div><div class=\005C"SUB_TABLE_EMPTY\005C"><i class=\005C"fa fa-info-circle\005C"></i> \0644\0627 \062A\0648\062C\062F \062D\0631\0643\0627\062A \0645\0633\062C\0644\0629 \0644\0647\0630\0627 \0627\0644\0633\062C\0644.</div>"); $cont.find(".SUB_CLOSE").on("click", function(){ NG.toggle($pRow, cfg, $b')
||'tn, lvl-1); }); return; }'' ||',
'            ''var dir = cfg.rtl ? "dir=\"rtl\"" : "dir=\"ltr\""; var h = "<div " + dir + " class=\"STYLE_" + cfg.style + "\">";'' ||',
'            ''h += "<div class=\"SUB_TABLE_HEADER_RIBBON RIBBON_LVL" + lvl + "\"><div class=\"SUB_TABLE_TITLE_GROUP\"><i class=\"fa fa-folder-open\"></i> " + title + badges + " <span class=\"SUB_TABLE_BADGE\"><i class=\"fa fa-check-circle\"></i> " + d'
||unistr('.rows.length + " \062D\0631\0643\0629</span></div>";'' ||'),
unistr('            ''h += "<div class=\005C"SUB_TABLE_CONTROLS\005C"><button type=\005C"button\005C" class=\005C"SUB_TABLE_CTRL_BTN SUB_CLOSE\005C" title=\005C"\0625\063A\0644\0627\0642\005C"><i class=\005C"fa fa-times\005C"></i></button></div></div>";'' ||'),
unistr('            ''if(cfg.search){ h += "<div class=\005C"SUB_TABLE_SEARCH_BOX\005C"><i class=\005C"fa fa-search\005C"></i><input type=\005C"text\005C" class=\005C"SUB_TABLE_SEARCH_INPUT\005C" placeholder=\005C"\0628\062D\062B \0633\0631\064A\0639 \0641\064A \0627\0644\0646\062A\0627\0626\062C...\005C"></div>"; }'' ||'),
'            ''h += "<div class=\"SUB_TABLE_SCROLL\"><table class=\"SUB_TABLE_GRID GRID_LVL" + lvl + "\"><thead><tr>";'' ||',
'            ''d.columns.forEach(function(c){ h += "<th class=\"SUB_TABLE_TH\">" + (c.label||c.name) + "</th>"; }); h += "</tr></thead><tbody>";'' ||',
'            ''d.rows.forEach(function(r){ h += "<tr class=\"SUB_TABLE_ROW\">"; r.forEach(function(v){ h += "<td class=\"SUB_TABLE_TD\">" + (v !== null ? v : "-") + "</td>"; }); h += "</tr>"; });'' ||',
'            ''h += "</tbody></table></div></div>"; $cont.html(h);'' ||',
'            ''$cont.find(".SUB_CLOSE").on("click", function(){ NG.toggle($pRow, cfg, $btn, lvl-1); });'' ||',
'            ''if(cfg.search){ $cont.find(".SUB_TABLE_SEARCH_INPUT").on("keyup", function(){ var filter = String($(this).val()||"").toLowerCase().trim(); $cont.find(".SUB_TABLE_GRID tbody tr").each(function(){ var rowText = $(this).text().toLowerCase()'
||'; $(this).toggle(!filter || rowText.indexOf(filter) > -1); }); }); }'' ||',
'            ''if(lvl === 2 && cfg.sqlLvl3){ NG.initLvl($cont.find("table.GRID_LVL2"), cfg, 2); } };'' ||',
'            ''})(window, apex.jQuery, apex);'';',
'',
'    apex_css.add(p_css => l_css, p_key => ''ERP_NESTED_GRID_CSS'');',
'    apex_javascript.add_onload_code(p_code => l_js, p_key => ''ERP_NESTED_GRID_JS'');',
'',
'    l_result.javascript_function := ''erpNestedGrid.execute'';',
'    l_result.ajax_identifier     := apex_plugin.get_ajax_identifier;',
'',
'    l_result.attribute_01 := p_dynamic_action.attribute_01;',
'    l_result.attribute_02 := p_dynamic_action.attribute_02;',
'    l_result.attribute_03 := p_dynamic_action.attribute_03;',
'    l_result.attribute_04 := p_dynamic_action.attribute_04;',
'    l_result.attribute_05 := p_dynamic_action.attribute_05;',
'    l_result.attribute_06 := p_dynamic_action.attribute_06;',
'    l_result.attribute_07 := p_dynamic_action.attribute_07;',
'    l_result.attribute_08 := p_dynamic_action.attribute_08;',
'    l_result.attribute_09 := p_dynamic_action.attribute_09;',
'',
'    return l_result;',
'end render_dynamic_action;',
'',
'function ajax_callback (',
'    p_dynamic_action in apex_plugin.t_dynamic_action,',
'    p_plugin         in apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_ajax_result',
'is',
'    l_result        apex_plugin.t_dynamic_action_ajax_result;',
'    l_sql           varchar2(32767);',
'    l_sql_page      varchar2(32767);',
'    l_level         varchar2(10) := nvl(apex_application.g_x05, ''2'');',
'    l_filters       json_object_t;',
'    l_cursor        integer;',
'    l_exec          integer;',
'    l_columns       dbms_sql.desc_tab2;',
'    l_column_count  pls_integer;',
'    l_number        number;',
'    l_date          date;',
'    l_varchar       varchar2(32767);',
'    l_row_number    pls_integer := 0;',
'',
'    procedure bind_vars(p_cur in integer, p_query in varchar2) is',
'        l_var_name varchar2(100);',
'        l_var_val  varchar2(32767);',
'        l_pos      pls_integer := 1;',
'    begin',
'        loop',
'            l_var_name := regexp_substr(p_query, '':([A-Za-z0-9_$#]+)'', 1, l_pos, ''i'', 1);',
'            exit when l_var_name is null;',
'            l_var_name := upper(l_var_name);',
'            l_var_val  := null;',
'            if l_filters is not null and l_filters.has(l_var_name) then',
'                l_var_val := l_filters.get_string(l_var_name);',
'            elsif l_filters is not null and l_filters.has(lower(l_var_name)) then',
'                l_var_val := l_filters.get_string(lower(l_var_name));',
'            else',
'                l_var_val := v(l_var_name);',
'            end if;',
'            begin',
'                dbms_sql.bind_variable(p_cur, '':'' || l_var_name, l_var_val);',
'            exception when others then null; end;',
'            l_pos := l_pos + 1;',
'        end loop;',
'    end bind_vars;',
'begin',
'    if l_level = ''3'' and p_dynamic_action.attribute_04 is not null then',
'        l_sql := p_dynamic_action.attribute_04;',
'    else',
'        l_sql := p_dynamic_action.attribute_01;',
'    end if;',
'',
'    l_sql := rtrim(trim(l_sql), '';'');',
'    validate_sql(l_sql);',
'',
'    if apex_application.g_x02 is not null then',
'        begin',
'            l_filters := json_object_t.parse(apex_application.g_x02);',
'        exception when others then null; end;',
'    end if;',
'',
'    l_sql_page := ''SELECT * FROM ('' || l_sql || '') WHERE ROWNUM <= 250'';',
'    l_cursor := dbms_sql.open_cursor;',
'    begin',
'        dbms_sql.parse(l_cursor, l_sql_page, dbms_sql.native);',
'        bind_vars(l_cursor, l_sql_page);',
'        dbms_sql.describe_columns2(l_cursor, l_column_count, l_columns);',
'        for i in 1 .. l_column_count loop',
'            if l_columns(i).col_type = 2 then dbms_sql.define_column(l_cursor, i, l_number);',
'            elsif l_columns(i).col_type = 12 then dbms_sql.define_column(l_cursor, i, l_date);',
'            else dbms_sql.define_column(l_cursor, i, l_varchar, 32767);',
'            end if;',
'        end loop;',
'        l_exec := dbms_sql.execute(l_cursor);',
'',
'        apex_json.open_object;',
'        apex_json.write(''success'', true);',
'        apex_json.write(''level'', l_level);',
'        apex_json.open_array(''columns'');',
'        for i in 1 .. l_column_count loop',
'            apex_json.open_object;',
'            apex_json.write(''name'', l_columns(i).col_name);',
'            apex_json.write(''label'', l_columns(i).col_name);',
'            apex_json.close_object;',
'        end loop;',
'        apex_json.close_array;',
'',
'        apex_json.open_array(''rows'');',
'        while dbms_sql.fetch_rows(l_cursor) > 0 loop',
'            l_row_number := l_row_number + 1;',
'            apex_json.open_array;',
'            for i in 1 .. l_column_count loop',
'                if l_columns(i).col_type = 2 then',
'                    dbms_sql.column_value(l_cursor, i, l_number);',
'                    apex_json.write(l_number);',
'                elsif l_columns(i).col_type = 12 then',
'                    dbms_sql.column_value(l_cursor, i, l_date);',
'                    apex_json.write(to_char(l_date, ''YYYY-MM-DD''));',
'                else',
'                    dbms_sql.column_value(l_cursor, i, l_varchar);',
'                    apex_json.write(l_varchar);',
'                end if;',
'            end loop;',
'            apex_json.close_array;',
'        end loop;',
'        apex_json.close_array;',
'        apex_json.write(''returned'', l_row_number);',
'        apex_json.close_object;',
'        dbms_sql.close_cursor(l_cursor);',
'    exception',
'        when others then',
'            if dbms_sql.is_open(l_cursor) then dbms_sql.close_cursor(l_cursor); end if;',
'            apex_json.open_object;',
'            apex_json.write(''success'', false);',
unistr('            apex_json.write(''message'', ''\062E\0637\0623 SQL \0641\064A \0627\0644\0645\0633\062A\0648\0649 '' || l_level || '': '' || sqlerrm);'),
'            apex_json.close_object;',
'    end;',
'    return l_result;',
'end ajax_callback;'))
,p_api_version=>1
,p_render_function=>'render_dynamic_action'
,p_ajax_function=>'ajax_callback'
,p_substitute_attributes=>true
,p_version_scn=>1362056952
,p_subscribe_plugin_settings=>false
,p_help_text=>unistr('\0628\0644\062C\0646 \0634\0627\0645\0644 \0648\0645\0633\062A\0642\0644 \062A\0645\0627\0645\0627\064B \0645\062A\0639\062F\062F \0627\0644\0645\0633\062A\0648\064A\0627\062A \064A\062F\0639\0645 \0628\0637\0627\0642\0627\062A \0627\0644\0639\0646\0627\0648\064A\0646 \0627\0644\0630\0643\064A\0629 \0644\0644\0640 IR \0648\0627\0644\0640 IG.')
,p_version_identifier=>'8.4.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2211682078415307873)
,p_plugin_id=>wwv_flow_imp.id(2211682078415307863)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Level 2 SQL (Detail)'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2211682078415307877)
,p_plugin_id=>wwv_flow_imp.id(2211682078415307863)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Region Static ID'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2211682078415307878)
,p_plugin_id=>wwv_flow_imp.id(2211682078415307863)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Level 1 Key Column (REQ_ID / ACC_ID)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2211682078415307875)
,p_plugin_id=>wwv_flow_imp.id(2211682078415307863)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Level 3 SQL (Sub-Detail Optional)'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2211682078415307876)
,p_plugin_id=>wwv_flow_imp.id(2211682078415307863)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Level 2 Key Column (REQ_ROW_ID / PEXPREV_ID)'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2211682078415307879)
,p_plugin_id=>wwv_flow_imp.id(2211682078415307863)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Titles & Badges (Title : Badges | Title : Badges)'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>unistr('\062A\0641\0627\0635\064A\0644 \0627\0644\0628\0646\062F : \0627\0633\0645 \0627\0644\0628\0646\062F, \0627\0644\0645\0628\0644\063A | \062A\0641\0627\0635\064A\0644 \0627\0644\0633\0646\062F : \0631\0642\0645 \0627\0644\0633\0646\062F / \0641\062A\062D, \0627\0644\0645\0628\0644\063A')
,p_is_translatable=>true
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2211682078415307880)
,p_plugin_id=>wwv_flow_imp.id(2211682078415307863)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Table Style'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'MODERN_BLUE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2211682078415307941)
,p_plugin_attribute_id=>wwv_flow_imp.id(2211682078415307880)
,p_display_sequence=>10
,p_display_value=>unistr('\0627\0644\0623\0632\0631\0642 \0627\0644\0645\0624\0633\0633\064A \0627\0644\0641\0627\062E\0631 (Modern Blue)')
,p_return_value=>'MODERN_BLUE'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2211682078415307942)
,p_plugin_attribute_id=>wwv_flow_imp.id(2211682078415307880)
,p_display_sequence=>20
,p_display_value=>unistr('\0627\0644\0631\0645\0627\062F\064A \0627\0644\0645\0627\0644\064A \0639\0627\0644\064A \0627\0644\062A\0628\0627\064A\0646 (Dark Slate)')
,p_return_value=>'DARK_SLATE'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2211682078415307943)
,p_plugin_attribute_id=>wwv_flow_imp.id(2211682078415307880)
,p_display_sequence=>30
,p_display_value=>unistr('\0627\0644\0632\0645\0631\062F\064A \0627\0644\0645\062D\0627\0633\0628\064A (Emerald Mint)')
,p_return_value=>'EMERALD_MINT'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2211682078415307944)
,p_plugin_attribute_id=>wwv_flow_imp.id(2211682078415307880)
,p_display_sequence=>40
,p_display_value=>unistr('\0627\0644\0645\062D\0627\0633\0628\064A \0627\0644\0645\0643\062B\0641 \0627\0644\0645\062E\0637\0637 (Compact Striped)')
,p_return_value=>'COMPACT_STRIPED'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2211682078415307882)
,p_plugin_id=>wwv_flow_imp.id(2211682078415307863)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Enable Quick Search'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2211682078415307881)
,p_plugin_id=>wwv_flow_imp.id(2211682078415307863)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'RTL Layout'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
