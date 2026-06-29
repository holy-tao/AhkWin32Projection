#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global TVI_ROOT := -65536

/**
 * @type {Integer (Int32)}
 */
export global TVI_FIRST := -65535

/**
 * @type {Integer (Int32)}
 */
export global TVI_LAST := -65534

/**
 * @type {Integer (Int32)}
 */
export global TVI_SORT := -65533

/**
 * @type {Integer (UInt32)}
 */
export global NM_FIRST := 0

/**
 * @type {Integer (UInt32)}
 */
export global NM_OUTOFMEMORY := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global NM_CLICK := 4294967294

/**
 * @type {Integer (UInt32)}
 */
export global NM_DBLCLK := 4294967293

/**
 * @type {Integer (UInt32)}
 */
export global NM_RETURN := 4294967292

/**
 * @type {Integer (UInt32)}
 */
export global NM_RCLICK := 4294967291

/**
 * @type {Integer (UInt32)}
 */
export global NM_RDBLCLK := 4294967290

/**
 * @type {Integer (UInt32)}
 */
export global NM_SETFOCUS := 4294967289

/**
 * @type {Integer (UInt32)}
 */
export global NM_KILLFOCUS := 4294967288

/**
 * @type {Integer (UInt32)}
 */
export global NM_CUSTOMDRAW := 4294967284

/**
 * @type {Integer (UInt32)}
 */
export global NM_HOVER := 4294967283

/**
 * @type {Integer (UInt32)}
 */
export global NM_NCHITTEST := 4294967282

/**
 * @type {Integer (UInt32)}
 */
export global NM_KEYDOWN := 4294967281

/**
 * @type {Integer (UInt32)}
 */
export global NM_RELEASEDCAPTURE := 4294967280

/**
 * @type {Integer (UInt32)}
 */
export global NM_SETCURSOR := 4294967279

/**
 * @type {Integer (UInt32)}
 */
export global NM_CHAR := 4294967278

/**
 * @type {Integer (UInt32)}
 */
export global NM_TOOLTIPSCREATED := 4294967277

/**
 * @type {Integer (UInt32)}
 */
export global NM_LDOWN := 4294967276

/**
 * @type {Integer (UInt32)}
 */
export global NM_RDOWN := 4294967275

/**
 * @type {Integer (UInt32)}
 */
export global NM_THEMECHANGED := 4294967274

/**
 * @type {Integer (UInt32)}
 */
export global NM_FONTCHANGED := 4294967273

/**
 * @type {Integer (UInt32)}
 */
export global NM_CUSTOMTEXT := 4294967272

/**
 * @type {Integer (UInt32)}
 */
export global NM_TVSTATEIMAGECHANGING := 4294967272

/**
 * @type {Integer (UInt32)}
 */
export global EM_SCROLLCARET := 183

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETLIMITTEXT := 197

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETLIMITTEXT := 213

/**
 * @type {Integer (UInt32)}
 */
export global EM_POSFROMCHAR := 214

/**
 * @type {Integer (UInt32)}
 */
export global EM_CHARFROMPOS := 215

/**
 * @type {Integer (UInt32)}
 */
export global HOTKEYF_EXT := 8

/**
 * @type {Integer (UInt32)}
 */
export global WM_CTLCOLOR := 25

/**
 * @type {Integer (UInt32)}
 */
export global ODT_HEADER := 100

/**
 * @type {Integer (UInt32)}
 */
export global LVM_FIRST := 4096

/**
 * @type {Integer (UInt32)}
 */
export global TV_FIRST := 4352

/**
 * @type {Integer (UInt32)}
 */
export global HDM_FIRST := 4608

/**
 * @type {Integer (UInt32)}
 */
export global TCM_FIRST := 4864

/**
 * @type {Integer (UInt32)}
 */
export global PGM_FIRST := 5120

/**
 * @type {Integer (UInt32)}
 */
export global ECM_FIRST := 5376

/**
 * @type {Integer (UInt32)}
 */
export global BCM_FIRST := 5632

/**
 * @type {Integer (UInt32)}
 */
export global CBM_FIRST := 5888

/**
 * @type {Integer (UInt32)}
 */
export global CCM_FIRST := 8192

/**
 * @type {Integer (UInt32)}
 */
export global CCM_LAST := 8704

/**
 * @type {Integer (UInt32)}
 */
export global CCM_SETBKCOLOR := 8193

/**
 * @type {Integer (UInt32)}
 */
export global CCM_SETCOLORSCHEME := 8194

/**
 * @type {Integer (UInt32)}
 */
export global CCM_GETCOLORSCHEME := 8195

/**
 * @type {Integer (UInt32)}
 */
export global CCM_GETDROPTARGET := 8196

/**
 * @type {Integer (UInt32)}
 */
export global CCM_SETUNICODEFORMAT := 8197

/**
 * @type {Integer (UInt32)}
 */
export global CCM_GETUNICODEFORMAT := 8198

/**
 * @type {Integer (UInt32)}
 */
export global COMCTL32_VERSION := 6

/**
 * @type {Integer (UInt32)}
 */
export global CCM_SETVERSION := 8199

/**
 * @type {Integer (UInt32)}
 */
export global CCM_GETVERSION := 8200

/**
 * @type {Integer (UInt32)}
 */
export global CCM_SETNOTIFYWINDOW := 8201

/**
 * @type {Integer (UInt32)}
 */
export global CCM_SETWINDOWTHEME := 8203

/**
 * @type {Integer (UInt32)}
 */
export global CCM_DPISCALE := 8204

/**
 * @type {Integer (UInt32)}
 */
export global INFOTIPSIZE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global NM_LAST := 4294967197

/**
 * @type {Integer (UInt32)}
 */
export global LVN_FIRST := 4294967196

/**
 * @type {Integer (UInt32)}
 */
export global LVN_LAST := 4294967097

/**
 * @type {Integer (UInt32)}
 */
export global HDN_FIRST := 4294966996

/**
 * @type {Integer (UInt32)}
 */
export global HDN_LAST := 4294966897

/**
 * @type {Integer (UInt32)}
 */
export global TVN_FIRST := 4294966896

/**
 * @type {Integer (UInt32)}
 */
export global TVN_LAST := 4294966797

/**
 * @type {Integer (UInt32)}
 */
export global TTN_FIRST := 4294966776

/**
 * @type {Integer (UInt32)}
 */
export global TTN_LAST := 4294966747

/**
 * @type {Integer (UInt32)}
 */
export global TCN_FIRST := 4294966746

/**
 * @type {Integer (UInt32)}
 */
export global TCN_LAST := 4294966716

/**
 * @type {Integer (UInt32)}
 */
export global CDN_FIRST := 4294966695

/**
 * @type {Integer (UInt32)}
 */
export global CDN_LAST := 4294966597

/**
 * @type {Integer (UInt32)}
 */
export global TBN_FIRST := 4294966596

/**
 * @type {Integer (UInt32)}
 */
export global TBN_LAST := 4294966576

/**
 * @type {Integer (UInt32)}
 */
export global UDN_FIRST := 4294966575

/**
 * @type {Integer (UInt32)}
 */
export global UDN_LAST := 4294966567

/**
 * @type {Integer (UInt32)}
 */
export global DTN_FIRST := 4294966556

/**
 * @type {Integer (UInt32)}
 */
export global DTN_LAST := 4294966551

/**
 * @type {Integer (UInt32)}
 */
export global MCN_FIRST := 4294966550

/**
 * @type {Integer (UInt32)}
 */
export global MCN_LAST := 4294966544

/**
 * @type {Integer (UInt32)}
 */
export global DTN_FIRST2 := 4294966543

/**
 * @type {Integer (UInt32)}
 */
export global DTN_LAST2 := 4294966497

/**
 * @type {Integer (UInt32)}
 */
export global CBEN_FIRST := 4294966496

/**
 * @type {Integer (UInt32)}
 */
export global CBEN_LAST := 4294966466

/**
 * @type {Integer (UInt32)}
 */
export global RBN_FIRST := 4294966465

/**
 * @type {Integer (UInt32)}
 */
export global RBN_LAST := 4294966437

/**
 * @type {Integer (UInt32)}
 */
export global IPN_FIRST := 4294966436

/**
 * @type {Integer (UInt32)}
 */
export global IPN_LAST := 4294966417

/**
 * @type {Integer (UInt32)}
 */
export global SBN_FIRST := 4294966416

/**
 * @type {Integer (UInt32)}
 */
export global SBN_LAST := 4294966397

/**
 * @type {Integer (UInt32)}
 */
export global PGN_FIRST := 4294966396

/**
 * @type {Integer (UInt32)}
 */
export global PGN_LAST := 4294966346

/**
 * @type {Integer (UInt32)}
 */
export global WMN_FIRST := 4294966296

/**
 * @type {Integer (UInt32)}
 */
export global WMN_LAST := 4294966096

/**
 * @type {Integer (UInt32)}
 */
export global BCN_FIRST := 4294966046

/**
 * @type {Integer (UInt32)}
 */
export global BCN_LAST := 4294965946

/**
 * @type {Integer (UInt32)}
 */
export global TRBN_FIRST := 4294965795

/**
 * @type {Integer (UInt32)}
 */
export global TRBN_LAST := 4294965777

/**
 * @type {Integer (UInt32)}
 */
export global EN_FIRST := 4294965776

/**
 * @type {Integer (UInt32)}
 */
export global EN_LAST := 4294965756

/**
 * @type {Integer (UInt32)}
 */
export global MSGF_COMMCTRL_BEGINDRAG := 16896

/**
 * @type {Integer (UInt32)}
 */
export global MSGF_COMMCTRL_SIZEHEADER := 16897

/**
 * @type {Integer (UInt32)}
 */
export global MSGF_COMMCTRL_DRAGSELECT := 16898

/**
 * @type {Integer (UInt32)}
 */
export global MSGF_COMMCTRL_TOOLBARCUST := 16899

/**
 * @type {Integer (UInt32)}
 */
export global CDRF_DODEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CDRF_NEWFONT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CDRF_SKIPDEFAULT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CDRF_DOERASE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CDRF_SKIPPOSTPAINT := 256

/**
 * @type {Integer (UInt32)}
 */
export global CDRF_NOTIFYPOSTPAINT := 16

/**
 * @type {Integer (UInt32)}
 */
export global CDRF_NOTIFYITEMDRAW := 32

/**
 * @type {Integer (UInt32)}
 */
export global CDRF_NOTIFYSUBITEMDRAW := 32

/**
 * @type {Integer (UInt32)}
 */
export global CDRF_NOTIFYPOSTERASE := 64

/**
 * @type {Integer (UInt32)}
 */
export global CDDS_POSTERASE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CDDS_ITEM := 65536

/**
 * @type {Integer (UInt32)}
 */
export global NM_GETCUSTOMSPLITRECT := 4294966049

/**
 * @type {Integer (Int32)}
 */
export global CLR_NONE := -1

/**
 * @type {Integer (Int32)}
 */
export global CLR_DEFAULT := -16777216

/**
 * @type {Integer (Int32)}
 */
export global CLR_HILIGHT := -16777216

/**
 * @type {Integer (UInt32)}
 */
export global ILS_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global ILS_GLOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global ILS_SHADOW := 2

/**
 * @type {Integer (UInt32)}
 */
export global ILS_SATURATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global ILS_ALPHA := 8

/**
 * @type {Integer (UInt32)}
 */
export global ILGT_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global ILGT_ASYNC := 1

/**
 * @type {String}
 */
export global WC_HEADERA := "SysHeader32"

/**
 * @type {String}
 */
export global WC_HEADERW := "SysHeader32"

/**
 * @type {String}
 */
export global WC_HEADER := "SysHeader32"

/**
 * @type {Integer (UInt32)}
 */
export global HDS_HORZ := 0

/**
 * @type {Integer (UInt32)}
 */
export global HDS_BUTTONS := 2

/**
 * @type {Integer (UInt32)}
 */
export global HDS_HOTTRACK := 4

/**
 * @type {Integer (UInt32)}
 */
export global HDS_HIDDEN := 8

/**
 * @type {Integer (UInt32)}
 */
export global HDS_DRAGDROP := 64

/**
 * @type {Integer (UInt32)}
 */
export global HDS_FULLDRAG := 128

/**
 * @type {Integer (UInt32)}
 */
export global HDS_FILTERBAR := 256

/**
 * @type {Integer (UInt32)}
 */
export global HDS_FLAT := 512

/**
 * @type {Integer (UInt32)}
 */
export global HDS_CHECKBOXES := 1024

/**
 * @type {Integer (UInt32)}
 */
export global HDS_NOSIZING := 2048

/**
 * @type {Integer (UInt32)}
 */
export global HDS_OVERFLOW := 4096

/**
 * @type {Integer (UInt32)}
 */
export global HDM_GETITEMCOUNT := 4608

/**
 * @type {Integer (UInt32)}
 */
export global HDM_INSERTITEMA := 4609

/**
 * @type {Integer (UInt32)}
 */
export global HDM_INSERTITEMW := 4618

/**
 * @type {Integer (UInt32)}
 */
export global HDM_INSERTITEM := 4618

/**
 * @type {Integer (UInt32)}
 */
export global HDM_DELETEITEM := 4610

/**
 * @type {Integer (UInt32)}
 */
export global HDM_GETITEMA := 4611

/**
 * @type {Integer (UInt32)}
 */
export global HDM_GETITEMW := 4619

/**
 * @type {Integer (UInt32)}
 */
export global HDM_GETITEM := 4619

/**
 * @type {Integer (UInt32)}
 */
export global HDM_SETITEMA := 4612

/**
 * @type {Integer (UInt32)}
 */
export global HDM_SETITEMW := 4620

/**
 * @type {Integer (UInt32)}
 */
export global HDM_SETITEM := 4620

/**
 * @type {Integer (UInt32)}
 */
export global HDM_LAYOUT := 4613

/**
 * @type {Integer (UInt32)}
 */
export global HDSIL_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global HDSIL_STATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global HDM_HITTEST := 4614

/**
 * @type {Integer (UInt32)}
 */
export global HDM_GETITEMRECT := 4615

/**
 * @type {Integer (UInt32)}
 */
export global HDM_SETIMAGELIST := 4616

/**
 * @type {Integer (UInt32)}
 */
export global HDM_GETIMAGELIST := 4617

/**
 * @type {Integer (UInt32)}
 */
export global HDM_ORDERTOINDEX := 4623

/**
 * @type {Integer (UInt32)}
 */
export global HDM_CREATEDRAGIMAGE := 4624

/**
 * @type {Integer (UInt32)}
 */
export global HDM_GETORDERARRAY := 4625

/**
 * @type {Integer (UInt32)}
 */
export global HDM_SETORDERARRAY := 4626

/**
 * @type {Integer (UInt32)}
 */
export global HDM_SETHOTDIVIDER := 4627

/**
 * @type {Integer (UInt32)}
 */
export global HDM_SETBITMAPMARGIN := 4628

/**
 * @type {Integer (UInt32)}
 */
export global HDM_GETBITMAPMARGIN := 4629

/**
 * @type {Integer (UInt32)}
 */
export global HDM_SETUNICODEFORMAT := 8197

/**
 * @type {Integer (UInt32)}
 */
export global HDM_GETUNICODEFORMAT := 8198

/**
 * @type {Integer (UInt32)}
 */
export global HDM_SETFILTERCHANGETIMEOUT := 4630

/**
 * @type {Integer (UInt32)}
 */
export global HDM_EDITFILTER := 4631

/**
 * @type {Integer (UInt32)}
 */
export global HDM_CLEARFILTER := 4632

/**
 * @type {Integer (UInt32)}
 */
export global HDM_GETITEMDROPDOWNRECT := 4633

/**
 * @type {Integer (UInt32)}
 */
export global HDM_GETOVERFLOWRECT := 4634

/**
 * @type {Integer (UInt32)}
 */
export global HDM_GETFOCUSEDITEM := 4635

/**
 * @type {Integer (UInt32)}
 */
export global HDM_SETFOCUSEDITEM := 4636

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMCHANGINGA := 4294966996

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMCHANGINGW := 4294966976

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMCHANGEDA := 4294966995

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMCHANGEDW := 4294966975

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMCLICKA := 4294966994

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMCLICKW := 4294966974

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMDBLCLICKA := 4294966993

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMDBLCLICKW := 4294966973

/**
 * @type {Integer (UInt32)}
 */
export global HDN_DIVIDERDBLCLICKA := 4294966991

/**
 * @type {Integer (UInt32)}
 */
export global HDN_DIVIDERDBLCLICKW := 4294966971

/**
 * @type {Integer (UInt32)}
 */
export global HDN_BEGINTRACKA := 4294966990

/**
 * @type {Integer (UInt32)}
 */
export global HDN_BEGINTRACKW := 4294966970

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ENDTRACKA := 4294966989

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ENDTRACKW := 4294966969

/**
 * @type {Integer (UInt32)}
 */
export global HDN_TRACKA := 4294966988

/**
 * @type {Integer (UInt32)}
 */
export global HDN_TRACKW := 4294966968

/**
 * @type {Integer (UInt32)}
 */
export global HDN_GETDISPINFOA := 4294966987

/**
 * @type {Integer (UInt32)}
 */
export global HDN_GETDISPINFOW := 4294966967

/**
 * @type {Integer (UInt32)}
 */
export global HDN_BEGINDRAG := 4294966986

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ENDDRAG := 4294966985

/**
 * @type {Integer (UInt32)}
 */
export global HDN_FILTERCHANGE := 4294966984

/**
 * @type {Integer (UInt32)}
 */
export global HDN_FILTERBTNCLICK := 4294966983

/**
 * @type {Integer (UInt32)}
 */
export global HDN_BEGINFILTEREDIT := 4294966982

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ENDFILTEREDIT := 4294966981

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMSTATEICONCLICK := 4294966980

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMKEYDOWN := 4294966979

/**
 * @type {Integer (UInt32)}
 */
export global HDN_DROPDOWN := 4294966978

/**
 * @type {Integer (UInt32)}
 */
export global HDN_OVERFLOWCLICK := 4294966977

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMCHANGING := 4294966976

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMCHANGED := 4294966975

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMCLICK := 4294966974

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ITEMDBLCLICK := 4294966973

/**
 * @type {Integer (UInt32)}
 */
export global HDN_DIVIDERDBLCLICK := 4294966971

/**
 * @type {Integer (UInt32)}
 */
export global HDN_BEGINTRACK := 4294966970

/**
 * @type {Integer (UInt32)}
 */
export global HDN_ENDTRACK := 4294966969

/**
 * @type {Integer (UInt32)}
 */
export global HDN_TRACK := 4294966968

/**
 * @type {Integer (UInt32)}
 */
export global HDN_GETDISPINFO := 4294966967

/**
 * @type {String}
 */
export global TOOLBARCLASSNAMEW := "ToolbarWindow32"

/**
 * @type {String}
 */
export global TOOLBARCLASSNAMEA := "ToolbarWindow32"

/**
 * @type {String}
 */
export global TOOLBARCLASSNAME := "ToolbarWindow32"

/**
 * @type {Integer (UInt32)}
 */
export global CMB_MASKED := 2

/**
 * @type {Integer (UInt32)}
 */
export global TBSTATE_CHECKED := 1

/**
 * @type {Integer (UInt32)}
 */
export global TBSTATE_PRESSED := 2

/**
 * @type {Integer (UInt32)}
 */
export global TBSTATE_ENABLED := 4

/**
 * @type {Integer (UInt32)}
 */
export global TBSTATE_HIDDEN := 8

/**
 * @type {Integer (UInt32)}
 */
export global TBSTATE_INDETERMINATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global TBSTATE_WRAP := 32

/**
 * @type {Integer (UInt32)}
 */
export global TBSTATE_ELLIPSES := 64

/**
 * @type {Integer (UInt32)}
 */
export global TBSTATE_MARKED := 128

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_BUTTON := 0

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_SEP := 1

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_CHECK := 2

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_GROUP := 4

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_DROPDOWN := 8

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_AUTOSIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_NOPREFIX := 32

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_TOOLTIPS := 256

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_WRAPABLE := 512

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_ALTDRAG := 1024

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_FLAT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_LIST := 4096

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_CUSTOMERASE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_REGISTERDROP := 16384

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_TRANSPARENT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_EX_DRAWDDARROWS := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTNS_BUTTON := 0

/**
 * @type {Integer (UInt32)}
 */
export global BTNS_SEP := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTNS_CHECK := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTNS_GROUP := 4

/**
 * @type {Integer (UInt32)}
 */
export global BTNS_DROPDOWN := 8

/**
 * @type {Integer (UInt32)}
 */
export global BTNS_AUTOSIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global BTNS_NOPREFIX := 32

/**
 * @type {Integer (UInt32)}
 */
export global BTNS_SHOWTEXT := 64

/**
 * @type {Integer (UInt32)}
 */
export global BTNS_WHOLEDROPDOWN := 128

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_EX_MIXEDBUTTONS := 8

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_EX_HIDECLIPPEDBUTTONS := 16

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_EX_MULTICOLUMN := 2

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_EX_VERTICAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global TBSTYLE_EX_DOUBLEBUFFER := 128

/**
 * @type {Integer (UInt32)}
 */
export global TBCDRF_NOEDGES := 65536

/**
 * @type {Integer (UInt32)}
 */
export global TBCDRF_HILITEHOTTRACK := 131072

/**
 * @type {Integer (UInt32)}
 */
export global TBCDRF_NOOFFSET := 262144

/**
 * @type {Integer (UInt32)}
 */
export global TBCDRF_NOMARK := 524288

/**
 * @type {Integer (UInt32)}
 */
export global TBCDRF_NOETCHEDEFFECT := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global TBCDRF_BLENDICON := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global TBCDRF_NOBACKGROUND := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global TBCDRF_USECDCOLORS := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global TB_ENABLEBUTTON := 1025

/**
 * @type {Integer (UInt32)}
 */
export global TB_CHECKBUTTON := 1026

/**
 * @type {Integer (UInt32)}
 */
export global TB_PRESSBUTTON := 1027

/**
 * @type {Integer (UInt32)}
 */
export global TB_HIDEBUTTON := 1028

/**
 * @type {Integer (UInt32)}
 */
export global TB_INDETERMINATE := 1029

/**
 * @type {Integer (UInt32)}
 */
export global TB_MARKBUTTON := 1030

/**
 * @type {Integer (UInt32)}
 */
export global TB_ISBUTTONENABLED := 1033

/**
 * @type {Integer (UInt32)}
 */
export global TB_ISBUTTONCHECKED := 1034

/**
 * @type {Integer (UInt32)}
 */
export global TB_ISBUTTONPRESSED := 1035

/**
 * @type {Integer (UInt32)}
 */
export global TB_ISBUTTONHIDDEN := 1036

/**
 * @type {Integer (UInt32)}
 */
export global TB_ISBUTTONINDETERMINATE := 1037

/**
 * @type {Integer (UInt32)}
 */
export global TB_ISBUTTONHIGHLIGHTED := 1038

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETSTATE := 1041

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETSTATE := 1042

/**
 * @type {Integer (UInt32)}
 */
export global TB_ADDBITMAP := 1043

/**
 * @type {Integer (UInt32)}
 */
export global IDB_STD_SMALL_COLOR := 0

/**
 * @type {Integer (UInt32)}
 */
export global IDB_STD_LARGE_COLOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global IDB_VIEW_SMALL_COLOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global IDB_VIEW_LARGE_COLOR := 5

/**
 * @type {Integer (UInt32)}
 */
export global IDB_HIST_SMALL_COLOR := 8

/**
 * @type {Integer (UInt32)}
 */
export global IDB_HIST_LARGE_COLOR := 9

/**
 * @type {Integer (UInt32)}
 */
export global IDB_HIST_NORMAL := 12

/**
 * @type {Integer (UInt32)}
 */
export global IDB_HIST_HOT := 13

/**
 * @type {Integer (UInt32)}
 */
export global IDB_HIST_DISABLED := 14

/**
 * @type {Integer (UInt32)}
 */
export global IDB_HIST_PRESSED := 15

/**
 * @type {Integer (UInt32)}
 */
export global STD_CUT := 0

/**
 * @type {Integer (UInt32)}
 */
export global STD_COPY := 1

/**
 * @type {Integer (UInt32)}
 */
export global STD_PASTE := 2

/**
 * @type {Integer (UInt32)}
 */
export global STD_UNDO := 3

/**
 * @type {Integer (UInt32)}
 */
export global STD_REDOW := 4

/**
 * @type {Integer (UInt32)}
 */
export global STD_DELETE := 5

/**
 * @type {Integer (UInt32)}
 */
export global STD_FILENEW := 6

/**
 * @type {Integer (UInt32)}
 */
export global STD_FILEOPEN := 7

/**
 * @type {Integer (UInt32)}
 */
export global STD_FILESAVE := 8

/**
 * @type {Integer (UInt32)}
 */
export global STD_PRINTPRE := 9

/**
 * @type {Integer (UInt32)}
 */
export global STD_PROPERTIES := 10

/**
 * @type {Integer (UInt32)}
 */
export global STD_HELP := 11

/**
 * @type {Integer (UInt32)}
 */
export global STD_FIND := 12

/**
 * @type {Integer (UInt32)}
 */
export global STD_REPLACE := 13

/**
 * @type {Integer (UInt32)}
 */
export global STD_PRINT := 14

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_LARGEICONS := 0

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_SMALLICONS := 1

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_LIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_DETAILS := 3

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_SORTNAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_SORTSIZE := 5

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_SORTDATE := 6

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_SORTTYPE := 7

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_PARENTFOLDER := 8

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_NETCONNECT := 9

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_NETDISCONNECT := 10

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_NEWFOLDER := 11

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_VIEWMENU := 12

/**
 * @type {Integer (UInt32)}
 */
export global HIST_BACK := 0

/**
 * @type {Integer (UInt32)}
 */
export global HIST_FORWARD := 1

/**
 * @type {Integer (UInt32)}
 */
export global HIST_FAVORITES := 2

/**
 * @type {Integer (UInt32)}
 */
export global HIST_ADDTOFAVORITES := 3

/**
 * @type {Integer (UInt32)}
 */
export global HIST_VIEWTREE := 4

/**
 * @type {Integer (UInt32)}
 */
export global TB_ADDBUTTONSA := 1044

/**
 * @type {Integer (UInt32)}
 */
export global TB_INSERTBUTTONA := 1045

/**
 * @type {Integer (UInt32)}
 */
export global TB_DELETEBUTTON := 1046

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETBUTTON := 1047

/**
 * @type {Integer (UInt32)}
 */
export global TB_BUTTONCOUNT := 1048

/**
 * @type {Integer (UInt32)}
 */
export global TB_COMMANDTOINDEX := 1049

/**
 * @type {Integer (UInt32)}
 */
export global TB_SAVERESTOREA := 1050

/**
 * @type {Integer (UInt32)}
 */
export global TB_SAVERESTOREW := 1100

/**
 * @type {Integer (UInt32)}
 */
export global TB_CUSTOMIZE := 1051

/**
 * @type {Integer (UInt32)}
 */
export global TB_ADDSTRINGA := 1052

/**
 * @type {Integer (UInt32)}
 */
export global TB_ADDSTRINGW := 1101

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETITEMRECT := 1053

/**
 * @type {Integer (UInt32)}
 */
export global TB_BUTTONSTRUCTSIZE := 1054

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETBUTTONSIZE := 1055

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETBITMAPSIZE := 1056

/**
 * @type {Integer (UInt32)}
 */
export global TB_AUTOSIZE := 1057

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETTOOLTIPS := 1059

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETTOOLTIPS := 1060

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETPARENT := 1061

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETROWS := 1063

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETROWS := 1064

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETCMDID := 1066

/**
 * @type {Integer (UInt32)}
 */
export global TB_CHANGEBITMAP := 1067

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETBITMAP := 1068

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETBUTTONTEXTA := 1069

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETBUTTONTEXTW := 1099

/**
 * @type {Integer (UInt32)}
 */
export global TB_REPLACEBITMAP := 1070

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETINDENT := 1071

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETIMAGELIST := 1072

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETIMAGELIST := 1073

/**
 * @type {Integer (UInt32)}
 */
export global TB_LOADIMAGES := 1074

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETRECT := 1075

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETHOTIMAGELIST := 1076

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETHOTIMAGELIST := 1077

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETDISABLEDIMAGELIST := 1078

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETDISABLEDIMAGELIST := 1079

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETSTYLE := 1080

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETSTYLE := 1081

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETBUTTONSIZE := 1082

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETBUTTONWIDTH := 1083

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETMAXTEXTROWS := 1084

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETTEXTROWS := 1085

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETBUTTONTEXT := 1099

/**
 * @type {Integer (UInt32)}
 */
export global TB_SAVERESTORE := 1100

/**
 * @type {Integer (UInt32)}
 */
export global TB_ADDSTRING := 1101

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETOBJECT := 1086

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETHOTITEM := 1095

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETHOTITEM := 1096

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETANCHORHIGHLIGHT := 1097

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETANCHORHIGHLIGHT := 1098

/**
 * @type {Integer (UInt32)}
 */
export global TB_MAPACCELERATORA := 1102

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETINSERTMARK := 1103

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETINSERTMARK := 1104

/**
 * @type {Integer (UInt32)}
 */
export global TB_INSERTMARKHITTEST := 1105

/**
 * @type {Integer (UInt32)}
 */
export global TB_MOVEBUTTON := 1106

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETMAXSIZE := 1107

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETEXTENDEDSTYLE := 1108

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETEXTENDEDSTYLE := 1109

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETPADDING := 1110

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETPADDING := 1111

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETINSERTMARKCOLOR := 1112

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETINSERTMARKCOLOR := 1113

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETCOLORSCHEME := 8194

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETCOLORSCHEME := 8195

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETUNICODEFORMAT := 8197

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETUNICODEFORMAT := 8198

/**
 * @type {Integer (UInt32)}
 */
export global TB_MAPACCELERATORW := 1114

/**
 * @type {Integer (UInt32)}
 */
export global TB_MAPACCELERATOR := 1114

/**
 * @type {Integer (UInt32)}
 */
export global TBBF_LARGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETBITMAPFLAGS := 1065

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETBUTTONINFOW := 1087

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETBUTTONINFOW := 1088

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETBUTTONINFOA := 1089

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETBUTTONINFOA := 1090

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETBUTTONINFO := 1087

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETBUTTONINFO := 1088

/**
 * @type {Integer (UInt32)}
 */
export global TB_INSERTBUTTONW := 1091

/**
 * @type {Integer (UInt32)}
 */
export global TB_ADDBUTTONSW := 1092

/**
 * @type {Integer (UInt32)}
 */
export global TB_HITTEST := 1093

/**
 * @type {Integer (UInt32)}
 */
export global TB_INSERTBUTTON := 1091

/**
 * @type {Integer (UInt32)}
 */
export global TB_ADDBUTTONS := 1092

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETDRAWTEXTFLAGS := 1094

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETSTRINGW := 1115

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETSTRINGA := 1116

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETSTRING := 1115

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETBOUNDINGSIZE := 1117

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETHOTITEM2 := 1118

/**
 * @type {Integer (UInt32)}
 */
export global TB_HASACCELERATOR := 1119

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETLISTGAP := 1120

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETIMAGELISTCOUNT := 1122

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETIDEALSIZE := 1123

/**
 * @type {Integer (UInt32)}
 */
export global TBMF_PAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global TBMF_BARPAD := 2

/**
 * @type {Integer (UInt32)}
 */
export global TBMF_BUTTONSPACING := 4

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETMETRICS := 1125

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETMETRICS := 1126

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETITEMDROPDOWNRECT := 1127

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETPRESSEDIMAGELIST := 1128

/**
 * @type {Integer (UInt32)}
 */
export global TB_GETPRESSEDIMAGELIST := 1129

/**
 * @type {Integer (UInt32)}
 */
export global TB_SETWINDOWTHEME := 8203

/**
 * @type {Integer (UInt32)}
 */
export global TBN_GETBUTTONINFOA := 4294966596

/**
 * @type {Integer (UInt32)}
 */
export global TBN_BEGINDRAG := 4294966595

/**
 * @type {Integer (UInt32)}
 */
export global TBN_ENDDRAG := 4294966594

/**
 * @type {Integer (UInt32)}
 */
export global TBN_BEGINADJUST := 4294966593

/**
 * @type {Integer (UInt32)}
 */
export global TBN_ENDADJUST := 4294966592

/**
 * @type {Integer (UInt32)}
 */
export global TBN_RESET := 4294966591

/**
 * @type {Integer (UInt32)}
 */
export global TBN_QUERYINSERT := 4294966590

/**
 * @type {Integer (UInt32)}
 */
export global TBN_QUERYDELETE := 4294966589

/**
 * @type {Integer (UInt32)}
 */
export global TBN_TOOLBARCHANGE := 4294966588

/**
 * @type {Integer (UInt32)}
 */
export global TBN_CUSTHELP := 4294966587

/**
 * @type {Integer (UInt32)}
 */
export global TBN_DROPDOWN := 4294966586

/**
 * @type {Integer (UInt32)}
 */
export global TBN_GETOBJECT := 4294966584

/**
 * @type {Integer (UInt32)}
 */
export global TBN_HOTITEMCHANGE := 4294966583

/**
 * @type {Integer (UInt32)}
 */
export global TBN_DRAGOUT := 4294966582

/**
 * @type {Integer (UInt32)}
 */
export global TBN_DELETINGBUTTON := 4294966581

/**
 * @type {Integer (UInt32)}
 */
export global TBN_GETDISPINFOA := 4294966580

/**
 * @type {Integer (UInt32)}
 */
export global TBN_GETDISPINFOW := 4294966579

/**
 * @type {Integer (UInt32)}
 */
export global TBN_GETINFOTIPA := 4294966578

/**
 * @type {Integer (UInt32)}
 */
export global TBN_GETINFOTIPW := 4294966577

/**
 * @type {Integer (UInt32)}
 */
export global TBN_GETBUTTONINFOW := 4294966576

/**
 * @type {Integer (UInt32)}
 */
export global TBN_RESTORE := 4294966575

/**
 * @type {Integer (UInt32)}
 */
export global TBN_SAVE := 4294966574

/**
 * @type {Integer (UInt32)}
 */
export global TBN_INITCUSTOMIZE := 4294966573

/**
 * @type {Integer (UInt32)}
 */
export global TBNRF_HIDEHELP := 1

/**
 * @type {Integer (UInt32)}
 */
export global TBNRF_ENDCUSTOMIZE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TBN_WRAPHOTITEM := 4294966572

/**
 * @type {Integer (UInt32)}
 */
export global TBN_DUPACCELERATOR := 4294966571

/**
 * @type {Integer (UInt32)}
 */
export global TBN_WRAPACCELERATOR := 4294966570

/**
 * @type {Integer (UInt32)}
 */
export global TBN_DRAGOVER := 4294966569

/**
 * @type {Integer (UInt32)}
 */
export global TBN_MAPACCELERATOR := 4294966568

/**
 * @type {Integer (UInt32)}
 */
export global TBN_GETINFOTIP := 4294966577

/**
 * @type {Integer (UInt32)}
 */
export global TBN_GETDISPINFO := 4294966579

/**
 * @type {Integer (UInt32)}
 */
export global TBDDRET_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global TBDDRET_NODEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global TBDDRET_TREATPRESSED := 2

/**
 * @type {Integer (UInt32)}
 */
export global TBN_GETBUTTONINFO := 4294966576

/**
 * @type {String}
 */
export global REBARCLASSNAMEW := "ReBarWindow32"

/**
 * @type {String}
 */
export global REBARCLASSNAMEA := "ReBarWindow32"

/**
 * @type {String}
 */
export global REBARCLASSNAME := "ReBarWindow32"

/**
 * @type {Integer (UInt32)}
 */
export global RBIM_IMAGELIST := 1

/**
 * @type {Integer (UInt32)}
 */
export global RBS_TOOLTIPS := 256

/**
 * @type {Integer (UInt32)}
 */
export global RBS_VARHEIGHT := 512

/**
 * @type {Integer (UInt32)}
 */
export global RBS_BANDBORDERS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RBS_FIXEDORDER := 2048

/**
 * @type {Integer (UInt32)}
 */
export global RBS_REGISTERDROP := 4096

/**
 * @type {Integer (UInt32)}
 */
export global RBS_AUTOSIZE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global RBS_VERTICALGRIPPER := 16384

/**
 * @type {Integer (UInt32)}
 */
export global RBS_DBLCLKTOGGLE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global RBBS_BREAK := 1

/**
 * @type {Integer (UInt32)}
 */
export global RBBS_FIXEDSIZE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RBBS_CHILDEDGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global RBBS_HIDDEN := 8

/**
 * @type {Integer (UInt32)}
 */
export global RBBS_NOVERT := 16

/**
 * @type {Integer (UInt32)}
 */
export global RBBS_FIXEDBMP := 32

/**
 * @type {Integer (UInt32)}
 */
export global RBBS_VARIABLEHEIGHT := 64

/**
 * @type {Integer (UInt32)}
 */
export global RBBS_GRIPPERALWAYS := 128

/**
 * @type {Integer (UInt32)}
 */
export global RBBS_NOGRIPPER := 256

/**
 * @type {Integer (UInt32)}
 */
export global RBBS_USECHEVRON := 512

/**
 * @type {Integer (UInt32)}
 */
export global RBBS_HIDETITLE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RBBS_TOPALIGN := 2048

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_STYLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_COLORS := 2

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_TEXT := 4

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_IMAGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_CHILD := 16

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_CHILDSIZE := 32

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_SIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_BACKGROUND := 128

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_ID := 256

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_IDEALSIZE := 512

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_LPARAM := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_HEADERSIZE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_CHEVRONLOCATION := 4096

/**
 * @type {Integer (UInt32)}
 */
export global RBBIM_CHEVRONSTATE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global RB_INSERTBANDA := 1025

/**
 * @type {Integer (UInt32)}
 */
export global RB_DELETEBAND := 1026

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETBARINFO := 1027

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETBARINFO := 1028

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETBANDINFOA := 1030

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETPARENT := 1031

/**
 * @type {Integer (UInt32)}
 */
export global RB_HITTEST := 1032

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETRECT := 1033

/**
 * @type {Integer (UInt32)}
 */
export global RB_INSERTBANDW := 1034

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETBANDINFOW := 1035

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETBANDCOUNT := 1036

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETROWCOUNT := 1037

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETROWHEIGHT := 1038

/**
 * @type {Integer (UInt32)}
 */
export global RB_IDTOINDEX := 1040

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETTOOLTIPS := 1041

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETTOOLTIPS := 1042

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETBKCOLOR := 1043

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETBKCOLOR := 1044

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETTEXTCOLOR := 1045

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETTEXTCOLOR := 1046

/**
 * @type {Integer (UInt32)}
 */
export global RBSTR_CHANGERECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global RB_SIZETORECT := 1047

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETCOLORSCHEME := 8194

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETCOLORSCHEME := 8195

/**
 * @type {Integer (UInt32)}
 */
export global RB_INSERTBAND := 1034

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETBANDINFO := 1035

/**
 * @type {Integer (UInt32)}
 */
export global RB_BEGINDRAG := 1048

/**
 * @type {Integer (UInt32)}
 */
export global RB_ENDDRAG := 1049

/**
 * @type {Integer (UInt32)}
 */
export global RB_DRAGMOVE := 1050

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETBARHEIGHT := 1051

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETBANDINFOW := 1052

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETBANDINFOA := 1053

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETBANDINFO := 1052

/**
 * @type {Integer (UInt32)}
 */
export global RB_MINIMIZEBAND := 1054

/**
 * @type {Integer (UInt32)}
 */
export global RB_MAXIMIZEBAND := 1055

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETDROPTARGET := 8196

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETBANDBORDERS := 1058

/**
 * @type {Integer (UInt32)}
 */
export global RB_SHOWBAND := 1059

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETPALETTE := 1061

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETPALETTE := 1062

/**
 * @type {Integer (UInt32)}
 */
export global RB_MOVEBAND := 1063

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETUNICODEFORMAT := 8197

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETUNICODEFORMAT := 8198

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETBANDMARGINS := 1064

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETWINDOWTHEME := 8203

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETEXTENDEDSTYLE := 1065

/**
 * @type {Integer (UInt32)}
 */
export global RB_GETEXTENDEDSTYLE := 1066

/**
 * @type {Integer (UInt32)}
 */
export global RB_PUSHCHEVRON := 1067

/**
 * @type {Integer (UInt32)}
 */
export global RB_SETBANDWIDTH := 1068

/**
 * @type {Integer (UInt32)}
 */
export global RBN_HEIGHTCHANGE := 4294966465

/**
 * @type {Integer (UInt32)}
 */
export global RBN_GETOBJECT := 4294966464

/**
 * @type {Integer (UInt32)}
 */
export global RBN_LAYOUTCHANGED := 4294966463

/**
 * @type {Integer (UInt32)}
 */
export global RBN_AUTOSIZE := 4294966462

/**
 * @type {Integer (UInt32)}
 */
export global RBN_BEGINDRAG := 4294966461

/**
 * @type {Integer (UInt32)}
 */
export global RBN_ENDDRAG := 4294966460

/**
 * @type {Integer (UInt32)}
 */
export global RBN_DELETINGBAND := 4294966459

/**
 * @type {Integer (UInt32)}
 */
export global RBN_DELETEDBAND := 4294966458

/**
 * @type {Integer (UInt32)}
 */
export global RBN_CHILDSIZE := 4294966457

/**
 * @type {Integer (UInt32)}
 */
export global RBN_CHEVRONPUSHED := 4294966455

/**
 * @type {Integer (UInt32)}
 */
export global RBN_SPLITTERDRAG := 4294966454

/**
 * @type {Integer (UInt32)}
 */
export global RBN_MINMAX := 4294966444

/**
 * @type {Integer (UInt32)}
 */
export global RBN_AUTOBREAK := 4294966443

/**
 * @type {Integer (UInt32)}
 */
export global RBAB_AUTOSIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RBAB_ADDBAND := 2

/**
 * @type {Integer (UInt32)}
 */
export global RBHT_NOWHERE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RBHT_CAPTION := 2

/**
 * @type {Integer (UInt32)}
 */
export global RBHT_CLIENT := 3

/**
 * @type {Integer (UInt32)}
 */
export global RBHT_GRABBER := 4

/**
 * @type {Integer (UInt32)}
 */
export global RBHT_CHEVRON := 8

/**
 * @type {Integer (UInt32)}
 */
export global RBHT_SPLITTER := 16

/**
 * @type {String}
 */
export global TOOLTIPS_CLASSW := "tooltips_class32"

/**
 * @type {String}
 */
export global TOOLTIPS_CLASSA := "tooltips_class32"

/**
 * @type {String}
 */
export global TOOLTIPS_CLASS := "tooltips_class32"

/**
 * @type {Integer (UInt32)}
 */
export global TTS_ALWAYSTIP := 1

/**
 * @type {Integer (UInt32)}
 */
export global TTS_NOPREFIX := 2

/**
 * @type {Integer (UInt32)}
 */
export global TTS_NOANIMATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global TTS_NOFADE := 32

/**
 * @type {Integer (UInt32)}
 */
export global TTS_BALLOON := 64

/**
 * @type {Integer (UInt32)}
 */
export global TTS_CLOSE := 128

/**
 * @type {Integer (UInt32)}
 */
export global TTS_USEVISUALSTYLE := 256

/**
 * @type {Integer (UInt32)}
 */
export global TTDT_AUTOMATIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global TTDT_RESHOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global TTDT_AUTOPOP := 2

/**
 * @type {Integer (UInt32)}
 */
export global TTDT_INITIAL := 3

/**
 * @type {Integer (UInt32)}
 */
export global TTM_ACTIVATE := 1025

/**
 * @type {Integer (UInt32)}
 */
export global TTM_SETDELAYTIME := 1027

/**
 * @type {Integer (UInt32)}
 */
export global TTM_ADDTOOLA := 1028

/**
 * @type {Integer (UInt32)}
 */
export global TTM_ADDTOOLW := 1074

/**
 * @type {Integer (UInt32)}
 */
export global TTM_DELTOOLA := 1029

/**
 * @type {Integer (UInt32)}
 */
export global TTM_DELTOOLW := 1075

/**
 * @type {Integer (UInt32)}
 */
export global TTM_NEWTOOLRECTA := 1030

/**
 * @type {Integer (UInt32)}
 */
export global TTM_NEWTOOLRECTW := 1076

/**
 * @type {Integer (UInt32)}
 */
export global TTM_RELAYEVENT := 1031

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETTOOLINFOA := 1032

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETTOOLINFOW := 1077

/**
 * @type {Integer (UInt32)}
 */
export global TTM_SETTOOLINFOA := 1033

/**
 * @type {Integer (UInt32)}
 */
export global TTM_SETTOOLINFOW := 1078

/**
 * @type {Integer (UInt32)}
 */
export global TTM_HITTESTA := 1034

/**
 * @type {Integer (UInt32)}
 */
export global TTM_HITTESTW := 1079

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETTEXTA := 1035

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETTEXTW := 1080

/**
 * @type {Integer (UInt32)}
 */
export global TTM_UPDATETIPTEXTA := 1036

/**
 * @type {Integer (UInt32)}
 */
export global TTM_UPDATETIPTEXTW := 1081

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETTOOLCOUNT := 1037

/**
 * @type {Integer (UInt32)}
 */
export global TTM_ENUMTOOLSA := 1038

/**
 * @type {Integer (UInt32)}
 */
export global TTM_ENUMTOOLSW := 1082

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETCURRENTTOOLA := 1039

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETCURRENTTOOLW := 1083

/**
 * @type {Integer (UInt32)}
 */
export global TTM_WINDOWFROMPOINT := 1040

/**
 * @type {Integer (UInt32)}
 */
export global TTM_TRACKACTIVATE := 1041

/**
 * @type {Integer (UInt32)}
 */
export global TTM_TRACKPOSITION := 1042

/**
 * @type {Integer (UInt32)}
 */
export global TTM_SETTIPBKCOLOR := 1043

/**
 * @type {Integer (UInt32)}
 */
export global TTM_SETTIPTEXTCOLOR := 1044

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETDELAYTIME := 1045

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETTIPBKCOLOR := 1046

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETTIPTEXTCOLOR := 1047

/**
 * @type {Integer (UInt32)}
 */
export global TTM_SETMAXTIPWIDTH := 1048

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETMAXTIPWIDTH := 1049

/**
 * @type {Integer (UInt32)}
 */
export global TTM_SETMARGIN := 1050

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETMARGIN := 1051

/**
 * @type {Integer (UInt32)}
 */
export global TTM_POP := 1052

/**
 * @type {Integer (UInt32)}
 */
export global TTM_UPDATE := 1053

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETBUBBLESIZE := 1054

/**
 * @type {Integer (UInt32)}
 */
export global TTM_ADJUSTRECT := 1055

/**
 * @type {Integer (UInt32)}
 */
export global TTM_SETTITLEA := 1056

/**
 * @type {Integer (UInt32)}
 */
export global TTM_SETTITLEW := 1057

/**
 * @type {Integer (UInt32)}
 */
export global TTM_POPUP := 1058

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETTITLE := 1059

/**
 * @type {Integer (UInt32)}
 */
export global TTM_ADDTOOL := 1074

/**
 * @type {Integer (UInt32)}
 */
export global TTM_DELTOOL := 1075

/**
 * @type {Integer (UInt32)}
 */
export global TTM_NEWTOOLRECT := 1076

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETTOOLINFO := 1077

/**
 * @type {Integer (UInt32)}
 */
export global TTM_SETTOOLINFO := 1078

/**
 * @type {Integer (UInt32)}
 */
export global TTM_HITTEST := 1079

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETTEXT := 1080

/**
 * @type {Integer (UInt32)}
 */
export global TTM_UPDATETIPTEXT := 1081

/**
 * @type {Integer (UInt32)}
 */
export global TTM_ENUMTOOLS := 1082

/**
 * @type {Integer (UInt32)}
 */
export global TTM_GETCURRENTTOOL := 1083

/**
 * @type {Integer (UInt32)}
 */
export global TTM_SETTITLE := 1057

/**
 * @type {Integer (UInt32)}
 */
export global TTM_SETWINDOWTHEME := 8203

/**
 * @type {Integer (UInt32)}
 */
export global TTN_GETDISPINFOA := 4294966776

/**
 * @type {Integer (UInt32)}
 */
export global TTN_GETDISPINFOW := 4294966766

/**
 * @type {Integer (UInt32)}
 */
export global TTN_SHOW := 4294966775

/**
 * @type {Integer (UInt32)}
 */
export global TTN_POP := 4294966774

/**
 * @type {Integer (UInt32)}
 */
export global TTN_LINKCLICK := 4294966773

/**
 * @type {Integer (UInt32)}
 */
export global TTN_GETDISPINFO := 4294966766

/**
 * @type {Integer (UInt32)}
 */
export global TTN_NEEDTEXT := 4294966766

/**
 * @type {Integer (UInt32)}
 */
export global TTN_NEEDTEXTA := 4294966776

/**
 * @type {Integer (UInt32)}
 */
export global TTN_NEEDTEXTW := 4294966766

/**
 * @type {Integer (UInt32)}
 */
export global SBARS_SIZEGRIP := 256

/**
 * @type {Integer (UInt32)}
 */
export global SBARS_TOOLTIPS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SBT_TOOLTIPS := 2048

/**
 * @type {String}
 */
export global STATUSCLASSNAMEW := "msctls_statusbar32"

/**
 * @type {String}
 */
export global STATUSCLASSNAMEA := "msctls_statusbar32"

/**
 * @type {String}
 */
export global STATUSCLASSNAME := "msctls_statusbar32"

/**
 * @type {Integer (UInt32)}
 */
export global SB_SETTEXTA := 1025

/**
 * @type {Integer (UInt32)}
 */
export global SB_SETTEXTW := 1035

/**
 * @type {Integer (UInt32)}
 */
export global SB_GETTEXTA := 1026

/**
 * @type {Integer (UInt32)}
 */
export global SB_GETTEXTW := 1037

/**
 * @type {Integer (UInt32)}
 */
export global SB_GETTEXTLENGTHA := 1027

/**
 * @type {Integer (UInt32)}
 */
export global SB_GETTEXTLENGTHW := 1036

/**
 * @type {Integer (UInt32)}
 */
export global SB_GETTEXT := 1037

/**
 * @type {Integer (UInt32)}
 */
export global SB_SETTEXT := 1035

/**
 * @type {Integer (UInt32)}
 */
export global SB_GETTEXTLENGTH := 1036

/**
 * @type {Integer (UInt32)}
 */
export global SB_SETPARTS := 1028

/**
 * @type {Integer (UInt32)}
 */
export global SB_GETPARTS := 1030

/**
 * @type {Integer (UInt32)}
 */
export global SB_GETBORDERS := 1031

/**
 * @type {Integer (UInt32)}
 */
export global SB_SETMINHEIGHT := 1032

/**
 * @type {Integer (UInt32)}
 */
export global SB_SIMPLE := 1033

/**
 * @type {Integer (UInt32)}
 */
export global SB_GETRECT := 1034

/**
 * @type {Integer (UInt32)}
 */
export global SB_ISSIMPLE := 1038

/**
 * @type {Integer (UInt32)}
 */
export global SB_SETICON := 1039

/**
 * @type {Integer (UInt32)}
 */
export global SB_SETTIPTEXTA := 1040

/**
 * @type {Integer (UInt32)}
 */
export global SB_SETTIPTEXTW := 1041

/**
 * @type {Integer (UInt32)}
 */
export global SB_GETTIPTEXTA := 1042

/**
 * @type {Integer (UInt32)}
 */
export global SB_GETTIPTEXTW := 1043

/**
 * @type {Integer (UInt32)}
 */
export global SB_GETICON := 1044

/**
 * @type {Integer (UInt32)}
 */
export global SB_SETUNICODEFORMAT := 8197

/**
 * @type {Integer (UInt32)}
 */
export global SB_GETUNICODEFORMAT := 8198

/**
 * @type {Integer (UInt32)}
 */
export global SBT_OWNERDRAW := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SBT_NOBORDERS := 256

/**
 * @type {Integer (UInt32)}
 */
export global SBT_POPOUT := 512

/**
 * @type {Integer (UInt32)}
 */
export global SBT_RTLREADING := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SBT_NOTABPARSING := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SB_SETBKCOLOR := 8193

/**
 * @type {Integer (UInt32)}
 */
export global SBN_SIMPLEMODECHANGE := 4294966416

/**
 * @type {Integer (UInt32)}
 */
export global SB_SIMPLEID := 255

/**
 * @type {String}
 */
export global TRACKBAR_CLASSA := "msctls_trackbar32"

/**
 * @type {String}
 */
export global TRACKBAR_CLASSW := "msctls_trackbar32"

/**
 * @type {String}
 */
export global TRACKBAR_CLASS := "msctls_trackbar32"

/**
 * @type {Integer (UInt32)}
 */
export global TBS_AUTOTICKS := 1

/**
 * @type {Integer (UInt32)}
 */
export global TBS_VERT := 2

/**
 * @type {Integer (UInt32)}
 */
export global TBS_HORZ := 0

/**
 * @type {Integer (UInt32)}
 */
export global TBS_TOP := 4

/**
 * @type {Integer (UInt32)}
 */
export global TBS_BOTTOM := 0

/**
 * @type {Integer (UInt32)}
 */
export global TBS_LEFT := 4

/**
 * @type {Integer (UInt32)}
 */
export global TBS_RIGHT := 0

/**
 * @type {Integer (UInt32)}
 */
export global TBS_BOTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global TBS_NOTICKS := 16

/**
 * @type {Integer (UInt32)}
 */
export global TBS_ENABLESELRANGE := 32

/**
 * @type {Integer (UInt32)}
 */
export global TBS_FIXEDLENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global TBS_NOTHUMB := 128

/**
 * @type {Integer (UInt32)}
 */
export global TBS_TOOLTIPS := 256

/**
 * @type {Integer (UInt32)}
 */
export global TBS_REVERSED := 512

/**
 * @type {Integer (UInt32)}
 */
export global TBS_DOWNISLEFT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global TBS_NOTIFYBEFOREMOVE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global TBS_TRANSPARENTBKGND := 4096

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETRANGEMIN := 1025

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETRANGEMAX := 1026

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETTIC := 1027

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETTIC := 1028

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETPOS := 1029

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETRANGE := 1030

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETRANGEMIN := 1031

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETRANGEMAX := 1032

/**
 * @type {Integer (UInt32)}
 */
export global TBM_CLEARTICS := 1033

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETSEL := 1034

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETSELSTART := 1035

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETSELEND := 1036

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETPTICS := 1038

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETTICPOS := 1039

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETNUMTICS := 1040

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETSELSTART := 1041

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETSELEND := 1042

/**
 * @type {Integer (UInt32)}
 */
export global TBM_CLEARSEL := 1043

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETTICFREQ := 1044

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETPAGESIZE := 1045

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETPAGESIZE := 1046

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETLINESIZE := 1047

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETLINESIZE := 1048

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETTHUMBRECT := 1049

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETCHANNELRECT := 1050

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETTHUMBLENGTH := 1051

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETTHUMBLENGTH := 1052

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETTOOLTIPS := 1053

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETTOOLTIPS := 1054

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETTIPSIDE := 1055

/**
 * @type {Integer (UInt32)}
 */
export global TBTS_TOP := 0

/**
 * @type {Integer (UInt32)}
 */
export global TBTS_LEFT := 1

/**
 * @type {Integer (UInt32)}
 */
export global TBTS_BOTTOM := 2

/**
 * @type {Integer (UInt32)}
 */
export global TBTS_RIGHT := 3

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETBUDDY := 1056

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETBUDDY := 1057

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETPOSNOTIFY := 1058

/**
 * @type {Integer (UInt32)}
 */
export global TBM_SETUNICODEFORMAT := 8197

/**
 * @type {Integer (UInt32)}
 */
export global TBM_GETUNICODEFORMAT := 8198

/**
 * @type {Integer (UInt32)}
 */
export global TB_LINEUP := 0

/**
 * @type {Integer (UInt32)}
 */
export global TB_LINEDOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global TB_PAGEUP := 2

/**
 * @type {Integer (UInt32)}
 */
export global TB_PAGEDOWN := 3

/**
 * @type {Integer (UInt32)}
 */
export global TB_THUMBPOSITION := 4

/**
 * @type {Integer (UInt32)}
 */
export global TB_THUMBTRACK := 5

/**
 * @type {Integer (UInt32)}
 */
export global TB_TOP := 6

/**
 * @type {Integer (UInt32)}
 */
export global TB_BOTTOM := 7

/**
 * @type {Integer (UInt32)}
 */
export global TB_ENDTRACK := 8

/**
 * @type {Integer (UInt32)}
 */
export global TBCD_TICS := 1

/**
 * @type {Integer (UInt32)}
 */
export global TBCD_THUMB := 2

/**
 * @type {Integer (UInt32)}
 */
export global TBCD_CHANNEL := 3

/**
 * @type {Integer (UInt32)}
 */
export global TRBN_THUMBPOSCHANGING := 4294965794

/**
 * @type {Integer (UInt32)}
 */
export global DL_CURSORSET := 0

/**
 * @type {Integer (UInt32)}
 */
export global DL_STOPCURSOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global DL_COPYCURSOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global DL_MOVECURSOR := 3

/**
 * @type {String}
 */
export global DRAGLISTMSGSTRING := "commctrl_DragListMsg"

/**
 * @type {String}
 */
export global UPDOWN_CLASSA := "msctls_updown32"

/**
 * @type {String}
 */
export global UPDOWN_CLASSW := "msctls_updown32"

/**
 * @type {String}
 */
export global UPDOWN_CLASS := "msctls_updown32"

/**
 * @type {Integer (UInt32)}
 */
export global UD_MAXVAL := 32767

/**
 * @type {Integer (UInt32)}
 */
export global UDS_WRAP := 1

/**
 * @type {Integer (UInt32)}
 */
export global UDS_SETBUDDYINT := 2

/**
 * @type {Integer (UInt32)}
 */
export global UDS_ALIGNRIGHT := 4

/**
 * @type {Integer (UInt32)}
 */
export global UDS_ALIGNLEFT := 8

/**
 * @type {Integer (UInt32)}
 */
export global UDS_AUTOBUDDY := 16

/**
 * @type {Integer (UInt32)}
 */
export global UDS_ARROWKEYS := 32

/**
 * @type {Integer (UInt32)}
 */
export global UDS_HORZ := 64

/**
 * @type {Integer (UInt32)}
 */
export global UDS_NOTHOUSANDS := 128

/**
 * @type {Integer (UInt32)}
 */
export global UDS_HOTTRACK := 256

/**
 * @type {Integer (UInt32)}
 */
export global UDM_SETRANGE := 1125

/**
 * @type {Integer (UInt32)}
 */
export global UDM_GETRANGE := 1126

/**
 * @type {Integer (UInt32)}
 */
export global UDM_SETPOS := 1127

/**
 * @type {Integer (UInt32)}
 */
export global UDM_GETPOS := 1128

/**
 * @type {Integer (UInt32)}
 */
export global UDM_SETBUDDY := 1129

/**
 * @type {Integer (UInt32)}
 */
export global UDM_GETBUDDY := 1130

/**
 * @type {Integer (UInt32)}
 */
export global UDM_SETACCEL := 1131

/**
 * @type {Integer (UInt32)}
 */
export global UDM_GETACCEL := 1132

/**
 * @type {Integer (UInt32)}
 */
export global UDM_SETBASE := 1133

/**
 * @type {Integer (UInt32)}
 */
export global UDM_GETBASE := 1134

/**
 * @type {Integer (UInt32)}
 */
export global UDM_SETRANGE32 := 1135

/**
 * @type {Integer (UInt32)}
 */
export global UDM_GETRANGE32 := 1136

/**
 * @type {Integer (UInt32)}
 */
export global UDM_SETUNICODEFORMAT := 8197

/**
 * @type {Integer (UInt32)}
 */
export global UDM_GETUNICODEFORMAT := 8198

/**
 * @type {Integer (UInt32)}
 */
export global UDM_SETPOS32 := 1137

/**
 * @type {Integer (UInt32)}
 */
export global UDM_GETPOS32 := 1138

/**
 * @type {Integer (UInt32)}
 */
export global UDN_DELTAPOS := 4294966574

/**
 * @type {String}
 */
export global PROGRESS_CLASSA := "msctls_progress32"

/**
 * @type {String}
 */
export global PROGRESS_CLASSW := "msctls_progress32"

/**
 * @type {String}
 */
export global PROGRESS_CLASS := "msctls_progress32"

/**
 * @type {Integer (UInt32)}
 */
export global PBS_SMOOTH := 1

/**
 * @type {Integer (UInt32)}
 */
export global PBS_VERTICAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global PBM_SETRANGE := 1025

/**
 * @type {Integer (UInt32)}
 */
export global PBM_SETPOS := 1026

/**
 * @type {Integer (UInt32)}
 */
export global PBM_DELTAPOS := 1027

/**
 * @type {Integer (UInt32)}
 */
export global PBM_SETSTEP := 1028

/**
 * @type {Integer (UInt32)}
 */
export global PBM_STEPIT := 1029

/**
 * @type {Integer (UInt32)}
 */
export global PBM_SETRANGE32 := 1030

/**
 * @type {Integer (UInt32)}
 */
export global PBM_GETRANGE := 1031

/**
 * @type {Integer (UInt32)}
 */
export global PBM_GETPOS := 1032

/**
 * @type {Integer (UInt32)}
 */
export global PBM_SETBARCOLOR := 1033

/**
 * @type {Integer (UInt32)}
 */
export global PBM_SETBKCOLOR := 8193

/**
 * @type {Integer (UInt32)}
 */
export global PBS_MARQUEE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PBM_SETMARQUEE := 1034

/**
 * @type {Integer (UInt32)}
 */
export global PBS_SMOOTHREVERSE := 16

/**
 * @type {Integer (UInt32)}
 */
export global PBM_GETSTEP := 1037

/**
 * @type {Integer (UInt32)}
 */
export global PBM_GETBKCOLOR := 1038

/**
 * @type {Integer (UInt32)}
 */
export global PBM_GETBARCOLOR := 1039

/**
 * @type {Integer (UInt32)}
 */
export global PBM_SETSTATE := 1040

/**
 * @type {Integer (UInt32)}
 */
export global PBM_GETSTATE := 1041

/**
 * @type {Integer (UInt32)}
 */
export global PBST_NORMAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global PBST_ERROR := 2

/**
 * @type {Integer (UInt32)}
 */
export global PBST_PAUSED := 3

/**
 * @type {Integer (UInt32)}
 */
export global HOTKEYF_SHIFT := 1

/**
 * @type {Integer (UInt32)}
 */
export global HOTKEYF_CONTROL := 2

/**
 * @type {Integer (UInt32)}
 */
export global HOTKEYF_ALT := 4

/**
 * @type {Integer (UInt32)}
 */
export global HKCOMB_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global HKCOMB_S := 2

/**
 * @type {Integer (UInt32)}
 */
export global HKCOMB_C := 4

/**
 * @type {Integer (UInt32)}
 */
export global HKCOMB_A := 8

/**
 * @type {Integer (UInt32)}
 */
export global HKCOMB_SC := 16

/**
 * @type {Integer (UInt32)}
 */
export global HKCOMB_SA := 32

/**
 * @type {Integer (UInt32)}
 */
export global HKCOMB_CA := 64

/**
 * @type {Integer (UInt32)}
 */
export global HKCOMB_SCA := 128

/**
 * @type {Integer (UInt32)}
 */
export global HKM_SETHOTKEY := 1025

/**
 * @type {Integer (UInt32)}
 */
export global HKM_GETHOTKEY := 1026

/**
 * @type {Integer (UInt32)}
 */
export global HKM_SETRULES := 1027

/**
 * @type {String}
 */
export global HOTKEY_CLASSA := "msctls_hotkey32"

/**
 * @type {String}
 */
export global HOTKEY_CLASSW := "msctls_hotkey32"

/**
 * @type {String}
 */
export global HOTKEY_CLASS := "msctls_hotkey32"

/**
 * @type {Integer (Int32)}
 */
export global CCS_TOP := 1

/**
 * @type {Integer (Int32)}
 */
export global CCS_NOMOVEY := 2

/**
 * @type {Integer (Int32)}
 */
export global CCS_BOTTOM := 3

/**
 * @type {Integer (Int32)}
 */
export global CCS_NORESIZE := 4

/**
 * @type {Integer (Int32)}
 */
export global CCS_NOPARENTALIGN := 8

/**
 * @type {Integer (Int32)}
 */
export global CCS_ADJUSTABLE := 32

/**
 * @type {Integer (Int32)}
 */
export global CCS_NODIVIDER := 64

/**
 * @type {Integer (Int32)}
 */
export global CCS_VERT := 128

/**
 * @type {Integer (Int32)}
 */
export global INVALID_LINK_INDEX := -1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_LINKID_TEXT := 48

/**
 * @type {String}
 */
export global WC_LINK := "SysLink"

/**
 * @type {Integer (UInt32)}
 */
export global LWS_TRANSPARENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LWS_IGNORERETURN := 2

/**
 * @type {Integer (UInt32)}
 */
export global LWS_NOPREFIX := 4

/**
 * @type {Integer (UInt32)}
 */
export global LWS_USEVISUALSTYLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global LWS_USECUSTOMTEXT := 16

/**
 * @type {Integer (UInt32)}
 */
export global LWS_RIGHT := 32

/**
 * @type {Integer (UInt32)}
 */
export global LM_HITTEST := 1792

/**
 * @type {Integer (UInt32)}
 */
export global LM_GETIDEALHEIGHT := 1793

/**
 * @type {Integer (UInt32)}
 */
export global LM_SETITEM := 1794

/**
 * @type {Integer (UInt32)}
 */
export global LM_GETITEM := 1795

/**
 * @type {Integer (UInt32)}
 */
export global LM_GETIDEALSIZE := 1793

/**
 * @type {String}
 */
export global WC_LISTVIEWA := "SysListView32"

/**
 * @type {String}
 */
export global WC_LISTVIEWW := "SysListView32"

/**
 * @type {String}
 */
export global WC_LISTVIEW := "SysListView32"

/**
 * @type {Integer (UInt32)}
 */
export global LVS_ICON := 0

/**
 * @type {Integer (UInt32)}
 */
export global LVS_REPORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LVS_SMALLICON := 2

/**
 * @type {Integer (UInt32)}
 */
export global LVS_LIST := 3

/**
 * @type {Integer (UInt32)}
 */
export global LVS_TYPEMASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global LVS_SINGLESEL := 4

/**
 * @type {Integer (UInt32)}
 */
export global LVS_SHOWSELALWAYS := 8

/**
 * @type {Integer (UInt32)}
 */
export global LVS_SORTASCENDING := 16

/**
 * @type {Integer (UInt32)}
 */
export global LVS_SORTDESCENDING := 32

/**
 * @type {Integer (UInt32)}
 */
export global LVS_SHAREIMAGELISTS := 64

/**
 * @type {Integer (UInt32)}
 */
export global LVS_NOLABELWRAP := 128

/**
 * @type {Integer (UInt32)}
 */
export global LVS_AUTOARRANGE := 256

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EDITLABELS := 512

/**
 * @type {Integer (UInt32)}
 */
export global LVS_OWNERDATA := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LVS_NOSCROLL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LVS_TYPESTYLEMASK := 64512

/**
 * @type {Integer (UInt32)}
 */
export global LVS_ALIGNTOP := 0

/**
 * @type {Integer (UInt32)}
 */
export global LVS_ALIGNLEFT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LVS_ALIGNMASK := 3072

/**
 * @type {Integer (UInt32)}
 */
export global LVS_OWNERDRAWFIXED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LVS_NOCOLUMNHEADER := 16384

/**
 * @type {Integer (UInt32)}
 */
export global LVS_NOSORTHEADER := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETUNICODEFORMAT := 8197

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETUNICODEFORMAT := 8198

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETBKCOLOR := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETBKCOLOR := 4097

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETIMAGELIST := 4098

/**
 * @type {Integer (UInt32)}
 */
export global LVSIL_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global LVSIL_SMALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global LVSIL_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LVSIL_GROUPHEADER := 3

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETIMAGELIST := 4099

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETITEMCOUNT := 4100

/**
 * @type {Integer (Int32)}
 */
export global I_INDENTCALLBACK := -1

/**
 * @type {Integer (Int32)}
 */
export global I_IMAGECALLBACK := -1

/**
 * @type {Integer (Int32)}
 */
export global I_IMAGENONE := -2

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETITEMA := 4101

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETITEMW := 4171

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETITEM := 4171

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETITEMA := 4102

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETITEMW := 4172

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETITEM := 4172

/**
 * @type {Integer (UInt32)}
 */
export global LVM_INSERTITEMA := 4103

/**
 * @type {Integer (UInt32)}
 */
export global LVM_INSERTITEMW := 4173

/**
 * @type {Integer (UInt32)}
 */
export global LVM_INSERTITEM := 4173

/**
 * @type {Integer (UInt32)}
 */
export global LVM_DELETEITEM := 4104

/**
 * @type {Integer (UInt32)}
 */
export global LVM_DELETEALLITEMS := 4105

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETCALLBACKMASK := 4106

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETCALLBACKMASK := 4107

/**
 * @type {Integer (UInt32)}
 */
export global LVNI_ALL := 0

/**
 * @type {Integer (UInt32)}
 */
export global LVNI_FOCUSED := 1

/**
 * @type {Integer (UInt32)}
 */
export global LVNI_SELECTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global LVNI_CUT := 4

/**
 * @type {Integer (UInt32)}
 */
export global LVNI_DROPHILITED := 8

/**
 * @type {Integer (UInt32)}
 */
export global LVNI_VISIBLEORDER := 16

/**
 * @type {Integer (UInt32)}
 */
export global LVNI_PREVIOUS := 32

/**
 * @type {Integer (UInt32)}
 */
export global LVNI_VISIBLEONLY := 64

/**
 * @type {Integer (UInt32)}
 */
export global LVNI_SAMEGROUPONLY := 128

/**
 * @type {Integer (UInt32)}
 */
export global LVNI_ABOVE := 256

/**
 * @type {Integer (UInt32)}
 */
export global LVNI_BELOW := 512

/**
 * @type {Integer (UInt32)}
 */
export global LVNI_TOLEFT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LVNI_TORIGHT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETNEXTITEM := 4108

/**
 * @type {Integer (UInt32)}
 */
export global LVM_FINDITEMA := 4109

/**
 * @type {Integer (UInt32)}
 */
export global LVM_FINDITEMW := 4179

/**
 * @type {Integer (UInt32)}
 */
export global LVM_FINDITEM := 4179

/**
 * @type {Integer (UInt32)}
 */
export global LVIR_BOUNDS := 0

/**
 * @type {Integer (UInt32)}
 */
export global LVIR_ICON := 1

/**
 * @type {Integer (UInt32)}
 */
export global LVIR_LABEL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LVIR_SELECTBOUNDS := 3

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETITEMRECT := 4110

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETITEMPOSITION := 4111

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETITEMPOSITION := 4112

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETSTRINGWIDTHA := 4113

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETSTRINGWIDTHW := 4183

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETSTRINGWIDTH := 4183

/**
 * @type {Integer (UInt32)}
 */
export global LVM_HITTEST := 4114

/**
 * @type {Integer (UInt32)}
 */
export global LVM_ENSUREVISIBLE := 4115

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SCROLL := 4116

/**
 * @type {Integer (UInt32)}
 */
export global LVM_REDRAWITEMS := 4117

/**
 * @type {Integer (UInt32)}
 */
export global LVA_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global LVA_ALIGNLEFT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LVA_ALIGNTOP := 2

/**
 * @type {Integer (UInt32)}
 */
export global LVA_SNAPTOGRID := 5

/**
 * @type {Integer (UInt32)}
 */
export global LVM_ARRANGE := 4118

/**
 * @type {Integer (UInt32)}
 */
export global LVM_EDITLABELA := 4119

/**
 * @type {Integer (UInt32)}
 */
export global LVM_EDITLABELW := 4214

/**
 * @type {Integer (UInt32)}
 */
export global LVM_EDITLABEL := 4214

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETEDITCONTROL := 4120

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETCOLUMNA := 4121

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETCOLUMNW := 4191

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETCOLUMN := 4191

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETCOLUMNA := 4122

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETCOLUMNW := 4192

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETCOLUMN := 4192

/**
 * @type {Integer (UInt32)}
 */
export global LVM_INSERTCOLUMNA := 4123

/**
 * @type {Integer (UInt32)}
 */
export global LVM_INSERTCOLUMNW := 4193

/**
 * @type {Integer (UInt32)}
 */
export global LVM_INSERTCOLUMN := 4193

/**
 * @type {Integer (UInt32)}
 */
export global LVM_DELETECOLUMN := 4124

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETCOLUMNWIDTH := 4125

/**
 * @type {Integer (Int32)}
 */
export global LVSCW_AUTOSIZE := -1

/**
 * @type {Integer (Int32)}
 */
export global LVSCW_AUTOSIZE_USEHEADER := -2

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETCOLUMNWIDTH := 4126

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETHEADER := 4127

/**
 * @type {Integer (UInt32)}
 */
export global LVM_CREATEDRAGIMAGE := 4129

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETVIEWRECT := 4130

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETTEXTCOLOR := 4131

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETTEXTCOLOR := 4132

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETTEXTBKCOLOR := 4133

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETTEXTBKCOLOR := 4134

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETTOPINDEX := 4135

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETCOUNTPERPAGE := 4136

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETORIGIN := 4137

/**
 * @type {Integer (UInt32)}
 */
export global LVM_UPDATE := 4138

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETITEMSTATE := 4139

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETITEMSTATE := 4140

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETITEMTEXTA := 4141

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETITEMTEXTW := 4211

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETITEMTEXT := 4211

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETITEMTEXTA := 4142

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETITEMTEXTW := 4212

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETITEMTEXT := 4212

/**
 * @type {Integer (UInt32)}
 */
export global LVSICF_NOINVALIDATEALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global LVSICF_NOSCROLL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETITEMCOUNT := 4143

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SORTITEMS := 4144

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETITEMPOSITION32 := 4145

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETSELECTEDCOUNT := 4146

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETITEMSPACING := 4147

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETISEARCHSTRINGA := 4148

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETISEARCHSTRINGW := 4213

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETISEARCHSTRING := 4213

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETICONSPACING := 4149

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETEXTENDEDLISTVIEWSTYLE := 4150

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETEXTENDEDLISTVIEWSTYLE := 4151

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_GRIDLINES := 1

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_SUBITEMIMAGES := 2

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_CHECKBOXES := 4

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_TRACKSELECT := 8

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_HEADERDRAGDROP := 16

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_FULLROWSELECT := 32

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_ONECLICKACTIVATE := 64

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_TWOCLICKACTIVATE := 128

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_FLATSB := 256

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_REGIONAL := 512

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_INFOTIP := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_UNDERLINEHOT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_UNDERLINECOLD := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_MULTIWORKAREAS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_LABELTIP := 16384

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_BORDERSELECT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_DOUBLEBUFFER := 65536

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_HIDELABELS := 131072

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_SINGLEROW := 262144

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_SNAPTOGRID := 524288

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_SIMPLESELECT := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_JUSTIFYCOLUMNS := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_TRANSPARENTBKGND := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_TRANSPARENTSHADOWTEXT := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_AUTOAUTOARRANGE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_HEADERINALLVIEWS := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_AUTOCHECKSELECT := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_AUTOSIZECOLUMNS := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_COLUMNSNAPPOINTS := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global LVS_EX_COLUMNOVERFLOW := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETSUBITEMRECT := 4152

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SUBITEMHITTEST := 4153

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETCOLUMNORDERARRAY := 4154

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETCOLUMNORDERARRAY := 4155

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETHOTITEM := 4156

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETHOTITEM := 4157

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETHOTCURSOR := 4158

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETHOTCURSOR := 4159

/**
 * @type {Integer (UInt32)}
 */
export global LVM_APPROXIMATEVIEWRECT := 4160

/**
 * @type {Integer (UInt32)}
 */
export global LV_MAX_WORKAREAS := 16

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETWORKAREAS := 4161

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETWORKAREAS := 4166

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETNUMBEROFWORKAREAS := 4169

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETSELECTIONMARK := 4162

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETSELECTIONMARK := 4163

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETHOVERTIME := 4167

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETHOVERTIME := 4168

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETTOOLTIPS := 4170

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETTOOLTIPS := 4174

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SORTITEMSEX := 4177

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETBKIMAGEA := 4164

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETBKIMAGEW := 4234

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETBKIMAGEA := 4165

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETBKIMAGEW := 4235

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETSELECTEDCOLUMN := 4236

/**
 * @type {Integer (UInt32)}
 */
export global LV_VIEW_ICON := 0

/**
 * @type {Integer (UInt32)}
 */
export global LV_VIEW_DETAILS := 1

/**
 * @type {Integer (UInt32)}
 */
export global LV_VIEW_SMALLICON := 2

/**
 * @type {Integer (UInt32)}
 */
export global LV_VIEW_LIST := 3

/**
 * @type {Integer (UInt32)}
 */
export global LV_VIEW_TILE := 4

/**
 * @type {Integer (UInt32)}
 */
export global LV_VIEW_MAX := 4

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETVIEW := 4238

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETVIEW := 4239

/**
 * @type {Integer (UInt32)}
 */
export global LVM_INSERTGROUP := 4241

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETGROUPINFO := 4243

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETGROUPINFO := 4245

/**
 * @type {Integer (UInt32)}
 */
export global LVM_REMOVEGROUP := 4246

/**
 * @type {Integer (UInt32)}
 */
export global LVM_MOVEGROUP := 4247

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETGROUPCOUNT := 4248

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETGROUPINFOBYINDEX := 4249

/**
 * @type {Integer (UInt32)}
 */
export global LVM_MOVEITEMTOGROUP := 4250

/**
 * @type {Integer (UInt32)}
 */
export global LVGGR_GROUP := 0

/**
 * @type {Integer (UInt32)}
 */
export global LVGGR_HEADER := 1

/**
 * @type {Integer (UInt32)}
 */
export global LVGGR_LABEL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LVGGR_SUBSETLINK := 3

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETGROUPRECT := 4194

/**
 * @type {Integer (UInt32)}
 */
export global LVGMF_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global LVGMF_BORDERSIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LVGMF_BORDERCOLOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global LVGMF_TEXTCOLOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETGROUPMETRICS := 4251

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETGROUPMETRICS := 4252

/**
 * @type {Integer (UInt32)}
 */
export global LVM_ENABLEGROUPVIEW := 4253

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SORTGROUPS := 4254

/**
 * @type {Integer (UInt32)}
 */
export global LVM_INSERTGROUPSORTED := 4255

/**
 * @type {Integer (UInt32)}
 */
export global LVM_REMOVEALLGROUPS := 4256

/**
 * @type {Integer (UInt32)}
 */
export global LVM_HASGROUP := 4257

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETGROUPSTATE := 4188

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETFOCUSEDGROUP := 4189

/**
 * @type {Integer (UInt32)}
 */
export global LVTVIF_EXTENDED := 4

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETTILEVIEWINFO := 4258

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETTILEVIEWINFO := 4259

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETTILEINFO := 4260

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETTILEINFO := 4261

/**
 * @type {Integer (UInt32)}
 */
export global LVIM_AFTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETINSERTMARK := 4262

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETINSERTMARK := 4263

/**
 * @type {Integer (UInt32)}
 */
export global LVM_INSERTMARKHITTEST := 4264

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETINSERTMARKRECT := 4265

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETINSERTMARKCOLOR := 4266

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETINSERTMARKCOLOR := 4267

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETINFOTIP := 4269

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETSELECTEDCOLUMN := 4270

/**
 * @type {Integer (UInt32)}
 */
export global LVM_ISGROUPVIEWENABLED := 4271

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETOUTLINECOLOR := 4272

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETOUTLINECOLOR := 4273

/**
 * @type {Integer (UInt32)}
 */
export global LVM_CANCELEDITLABEL := 4275

/**
 * @type {Integer (UInt32)}
 */
export global LVM_MAPINDEXTOID := 4276

/**
 * @type {Integer (UInt32)}
 */
export global LVM_MAPIDTOINDEX := 4277

/**
 * @type {Integer (UInt32)}
 */
export global LVM_ISITEMVISIBLE := 4278

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETEMPTYTEXT := 4300

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETFOOTERRECT := 4301

/**
 * @type {Integer (UInt32)}
 */
export global LVFF_ITEMCOUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETFOOTERINFO := 4302

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETFOOTERITEMRECT := 4303

/**
 * @type {Integer (UInt32)}
 */
export global LVFIS_FOCUSED := 1

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETFOOTERITEM := 4304

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETITEMINDEXRECT := 4305

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETITEMINDEXSTATE := 4306

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETNEXTITEMINDEX := 4307

/**
 * @type {Integer (UInt32)}
 */
export global LVM_SETBKIMAGE := 4234

/**
 * @type {Integer (UInt32)}
 */
export global LVM_GETBKIMAGE := 4235

/**
 * @type {Integer (UInt32)}
 */
export global LVKF_ALT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LVKF_CONTROL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LVKF_SHIFT := 4

/**
 * @type {Integer (UInt32)}
 */
export global LVCDRF_NOSELECT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global LVCDRF_NOGROUPFRAME := 131072

/**
 * @type {Integer (UInt32)}
 */
export global LVN_ITEMCHANGING := 4294967196

/**
 * @type {Integer (UInt32)}
 */
export global LVN_ITEMCHANGED := 4294967195

/**
 * @type {Integer (UInt32)}
 */
export global LVN_INSERTITEM := 4294967194

/**
 * @type {Integer (UInt32)}
 */
export global LVN_DELETEITEM := 4294967193

/**
 * @type {Integer (UInt32)}
 */
export global LVN_DELETEALLITEMS := 4294967192

/**
 * @type {Integer (UInt32)}
 */
export global LVN_BEGINLABELEDITA := 4294967191

/**
 * @type {Integer (UInt32)}
 */
export global LVN_BEGINLABELEDITW := 4294967121

/**
 * @type {Integer (UInt32)}
 */
export global LVN_ENDLABELEDITA := 4294967190

/**
 * @type {Integer (UInt32)}
 */
export global LVN_ENDLABELEDITW := 4294967120

/**
 * @type {Integer (UInt32)}
 */
export global LVN_COLUMNCLICK := 4294967188

/**
 * @type {Integer (UInt32)}
 */
export global LVN_BEGINDRAG := 4294967187

/**
 * @type {Integer (UInt32)}
 */
export global LVN_BEGINRDRAG := 4294967185

/**
 * @type {Integer (UInt32)}
 */
export global LVN_ODCACHEHINT := 4294967183

/**
 * @type {Integer (UInt32)}
 */
export global LVN_ODFINDITEMA := 4294967144

/**
 * @type {Integer (UInt32)}
 */
export global LVN_ODFINDITEMW := 4294967117

/**
 * @type {Integer (UInt32)}
 */
export global LVN_ITEMACTIVATE := 4294967182

/**
 * @type {Integer (UInt32)}
 */
export global LVN_ODSTATECHANGED := 4294967181

/**
 * @type {Integer (UInt32)}
 */
export global LVN_ODFINDITEM := 4294967117

/**
 * @type {Integer (UInt32)}
 */
export global LVN_HOTTRACK := 4294967175

/**
 * @type {Integer (UInt32)}
 */
export global LVN_GETDISPINFOA := 4294967146

/**
 * @type {Integer (UInt32)}
 */
export global LVN_GETDISPINFOW := 4294967119

/**
 * @type {Integer (UInt32)}
 */
export global LVN_SETDISPINFOA := 4294967145

/**
 * @type {Integer (UInt32)}
 */
export global LVN_SETDISPINFOW := 4294967118

/**
 * @type {Integer (UInt32)}
 */
export global LVN_BEGINLABELEDIT := 4294967121

/**
 * @type {Integer (UInt32)}
 */
export global LVN_ENDLABELEDIT := 4294967120

/**
 * @type {Integer (UInt32)}
 */
export global LVN_GETDISPINFO := 4294967119

/**
 * @type {Integer (UInt32)}
 */
export global LVN_SETDISPINFO := 4294967118

/**
 * @type {Integer (UInt32)}
 */
export global LVN_KEYDOWN := 4294967141

/**
 * @type {Integer (UInt32)}
 */
export global LVN_MARQUEEBEGIN := 4294967140

/**
 * @type {Integer (UInt32)}
 */
export global LVN_GETINFOTIPA := 4294967139

/**
 * @type {Integer (UInt32)}
 */
export global LVN_GETINFOTIPW := 4294967138

/**
 * @type {Integer (UInt32)}
 */
export global LVN_GETINFOTIP := 4294967138

/**
 * @type {Integer (Int32)}
 */
export global LVNSCH_DEFAULT := -1

/**
 * @type {Integer (Int32)}
 */
export global LVNSCH_ERROR := -2

/**
 * @type {Integer (Int32)}
 */
export global LVNSCH_IGNORE := -3

/**
 * @type {Integer (UInt32)}
 */
export global LVN_INCREMENTALSEARCHA := 4294967134

/**
 * @type {Integer (UInt32)}
 */
export global LVN_INCREMENTALSEARCHW := 4294967133

/**
 * @type {Integer (UInt32)}
 */
export global LVN_INCREMENTALSEARCH := 4294967133

/**
 * @type {Integer (UInt32)}
 */
export global LVN_COLUMNDROPDOWN := 4294967132

/**
 * @type {Integer (UInt32)}
 */
export global LVN_COLUMNOVERFLOWCLICK := 4294967130

/**
 * @type {Integer (UInt32)}
 */
export global LVN_BEGINSCROLL := 4294967116

/**
 * @type {Integer (UInt32)}
 */
export global LVN_ENDSCROLL := 4294967115

/**
 * @type {Integer (UInt32)}
 */
export global LVN_LINKCLICK := 4294967112

/**
 * @type {Integer (UInt32)}
 */
export global LVN_GETEMPTYMARKUP := 4294967109

/**
 * @type {String}
 */
export global WC_TREEVIEWA := "SysTreeView32"

/**
 * @type {String}
 */
export global WC_TREEVIEWW := "SysTreeView32"

/**
 * @type {String}
 */
export global WC_TREEVIEW := "SysTreeView32"

/**
 * @type {Integer (UInt32)}
 */
export global TVS_HASBUTTONS := 1

/**
 * @type {Integer (UInt32)}
 */
export global TVS_HASLINES := 2

/**
 * @type {Integer (UInt32)}
 */
export global TVS_LINESATROOT := 4

/**
 * @type {Integer (UInt32)}
 */
export global TVS_EDITLABELS := 8

/**
 * @type {Integer (UInt32)}
 */
export global TVS_DISABLEDRAGDROP := 16

/**
 * @type {Integer (UInt32)}
 */
export global TVS_SHOWSELALWAYS := 32

/**
 * @type {Integer (UInt32)}
 */
export global TVS_RTLREADING := 64

/**
 * @type {Integer (UInt32)}
 */
export global TVS_NOTOOLTIPS := 128

/**
 * @type {Integer (UInt32)}
 */
export global TVS_CHECKBOXES := 256

/**
 * @type {Integer (UInt32)}
 */
export global TVS_TRACKSELECT := 512

/**
 * @type {Integer (UInt32)}
 */
export global TVS_SINGLEEXPAND := 1024

/**
 * @type {Integer (UInt32)}
 */
export global TVS_INFOTIP := 2048

/**
 * @type {Integer (UInt32)}
 */
export global TVS_FULLROWSELECT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global TVS_NOSCROLL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global TVS_NONEVENHEIGHT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global TVS_NOHSCROLL := 32768

/**
 * @type {Integer (UInt32)}
 */
export global TVS_EX_NOSINGLECOLLAPSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TVS_EX_MULTISELECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global TVS_EX_DOUBLEBUFFER := 4

/**
 * @type {Integer (UInt32)}
 */
export global TVS_EX_NOINDENTSTATE := 8

/**
 * @type {Integer (UInt32)}
 */
export global TVS_EX_RICHTOOLTIP := 16

/**
 * @type {Integer (UInt32)}
 */
export global TVS_EX_AUTOHSCROLL := 32

/**
 * @type {Integer (UInt32)}
 */
export global TVS_EX_FADEINOUTEXPANDOS := 64

/**
 * @type {Integer (UInt32)}
 */
export global TVS_EX_PARTIALCHECKBOXES := 128

/**
 * @type {Integer (UInt32)}
 */
export global TVS_EX_EXCLUSIONCHECKBOXES := 256

/**
 * @type {Integer (UInt32)}
 */
export global TVS_EX_DIMMEDCHECKBOXES := 512

/**
 * @type {Integer (UInt32)}
 */
export global TVS_EX_DRAWIMAGEASYNC := 1024

/**
 * @type {Integer (UInt32)}
 */
export global TVM_INSERTITEMA := 4352

/**
 * @type {Integer (UInt32)}
 */
export global TVM_INSERTITEMW := 4402

/**
 * @type {Integer (UInt32)}
 */
export global TVM_INSERTITEM := 4402

/**
 * @type {Integer (UInt32)}
 */
export global TVM_DELETEITEM := 4353

/**
 * @type {Integer (UInt32)}
 */
export global TVM_EXPAND := 4354

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETITEMRECT := 4356

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETCOUNT := 4357

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETINDENT := 4358

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETINDENT := 4359

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETIMAGELIST := 4360

/**
 * @type {Integer (UInt32)}
 */
export global TVSIL_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global TVSIL_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETIMAGELIST := 4361

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETNEXTITEM := 4362

/**
 * @type {Integer (UInt32)}
 */
export global TVGN_ROOT := 0

/**
 * @type {Integer (UInt32)}
 */
export global TVGN_NEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global TVGN_PREVIOUS := 2

/**
 * @type {Integer (UInt32)}
 */
export global TVGN_PARENT := 3

/**
 * @type {Integer (UInt32)}
 */
export global TVGN_CHILD := 4

/**
 * @type {Integer (UInt32)}
 */
export global TVGN_FIRSTVISIBLE := 5

/**
 * @type {Integer (UInt32)}
 */
export global TVGN_NEXTVISIBLE := 6

/**
 * @type {Integer (UInt32)}
 */
export global TVGN_PREVIOUSVISIBLE := 7

/**
 * @type {Integer (UInt32)}
 */
export global TVGN_DROPHILITE := 8

/**
 * @type {Integer (UInt32)}
 */
export global TVGN_CARET := 9

/**
 * @type {Integer (UInt32)}
 */
export global TVGN_LASTVISIBLE := 10

/**
 * @type {Integer (UInt32)}
 */
export global TVGN_NEXTSELECTED := 11

/**
 * @type {Integer (UInt32)}
 */
export global TVSI_NOSINGLEEXPAND := 32768

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SELECTITEM := 4363

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETITEMA := 4364

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETITEMW := 4414

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETITEM := 4414

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETITEMA := 4365

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETITEMW := 4415

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETITEM := 4415

/**
 * @type {Integer (UInt32)}
 */
export global TVM_EDITLABELA := 4366

/**
 * @type {Integer (UInt32)}
 */
export global TVM_EDITLABELW := 4417

/**
 * @type {Integer (UInt32)}
 */
export global TVM_EDITLABEL := 4417

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETEDITCONTROL := 4367

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETVISIBLECOUNT := 4368

/**
 * @type {Integer (UInt32)}
 */
export global TVM_HITTEST := 4369

/**
 * @type {Integer (UInt32)}
 */
export global TVM_CREATEDRAGIMAGE := 4370

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SORTCHILDREN := 4371

/**
 * @type {Integer (UInt32)}
 */
export global TVM_ENSUREVISIBLE := 4372

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SORTCHILDRENCB := 4373

/**
 * @type {Integer (UInt32)}
 */
export global TVM_ENDEDITLABELNOW := 4374

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETISEARCHSTRINGA := 4375

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETISEARCHSTRINGW := 4416

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETISEARCHSTRING := 4416

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETTOOLTIPS := 4376

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETTOOLTIPS := 4377

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETINSERTMARK := 4378

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETUNICODEFORMAT := 8197

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETUNICODEFORMAT := 8198

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETITEMHEIGHT := 4379

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETITEMHEIGHT := 4380

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETBKCOLOR := 4381

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETTEXTCOLOR := 4382

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETBKCOLOR := 4383

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETTEXTCOLOR := 4384

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETSCROLLTIME := 4385

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETSCROLLTIME := 4386

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETINSERTMARKCOLOR := 4389

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETINSERTMARKCOLOR := 4390

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETBORDER := 4387

/**
 * @type {Integer (UInt32)}
 */
export global TVSBF_XBORDER := 1

/**
 * @type {Integer (UInt32)}
 */
export global TVSBF_YBORDER := 2

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETITEMSTATE := 4391

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETLINECOLOR := 4392

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETLINECOLOR := 4393

/**
 * @type {Integer (UInt32)}
 */
export global TVM_MAPACCIDTOHTREEITEM := 4394

/**
 * @type {Integer (UInt32)}
 */
export global TVM_MAPHTREEITEMTOACCID := 4395

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETEXTENDEDSTYLE := 4396

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETEXTENDEDSTYLE := 4397

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETAUTOSCROLLINFO := 4411

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SETHOT := 4410

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETSELECTEDCOUNT := 4422

/**
 * @type {Integer (UInt32)}
 */
export global TVM_SHOWINFOTIP := 4423

/**
 * @type {Integer (UInt32)}
 */
export global TVM_GETITEMPARTRECT := 4424

/**
 * @type {Integer (UInt32)}
 */
export global TVN_SELCHANGINGA := 4294966895

/**
 * @type {Integer (UInt32)}
 */
export global TVN_SELCHANGINGW := 4294966846

/**
 * @type {Integer (UInt32)}
 */
export global TVN_SELCHANGEDA := 4294966894

/**
 * @type {Integer (UInt32)}
 */
export global TVN_SELCHANGEDW := 4294966845

/**
 * @type {Integer (UInt32)}
 */
export global TVN_GETDISPINFOA := 4294966893

/**
 * @type {Integer (UInt32)}
 */
export global TVN_GETDISPINFOW := 4294966844

/**
 * @type {Integer (UInt32)}
 */
export global TVN_SETDISPINFOA := 4294966892

/**
 * @type {Integer (UInt32)}
 */
export global TVN_SETDISPINFOW := 4294966843

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ITEMEXPANDINGA := 4294966891

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ITEMEXPANDINGW := 4294966842

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ITEMEXPANDEDA := 4294966890

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ITEMEXPANDEDW := 4294966841

/**
 * @type {Integer (UInt32)}
 */
export global TVN_BEGINDRAGA := 4294966889

/**
 * @type {Integer (UInt32)}
 */
export global TVN_BEGINDRAGW := 4294966840

/**
 * @type {Integer (UInt32)}
 */
export global TVN_BEGINRDRAGA := 4294966888

/**
 * @type {Integer (UInt32)}
 */
export global TVN_BEGINRDRAGW := 4294966839

/**
 * @type {Integer (UInt32)}
 */
export global TVN_DELETEITEMA := 4294966887

/**
 * @type {Integer (UInt32)}
 */
export global TVN_DELETEITEMW := 4294966838

/**
 * @type {Integer (UInt32)}
 */
export global TVN_BEGINLABELEDITA := 4294966886

/**
 * @type {Integer (UInt32)}
 */
export global TVN_BEGINLABELEDITW := 4294966837

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ENDLABELEDITA := 4294966885

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ENDLABELEDITW := 4294966836

/**
 * @type {Integer (UInt32)}
 */
export global TVN_KEYDOWN := 4294966884

/**
 * @type {Integer (UInt32)}
 */
export global TVN_GETINFOTIPA := 4294966883

/**
 * @type {Integer (UInt32)}
 */
export global TVN_GETINFOTIPW := 4294966882

/**
 * @type {Integer (UInt32)}
 */
export global TVN_SINGLEEXPAND := 4294966881

/**
 * @type {Integer (UInt32)}
 */
export global TVNRET_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global TVNRET_SKIPOLD := 1

/**
 * @type {Integer (UInt32)}
 */
export global TVNRET_SKIPNEW := 2

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ITEMCHANGINGA := 4294966880

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ITEMCHANGINGW := 4294966879

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ITEMCHANGEDA := 4294966878

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ITEMCHANGEDW := 4294966877

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ASYNCDRAW := 4294966876

/**
 * @type {Integer (UInt32)}
 */
export global TVN_SELCHANGING := 4294966846

/**
 * @type {Integer (UInt32)}
 */
export global TVN_SELCHANGED := 4294966845

/**
 * @type {Integer (UInt32)}
 */
export global TVN_GETDISPINFO := 4294966844

/**
 * @type {Integer (UInt32)}
 */
export global TVN_SETDISPINFO := 4294966843

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ITEMEXPANDING := 4294966842

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ITEMEXPANDED := 4294966841

/**
 * @type {Integer (UInt32)}
 */
export global TVN_BEGINDRAG := 4294966840

/**
 * @type {Integer (UInt32)}
 */
export global TVN_BEGINRDRAG := 4294966839

/**
 * @type {Integer (UInt32)}
 */
export global TVN_DELETEITEM := 4294966838

/**
 * @type {Integer (UInt32)}
 */
export global TVN_BEGINLABELEDIT := 4294966837

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ENDLABELEDIT := 4294966836

/**
 * @type {Integer (UInt32)}
 */
export global TVN_GETINFOTIP := 4294966882

/**
 * @type {Integer (UInt32)}
 */
export global TVCDRF_NOIMAGES := 65536

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ITEMCHANGING := 4294966879

/**
 * @type {Integer (UInt32)}
 */
export global TVN_ITEMCHANGED := 4294966877

/**
 * @type {String}
 */
export global WC_COMBOBOXEXW := "ComboBoxEx32"

/**
 * @type {String}
 */
export global WC_COMBOBOXEXA := "ComboBoxEx32"

/**
 * @type {String}
 */
export global WC_COMBOBOXEX := "ComboBoxEx32"

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_INSERTITEMA := 1025

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_SETIMAGELIST := 1026

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_GETIMAGELIST := 1027

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_GETITEMA := 1028

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_SETITEMA := 1029

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_GETCOMBOCONTROL := 1030

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_GETEDITCONTROL := 1031

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_SETEXSTYLE := 1032

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_SETEXTENDEDSTYLE := 1038

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_GETEXSTYLE := 1033

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_GETEXTENDEDSTYLE := 1033

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_SETUNICODEFORMAT := 8197

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_GETUNICODEFORMAT := 8198

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_HASEDITCHANGED := 1034

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_INSERTITEMW := 1035

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_SETITEMW := 1036

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_GETITEMW := 1037

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_INSERTITEM := 1035

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_SETITEM := 1036

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_GETITEM := 1037

/**
 * @type {Integer (UInt32)}
 */
export global CBEM_SETWINDOWTHEME := 8203

/**
 * @type {Integer (UInt32)}
 */
export global CBES_EX_NOEDITIMAGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CBES_EX_NOEDITIMAGEINDENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CBES_EX_PATHWORDBREAKPROC := 4

/**
 * @type {Integer (UInt32)}
 */
export global CBES_EX_NOSIZELIMIT := 8

/**
 * @type {Integer (UInt32)}
 */
export global CBES_EX_CASESENSITIVE := 16

/**
 * @type {Integer (UInt32)}
 */
export global CBES_EX_TEXTENDELLIPSIS := 32

/**
 * @type {Integer (UInt32)}
 */
export global CBEN_GETDISPINFOA := 4294966496

/**
 * @type {Integer (UInt32)}
 */
export global CBEN_INSERTITEM := 4294966495

/**
 * @type {Integer (UInt32)}
 */
export global CBEN_DELETEITEM := 4294966494

/**
 * @type {Integer (UInt32)}
 */
export global CBEN_BEGINEDIT := 4294966492

/**
 * @type {Integer (UInt32)}
 */
export global CBEN_ENDEDITA := 4294966491

/**
 * @type {Integer (UInt32)}
 */
export global CBEN_ENDEDITW := 4294966490

/**
 * @type {Integer (UInt32)}
 */
export global CBEN_GETDISPINFOW := 4294966489

/**
 * @type {Integer (UInt32)}
 */
export global CBEN_DRAGBEGINA := 4294966488

/**
 * @type {Integer (UInt32)}
 */
export global CBEN_DRAGBEGINW := 4294966487

/**
 * @type {Integer (UInt32)}
 */
export global CBEN_DRAGBEGIN := 4294966487

/**
 * @type {Integer (UInt32)}
 */
export global CBEN_ENDEDIT := 4294966490

/**
 * @type {Integer (UInt32)}
 */
export global CBENF_KILLFOCUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CBENF_RETURN := 2

/**
 * @type {Integer (UInt32)}
 */
export global CBENF_ESCAPE := 3

/**
 * @type {Integer (UInt32)}
 */
export global CBENF_DROPDOWN := 4

/**
 * @type {Integer (UInt32)}
 */
export global CBEMAXSTRLEN := 260

/**
 * @type {String}
 */
export global WC_TABCONTROLA := "SysTabControl32"

/**
 * @type {String}
 */
export global WC_TABCONTROLW := "SysTabControl32"

/**
 * @type {String}
 */
export global WC_TABCONTROL := "SysTabControl32"

/**
 * @type {Integer (UInt32)}
 */
export global TCS_SCROLLOPPOSITE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TCS_BOTTOM := 2

/**
 * @type {Integer (UInt32)}
 */
export global TCS_RIGHT := 2

/**
 * @type {Integer (UInt32)}
 */
export global TCS_MULTISELECT := 4

/**
 * @type {Integer (UInt32)}
 */
export global TCS_FLATBUTTONS := 8

/**
 * @type {Integer (UInt32)}
 */
export global TCS_FORCEICONLEFT := 16

/**
 * @type {Integer (UInt32)}
 */
export global TCS_FORCELABELLEFT := 32

/**
 * @type {Integer (UInt32)}
 */
export global TCS_HOTTRACK := 64

/**
 * @type {Integer (UInt32)}
 */
export global TCS_VERTICAL := 128

/**
 * @type {Integer (UInt32)}
 */
export global TCS_TABS := 0

/**
 * @type {Integer (UInt32)}
 */
export global TCS_BUTTONS := 256

/**
 * @type {Integer (UInt32)}
 */
export global TCS_SINGLELINE := 0

/**
 * @type {Integer (UInt32)}
 */
export global TCS_MULTILINE := 512

/**
 * @type {Integer (UInt32)}
 */
export global TCS_RIGHTJUSTIFY := 0

/**
 * @type {Integer (UInt32)}
 */
export global TCS_FIXEDWIDTH := 1024

/**
 * @type {Integer (UInt32)}
 */
export global TCS_RAGGEDRIGHT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global TCS_FOCUSONBUTTONDOWN := 4096

/**
 * @type {Integer (UInt32)}
 */
export global TCS_OWNERDRAWFIXED := 8192

/**
 * @type {Integer (UInt32)}
 */
export global TCS_TOOLTIPS := 16384

/**
 * @type {Integer (UInt32)}
 */
export global TCS_FOCUSNEVER := 32768

/**
 * @type {Integer (UInt32)}
 */
export global TCS_EX_FLATSEPARATORS := 1

/**
 * @type {Integer (UInt32)}
 */
export global TCS_EX_REGISTERDROP := 2

/**
 * @type {Integer (UInt32)}
 */
export global TCM_GETIMAGELIST := 4866

/**
 * @type {Integer (UInt32)}
 */
export global TCM_SETIMAGELIST := 4867

/**
 * @type {Integer (UInt32)}
 */
export global TCM_GETITEMCOUNT := 4868

/**
 * @type {Integer (UInt32)}
 */
export global TCM_GETITEMA := 4869

/**
 * @type {Integer (UInt32)}
 */
export global TCM_GETITEMW := 4924

/**
 * @type {Integer (UInt32)}
 */
export global TCM_GETITEM := 4924

/**
 * @type {Integer (UInt32)}
 */
export global TCM_SETITEMA := 4870

/**
 * @type {Integer (UInt32)}
 */
export global TCM_SETITEMW := 4925

/**
 * @type {Integer (UInt32)}
 */
export global TCM_SETITEM := 4925

/**
 * @type {Integer (UInt32)}
 */
export global TCM_INSERTITEMA := 4871

/**
 * @type {Integer (UInt32)}
 */
export global TCM_INSERTITEMW := 4926

/**
 * @type {Integer (UInt32)}
 */
export global TCM_INSERTITEM := 4926

/**
 * @type {Integer (UInt32)}
 */
export global TCM_DELETEITEM := 4872

/**
 * @type {Integer (UInt32)}
 */
export global TCM_DELETEALLITEMS := 4873

/**
 * @type {Integer (UInt32)}
 */
export global TCM_GETITEMRECT := 4874

/**
 * @type {Integer (UInt32)}
 */
export global TCM_GETCURSEL := 4875

/**
 * @type {Integer (UInt32)}
 */
export global TCM_SETCURSEL := 4876

/**
 * @type {Integer (UInt32)}
 */
export global TCM_HITTEST := 4877

/**
 * @type {Integer (UInt32)}
 */
export global TCM_SETITEMEXTRA := 4878

/**
 * @type {Integer (UInt32)}
 */
export global TCM_ADJUSTRECT := 4904

/**
 * @type {Integer (UInt32)}
 */
export global TCM_SETITEMSIZE := 4905

/**
 * @type {Integer (UInt32)}
 */
export global TCM_REMOVEIMAGE := 4906

/**
 * @type {Integer (UInt32)}
 */
export global TCM_SETPADDING := 4907

/**
 * @type {Integer (UInt32)}
 */
export global TCM_GETROWCOUNT := 4908

/**
 * @type {Integer (UInt32)}
 */
export global TCM_GETTOOLTIPS := 4909

/**
 * @type {Integer (UInt32)}
 */
export global TCM_SETTOOLTIPS := 4910

/**
 * @type {Integer (UInt32)}
 */
export global TCM_GETCURFOCUS := 4911

/**
 * @type {Integer (UInt32)}
 */
export global TCM_SETCURFOCUS := 4912

/**
 * @type {Integer (UInt32)}
 */
export global TCM_SETMINTABWIDTH := 4913

/**
 * @type {Integer (UInt32)}
 */
export global TCM_DESELECTALL := 4914

/**
 * @type {Integer (UInt32)}
 */
export global TCM_HIGHLIGHTITEM := 4915

/**
 * @type {Integer (UInt32)}
 */
export global TCM_SETEXTENDEDSTYLE := 4916

/**
 * @type {Integer (UInt32)}
 */
export global TCM_GETEXTENDEDSTYLE := 4917

/**
 * @type {Integer (UInt32)}
 */
export global TCM_SETUNICODEFORMAT := 8197

/**
 * @type {Integer (UInt32)}
 */
export global TCM_GETUNICODEFORMAT := 8198

/**
 * @type {Integer (UInt32)}
 */
export global TCN_KEYDOWN := 4294966746

/**
 * @type {Integer (UInt32)}
 */
export global TCN_SELCHANGE := 4294966745

/**
 * @type {Integer (UInt32)}
 */
export global TCN_SELCHANGING := 4294966744

/**
 * @type {Integer (UInt32)}
 */
export global TCN_GETOBJECT := 4294966743

/**
 * @type {Integer (UInt32)}
 */
export global TCN_FOCUSCHANGE := 4294966742

/**
 * @type {String}
 */
export global ANIMATE_CLASSW := "SysAnimate32"

/**
 * @type {String}
 */
export global ANIMATE_CLASSA := "SysAnimate32"

/**
 * @type {String}
 */
export global ANIMATE_CLASS := "SysAnimate32"

/**
 * @type {Integer (UInt32)}
 */
export global ACS_CENTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACS_TRANSPARENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACS_AUTOPLAY := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACS_TIMER := 8

/**
 * @type {Integer (UInt32)}
 */
export global ACM_OPENA := 1124

/**
 * @type {Integer (UInt32)}
 */
export global ACM_OPENW := 1127

/**
 * @type {Integer (UInt32)}
 */
export global ACM_OPEN := 1127

/**
 * @type {Integer (UInt32)}
 */
export global ACM_PLAY := 1125

/**
 * @type {Integer (UInt32)}
 */
export global ACM_STOP := 1126

/**
 * @type {Integer (UInt32)}
 */
export global ACM_ISPLAYING := 1128

/**
 * @type {Integer (UInt32)}
 */
export global ACN_START := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACN_STOP := 2

/**
 * @type {String}
 */
export global MONTHCAL_CLASSW := "SysMonthCal32"

/**
 * @type {String}
 */
export global MONTHCAL_CLASSA := "SysMonthCal32"

/**
 * @type {String}
 */
export global MONTHCAL_CLASS := "SysMonthCal32"

/**
 * @type {Integer (UInt32)}
 */
export global MCM_FIRST := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETCURSEL := 4097

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SETCURSEL := 4098

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETMAXSELCOUNT := 4099

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SETMAXSELCOUNT := 4100

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETSELRANGE := 4101

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SETSELRANGE := 4102

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETMONTHRANGE := 4103

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SETDAYSTATE := 4104

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETMINREQRECT := 4105

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SETCOLOR := 4106

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETCOLOR := 4107

/**
 * @type {Integer (UInt32)}
 */
export global MCSC_BACKGROUND := 0

/**
 * @type {Integer (UInt32)}
 */
export global MCSC_TEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MCSC_TITLEBK := 2

/**
 * @type {Integer (UInt32)}
 */
export global MCSC_TITLETEXT := 3

/**
 * @type {Integer (UInt32)}
 */
export global MCSC_MONTHBK := 4

/**
 * @type {Integer (UInt32)}
 */
export global MCSC_TRAILINGTEXT := 5

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SETTODAY := 4108

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETTODAY := 4109

/**
 * @type {Integer (UInt32)}
 */
export global MCM_HITTEST := 4110

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SETFIRSTDAYOFWEEK := 4111

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETFIRSTDAYOFWEEK := 4112

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETRANGE := 4113

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SETRANGE := 4114

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETMONTHDELTA := 4115

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SETMONTHDELTA := 4116

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETMAXTODAYWIDTH := 4117

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SETUNICODEFORMAT := 8197

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETUNICODEFORMAT := 8198

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETCURRENTVIEW := 4118

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETCALENDARCOUNT := 4119

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETCALENDARGRIDINFO := 4120

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETCALID := 4123

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SETCALID := 4124

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SIZERECTTOMIN := 4125

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SETCALENDARBORDER := 4126

/**
 * @type {Integer (UInt32)}
 */
export global MCM_GETCALENDARBORDER := 4127

/**
 * @type {Integer (UInt32)}
 */
export global MCM_SETCURRENTVIEW := 4128

/**
 * @type {Integer (UInt32)}
 */
export global MCN_SELCHANGE := 4294966547

/**
 * @type {Integer (UInt32)}
 */
export global MCN_GETDAYSTATE := 4294966549

/**
 * @type {Integer (UInt32)}
 */
export global MCN_SELECT := 4294966550

/**
 * @type {Integer (UInt32)}
 */
export global MCN_VIEWCHANGE := 4294966546

/**
 * @type {Integer (UInt32)}
 */
export global MCS_DAYSTATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MCS_MULTISELECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global MCS_WEEKNUMBERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global MCS_NOTODAYCIRCLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global MCS_NOTODAY := 16

/**
 * @type {Integer (UInt32)}
 */
export global MCS_NOTRAILINGDATES := 64

/**
 * @type {Integer (UInt32)}
 */
export global MCS_SHORTDAYSOFWEEK := 128

/**
 * @type {Integer (UInt32)}
 */
export global MCS_NOSELCHANGEONNAV := 256

/**
 * @type {Integer (UInt32)}
 */
export global GMR_VISIBLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global GMR_DAYSTATE := 1

/**
 * @type {String}
 */
export global DATETIMEPICK_CLASSW := "SysDateTimePick32"

/**
 * @type {String}
 */
export global DATETIMEPICK_CLASSA := "SysDateTimePick32"

/**
 * @type {String}
 */
export global DATETIMEPICK_CLASS := "SysDateTimePick32"

/**
 * @type {Integer (UInt32)}
 */
export global DTM_FIRST := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DTM_GETSYSTEMTIME := 4097

/**
 * @type {Integer (UInt32)}
 */
export global DTM_SETSYSTEMTIME := 4098

/**
 * @type {Integer (UInt32)}
 */
export global DTM_GETRANGE := 4099

/**
 * @type {Integer (UInt32)}
 */
export global DTM_SETRANGE := 4100

/**
 * @type {Integer (UInt32)}
 */
export global DTM_SETFORMATA := 4101

/**
 * @type {Integer (UInt32)}
 */
export global DTM_SETFORMATW := 4146

/**
 * @type {Integer (UInt32)}
 */
export global DTM_SETFORMAT := 4146

/**
 * @type {Integer (UInt32)}
 */
export global DTM_SETMCCOLOR := 4102

/**
 * @type {Integer (UInt32)}
 */
export global DTM_GETMCCOLOR := 4103

/**
 * @type {Integer (UInt32)}
 */
export global DTM_GETMONTHCAL := 4104

/**
 * @type {Integer (UInt32)}
 */
export global DTM_SETMCFONT := 4105

/**
 * @type {Integer (UInt32)}
 */
export global DTM_GETMCFONT := 4106

/**
 * @type {Integer (UInt32)}
 */
export global DTM_SETMCSTYLE := 4107

/**
 * @type {Integer (UInt32)}
 */
export global DTM_GETMCSTYLE := 4108

/**
 * @type {Integer (UInt32)}
 */
export global DTM_CLOSEMONTHCAL := 4109

/**
 * @type {Integer (UInt32)}
 */
export global DTM_GETDATETIMEPICKERINFO := 4110

/**
 * @type {Integer (UInt32)}
 */
export global DTM_GETIDEALSIZE := 4111

/**
 * @type {Integer (UInt32)}
 */
export global DTS_UPDOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global DTS_SHOWNONE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DTS_SHORTDATEFORMAT := 0

/**
 * @type {Integer (UInt32)}
 */
export global DTS_LONGDATEFORMAT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DTS_SHORTDATECENTURYFORMAT := 12

/**
 * @type {Integer (UInt32)}
 */
export global DTS_TIMEFORMAT := 9

/**
 * @type {Integer (UInt32)}
 */
export global DTS_APPCANPARSE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DTS_RIGHTALIGN := 32

/**
 * @type {Integer (UInt32)}
 */
export global DTN_DATETIMECHANGE := 4294966537

/**
 * @type {Integer (UInt32)}
 */
export global DTN_USERSTRINGA := 4294966538

/**
 * @type {Integer (UInt32)}
 */
export global DTN_USERSTRINGW := 4294966551

/**
 * @type {Integer (UInt32)}
 */
export global DTN_USERSTRING := 4294966551

/**
 * @type {Integer (UInt32)}
 */
export global DTN_WMKEYDOWNA := 4294966539

/**
 * @type {Integer (UInt32)}
 */
export global DTN_WMKEYDOWNW := 4294966552

/**
 * @type {Integer (UInt32)}
 */
export global DTN_WMKEYDOWN := 4294966552

/**
 * @type {Integer (UInt32)}
 */
export global DTN_FORMATA := 4294966540

/**
 * @type {Integer (UInt32)}
 */
export global DTN_FORMATW := 4294966553

/**
 * @type {Integer (UInt32)}
 */
export global DTN_FORMAT := 4294966553

/**
 * @type {Integer (UInt32)}
 */
export global DTN_FORMATQUERYA := 4294966541

/**
 * @type {Integer (UInt32)}
 */
export global DTN_FORMATQUERYW := 4294966554

/**
 * @type {Integer (UInt32)}
 */
export global DTN_FORMATQUERY := 4294966554

/**
 * @type {Integer (UInt32)}
 */
export global DTN_DROPDOWN := 4294966542

/**
 * @type {Integer (UInt32)}
 */
export global DTN_CLOSEUP := 4294966543

/**
 * @type {Integer (UInt32)}
 */
export global GDTR_MIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global GDTR_MAX := 2

/**
 * @type {Integer (Int32)}
 */
export global GDT_ERROR := -1

/**
 * @type {Integer (UInt32)}
 */
export global IPM_CLEARADDRESS := 1124

/**
 * @type {Integer (UInt32)}
 */
export global IPM_SETADDRESS := 1125

/**
 * @type {Integer (UInt32)}
 */
export global IPM_GETADDRESS := 1126

/**
 * @type {Integer (UInt32)}
 */
export global IPM_SETRANGE := 1127

/**
 * @type {Integer (UInt32)}
 */
export global IPM_SETFOCUS := 1128

/**
 * @type {Integer (UInt32)}
 */
export global IPM_ISBLANK := 1129

/**
 * @type {String}
 */
export global WC_IPADDRESSW := "SysIPAddress32"

/**
 * @type {String}
 */
export global WC_IPADDRESSA := "SysIPAddress32"

/**
 * @type {String}
 */
export global WC_IPADDRESS := "SysIPAddress32"

/**
 * @type {Integer (UInt32)}
 */
export global IPN_FIELDCHANGED := 4294966436

/**
 * @type {String}
 */
export global WC_PAGESCROLLERW := "SysPager"

/**
 * @type {String}
 */
export global WC_PAGESCROLLERA := "SysPager"

/**
 * @type {String}
 */
export global WC_PAGESCROLLER := "SysPager"

/**
 * @type {Integer (UInt32)}
 */
export global PGS_VERT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PGS_HORZ := 1

/**
 * @type {Integer (UInt32)}
 */
export global PGS_AUTOSCROLL := 2

/**
 * @type {Integer (UInt32)}
 */
export global PGS_DRAGNDROP := 4

/**
 * @type {Integer (UInt32)}
 */
export global PGF_INVISIBLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PGF_NORMAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global PGF_GRAYED := 2

/**
 * @type {Integer (UInt32)}
 */
export global PGF_DEPRESSED := 4

/**
 * @type {Integer (UInt32)}
 */
export global PGF_HOT := 8

/**
 * @type {Integer (UInt32)}
 */
export global PGB_TOPORLEFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PGB_BOTTOMORRIGHT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PGM_SETCHILD := 5121

/**
 * @type {Integer (UInt32)}
 */
export global PGM_RECALCSIZE := 5122

/**
 * @type {Integer (UInt32)}
 */
export global PGM_FORWARDMOUSE := 5123

/**
 * @type {Integer (UInt32)}
 */
export global PGM_SETBKCOLOR := 5124

/**
 * @type {Integer (UInt32)}
 */
export global PGM_GETBKCOLOR := 5125

/**
 * @type {Integer (UInt32)}
 */
export global PGM_SETBORDER := 5126

/**
 * @type {Integer (UInt32)}
 */
export global PGM_GETBORDER := 5127

/**
 * @type {Integer (UInt32)}
 */
export global PGM_SETPOS := 5128

/**
 * @type {Integer (UInt32)}
 */
export global PGM_GETPOS := 5129

/**
 * @type {Integer (UInt32)}
 */
export global PGM_SETBUTTONSIZE := 5130

/**
 * @type {Integer (UInt32)}
 */
export global PGM_GETBUTTONSIZE := 5131

/**
 * @type {Integer (UInt32)}
 */
export global PGM_GETBUTTONSTATE := 5132

/**
 * @type {Integer (UInt32)}
 */
export global PGM_GETDROPTARGET := 8196

/**
 * @type {Integer (UInt32)}
 */
export global PGM_SETSCROLLINFO := 5133

/**
 * @type {Integer (UInt32)}
 */
export global PGN_SCROLL := 4294966395

/**
 * @type {Integer (UInt32)}
 */
export global PGN_CALCSIZE := 4294966394

/**
 * @type {Integer (UInt32)}
 */
export global PGN_HOTITEMCHANGE := 4294966393

/**
 * @type {String}
 */
export global WC_NATIVEFONTCTLW := "NativeFontCtl"

/**
 * @type {String}
 */
export global WC_NATIVEFONTCTLA := "NativeFontCtl"

/**
 * @type {String}
 */
export global WC_NATIVEFONTCTL := "NativeFontCtl"

/**
 * @type {Integer (UInt32)}
 */
export global NFS_EDIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global NFS_STATIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global NFS_LISTCOMBO := 4

/**
 * @type {Integer (UInt32)}
 */
export global NFS_BUTTON := 8

/**
 * @type {Integer (UInt32)}
 */
export global NFS_ALL := 16

/**
 * @type {Integer (UInt32)}
 */
export global NFS_USEFONTASSOC := 32

/**
 * @type {String}
 */
export global WC_BUTTONA := "Button"

/**
 * @type {String}
 */
export global WC_BUTTONW := "Button"

/**
 * @type {String}
 */
export global WC_BUTTON := "Button"

/**
 * @type {Integer (UInt32)}
 */
export global BCM_GETIDEALSIZE := 5633

/**
 * @type {Integer (UInt32)}
 */
export global BCM_SETIMAGELIST := 5634

/**
 * @type {Integer (UInt32)}
 */
export global BCM_GETIMAGELIST := 5635

/**
 * @type {Integer (UInt32)}
 */
export global BCM_SETTEXTMARGIN := 5636

/**
 * @type {Integer (UInt32)}
 */
export global BCM_GETTEXTMARGIN := 5637

/**
 * @type {Integer (UInt32)}
 */
export global BCN_HOTITEMCHANGE := 4294966047

/**
 * @type {Integer (UInt32)}
 */
export global BST_HOT := 512

/**
 * @type {Integer (UInt32)}
 */
export global BST_DROPDOWNPUSHED := 1024

/**
 * @type {Integer (Int32)}
 */
export global BS_SPLITBUTTON := 12

/**
 * @type {Integer (Int32)}
 */
export global BS_DEFSPLITBUTTON := 13

/**
 * @type {Integer (Int32)}
 */
export global BS_COMMANDLINK := 14

/**
 * @type {Integer (Int32)}
 */
export global BS_DEFCOMMANDLINK := 15

/**
 * @type {Integer (UInt32)}
 */
export global BCSIF_GLYPH := 1

/**
 * @type {Integer (UInt32)}
 */
export global BCSIF_IMAGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global BCSIF_STYLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global BCSIF_SIZE := 8

/**
 * @type {Integer (UInt32)}
 */
export global BCSS_NOSPLIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global BCSS_STRETCH := 2

/**
 * @type {Integer (UInt32)}
 */
export global BCSS_ALIGNLEFT := 4

/**
 * @type {Integer (UInt32)}
 */
export global BCSS_IMAGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global BCM_SETDROPDOWNSTATE := 5638

/**
 * @type {Integer (UInt32)}
 */
export global BCM_SETSPLITINFO := 5639

/**
 * @type {Integer (UInt32)}
 */
export global BCM_GETSPLITINFO := 5640

/**
 * @type {Integer (UInt32)}
 */
export global BCM_SETNOTE := 5641

/**
 * @type {Integer (UInt32)}
 */
export global BCM_GETNOTE := 5642

/**
 * @type {Integer (UInt32)}
 */
export global BCM_GETNOTELENGTH := 5643

/**
 * @type {Integer (UInt32)}
 */
export global BCM_SETSHIELD := 5644

/**
 * @type {Integer (UInt32)}
 */
export global BCN_DROPDOWN := 4294966048

/**
 * @type {String}
 */
export global WC_STATICA := "Static"

/**
 * @type {String}
 */
export global WC_STATICW := "Static"

/**
 * @type {String}
 */
export global WC_STATIC := "Static"

/**
 * @type {String}
 */
export global WC_EDITA := "Edit"

/**
 * @type {String}
 */
export global WC_EDITW := "Edit"

/**
 * @type {String}
 */
export global WC_EDIT := "Edit"

/**
 * @type {Integer (Int32)}
 */
export global ES_EX_ALLOWEOL_CR := 1

/**
 * @type {Integer (Int32)}
 */
export global ES_EX_ALLOWEOL_LF := 2

/**
 * @type {Integer (Int32)}
 */
export global ES_EX_CONVERT_EOL_ON_PASTE := 4

/**
 * @type {Integer (Int32)}
 */
export global ES_EX_ZOOMABLE := 16

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETCUEBANNER := 5377

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETCUEBANNER := 5378

/**
 * @type {Integer (UInt32)}
 */
export global EM_SHOWBALLOONTIP := 5379

/**
 * @type {Integer (UInt32)}
 */
export global EM_HIDEBALLOONTIP := 5380

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETHILITE := 5381

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETHILITE := 5382

/**
 * @type {Integer (UInt32)}
 */
export global EM_NOSETFOCUS := 5383

/**
 * @type {Integer (UInt32)}
 */
export global EM_TAKEFOCUS := 5384

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETEXTENDEDSTYLE := 5386

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETEXTENDEDSTYLE := 5387

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETENDOFLINE := 5388

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETENDOFLINE := 5389

/**
 * @type {Integer (UInt32)}
 */
export global EM_ENABLESEARCHWEB := 5390

/**
 * @type {Integer (UInt32)}
 */
export global EM_SEARCHWEB := 5391

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETCARETINDEX := 5393

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETCARETINDEX := 5394

/**
 * @type {Integer (UInt32)}
 */
export global EM_FILELINEFROMCHAR := 5395

/**
 * @type {Integer (UInt32)}
 */
export global EM_FILELINEINDEX := 5396

/**
 * @type {Integer (UInt32)}
 */
export global EM_FILELINELENGTH := 5397

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETFILELINE := 5398

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETFILELINECOUNT := 5399

/**
 * @type {Integer (UInt32)}
 */
export global EN_SEARCHWEB := 4294965776

/**
 * @type {String}
 */
export global WC_LISTBOXA := "ListBox"

/**
 * @type {String}
 */
export global WC_LISTBOXW := "ListBox"

/**
 * @type {String}
 */
export global WC_LISTBOX := "ListBox"

/**
 * @type {String}
 */
export global WC_COMBOBOXA := "ComboBox"

/**
 * @type {String}
 */
export global WC_COMBOBOXW := "ComboBox"

/**
 * @type {String}
 */
export global WC_COMBOBOX := "ComboBox"

/**
 * @type {Integer (UInt32)}
 */
export global CB_SETMINVISIBLE := 5889

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETMINVISIBLE := 5890

/**
 * @type {Integer (UInt32)}
 */
export global CB_SETCUEBANNER := 5891

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETCUEBANNER := 5892

/**
 * @type {String}
 */
export global WC_SCROLLBARA := "ScrollBar"

/**
 * @type {String}
 */
export global WC_SCROLLBARW := "ScrollBar"

/**
 * @type {String}
 */
export global WC_SCROLLBAR := "ScrollBar"

/**
 * @type {Integer (UInt16)}
 */
export global TD_WARNING_ICON := 65535

/**
 * @type {Integer (UInt16)}
 */
export global TD_ERROR_ICON := 65534

/**
 * @type {Integer (UInt16)}
 */
export global TD_INFORMATION_ICON := 65533

/**
 * @type {Integer (UInt16)}
 */
export global TD_SHIELD_ICON := 65532

/**
 * @type {Integer (UInt32)}
 */
export global WM_MOUSEHOVER := 673

/**
 * @type {Integer (UInt32)}
 */
export global WM_MOUSELEAVE := 675

/**
 * @type {Integer (UInt32)}
 */
export global HOVER_DEFAULT := 4294967295

/**
 * @type {Integer (Int32)}
 */
export global WSB_PROP_MASK := 4095

/**
 * @type {Integer (UInt32)}
 */
export global FSB_FLAT_MODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FSB_ENCARTA_MODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSB_REGULAR_MODE := 0

/**
 * @type {Integer (UInt32)}
 */
export global ILDRF_IMAGELOWQUALITY := 1

/**
 * @type {Integer (UInt32)}
 */
export global ILDRF_OVERLAYLOWQUALITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global ILR_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global ILR_HORIZONTAL_LEFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global ILR_HORIZONTAL_CENTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global ILR_HORIZONTAL_RIGHT := 2

/**
 * @type {Integer (UInt32)}
 */
export global ILR_VERTICAL_TOP := 0

/**
 * @type {Integer (UInt32)}
 */
export global ILR_VERTICAL_CENTER := 16

/**
 * @type {Integer (UInt32)}
 */
export global ILR_VERTICAL_BOTTOM := 32

/**
 * @type {Integer (UInt32)}
 */
export global ILR_SCALE_CLIP := 0

/**
 * @type {Integer (UInt32)}
 */
export global ILR_SCALE_ASPECTRATIO := 256

/**
 * @type {Integer (UInt32)}
 */
export global ILGOS_ALWAYS := 0

/**
 * @type {Integer (UInt32)}
 */
export global ILGOS_FROMSTANDBY := 1

/**
 * @type {Integer (UInt32)}
 */
export global ILFIP_ALWAYS := 0

/**
 * @type {Integer (UInt32)}
 */
export global ILFIP_FROMSTANDBY := 1

/**
 * @type {Integer (UInt32)}
 */
export global ILDI_PURGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ILDI_STANDBY := 2

/**
 * @type {Integer (UInt32)}
 */
export global ILDI_RESETACCESS := 4

/**
 * @type {Integer (UInt32)}
 */
export global ILDI_QUERYACCESS := 8

/**
 * @type {Integer (UInt32)}
 */
export global CCHCCCLASS := 32

/**
 * @type {Integer (UInt32)}
 */
export global CCHCCDESC := 32

/**
 * @type {Integer (UInt32)}
 */
export global CCHCCTEXT := 256

/**
 * @type {Integer (UInt32)}
 */
export global CCF_NOTEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global ctlFirst := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ctlLast := 1279

/**
 * @type {Integer (UInt32)}
 */
export global psh1 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global psh2 := 1025

/**
 * @type {Integer (UInt32)}
 */
export global psh3 := 1026

/**
 * @type {Integer (UInt32)}
 */
export global psh4 := 1027

/**
 * @type {Integer (UInt32)}
 */
export global psh5 := 1028

/**
 * @type {Integer (UInt32)}
 */
export global psh6 := 1029

/**
 * @type {Integer (UInt32)}
 */
export global psh7 := 1030

/**
 * @type {Integer (UInt32)}
 */
export global psh8 := 1031

/**
 * @type {Integer (UInt32)}
 */
export global psh9 := 1032

/**
 * @type {Integer (UInt32)}
 */
export global psh10 := 1033

/**
 * @type {Integer (UInt32)}
 */
export global psh11 := 1034

/**
 * @type {Integer (UInt32)}
 */
export global psh12 := 1035

/**
 * @type {Integer (UInt32)}
 */
export global psh13 := 1036

/**
 * @type {Integer (UInt32)}
 */
export global psh14 := 1037

/**
 * @type {Integer (UInt32)}
 */
export global psh15 := 1038

/**
 * @type {Integer (UInt32)}
 */
export global pshHelp := 1038

/**
 * @type {Integer (UInt32)}
 */
export global psh16 := 1039

/**
 * @type {Integer (UInt32)}
 */
export global chx1 := 1040

/**
 * @type {Integer (UInt32)}
 */
export global chx2 := 1041

/**
 * @type {Integer (UInt32)}
 */
export global chx3 := 1042

/**
 * @type {Integer (UInt32)}
 */
export global chx4 := 1043

/**
 * @type {Integer (UInt32)}
 */
export global chx5 := 1044

/**
 * @type {Integer (UInt32)}
 */
export global chx6 := 1045

/**
 * @type {Integer (UInt32)}
 */
export global chx7 := 1046

/**
 * @type {Integer (UInt32)}
 */
export global chx8 := 1047

/**
 * @type {Integer (UInt32)}
 */
export global chx9 := 1048

/**
 * @type {Integer (UInt32)}
 */
export global chx10 := 1049

/**
 * @type {Integer (UInt32)}
 */
export global chx11 := 1050

/**
 * @type {Integer (UInt32)}
 */
export global chx12 := 1051

/**
 * @type {Integer (UInt32)}
 */
export global chx13 := 1052

/**
 * @type {Integer (UInt32)}
 */
export global chx14 := 1053

/**
 * @type {Integer (UInt32)}
 */
export global chx15 := 1054

/**
 * @type {Integer (UInt32)}
 */
export global chx16 := 1055

/**
 * @type {Integer (UInt32)}
 */
export global rad1 := 1056

/**
 * @type {Integer (UInt32)}
 */
export global rad2 := 1057

/**
 * @type {Integer (UInt32)}
 */
export global rad3 := 1058

/**
 * @type {Integer (UInt32)}
 */
export global rad4 := 1059

/**
 * @type {Integer (UInt32)}
 */
export global rad5 := 1060

/**
 * @type {Integer (UInt32)}
 */
export global rad6 := 1061

/**
 * @type {Integer (UInt32)}
 */
export global rad7 := 1062

/**
 * @type {Integer (UInt32)}
 */
export global rad8 := 1063

/**
 * @type {Integer (UInt32)}
 */
export global rad9 := 1064

/**
 * @type {Integer (UInt32)}
 */
export global rad10 := 1065

/**
 * @type {Integer (UInt32)}
 */
export global rad11 := 1066

/**
 * @type {Integer (UInt32)}
 */
export global rad12 := 1067

/**
 * @type {Integer (UInt32)}
 */
export global rad13 := 1068

/**
 * @type {Integer (UInt32)}
 */
export global rad14 := 1069

/**
 * @type {Integer (UInt32)}
 */
export global rad15 := 1070

/**
 * @type {Integer (UInt32)}
 */
export global rad16 := 1071

/**
 * @type {Integer (UInt32)}
 */
export global grp1 := 1072

/**
 * @type {Integer (UInt32)}
 */
export global grp2 := 1073

/**
 * @type {Integer (UInt32)}
 */
export global grp3 := 1074

/**
 * @type {Integer (UInt32)}
 */
export global grp4 := 1075

/**
 * @type {Integer (UInt32)}
 */
export global frm1 := 1076

/**
 * @type {Integer (UInt32)}
 */
export global frm2 := 1077

/**
 * @type {Integer (UInt32)}
 */
export global frm3 := 1078

/**
 * @type {Integer (UInt32)}
 */
export global frm4 := 1079

/**
 * @type {Integer (UInt32)}
 */
export global rct1 := 1080

/**
 * @type {Integer (UInt32)}
 */
export global rct2 := 1081

/**
 * @type {Integer (UInt32)}
 */
export global rct3 := 1082

/**
 * @type {Integer (UInt32)}
 */
export global rct4 := 1083

/**
 * @type {Integer (UInt32)}
 */
export global ico1 := 1084

/**
 * @type {Integer (UInt32)}
 */
export global ico2 := 1085

/**
 * @type {Integer (UInt32)}
 */
export global ico3 := 1086

/**
 * @type {Integer (UInt32)}
 */
export global ico4 := 1087

/**
 * @type {Integer (UInt32)}
 */
export global stc1 := 1088

/**
 * @type {Integer (UInt32)}
 */
export global stc2 := 1089

/**
 * @type {Integer (UInt32)}
 */
export global stc3 := 1090

/**
 * @type {Integer (UInt32)}
 */
export global stc4 := 1091

/**
 * @type {Integer (UInt32)}
 */
export global stc5 := 1092

/**
 * @type {Integer (UInt32)}
 */
export global stc6 := 1093

/**
 * @type {Integer (UInt32)}
 */
export global stc7 := 1094

/**
 * @type {Integer (UInt32)}
 */
export global stc8 := 1095

/**
 * @type {Integer (UInt32)}
 */
export global stc9 := 1096

/**
 * @type {Integer (UInt32)}
 */
export global stc10 := 1097

/**
 * @type {Integer (UInt32)}
 */
export global stc11 := 1098

/**
 * @type {Integer (UInt32)}
 */
export global stc12 := 1099

/**
 * @type {Integer (UInt32)}
 */
export global stc13 := 1100

/**
 * @type {Integer (UInt32)}
 */
export global stc14 := 1101

/**
 * @type {Integer (UInt32)}
 */
export global stc15 := 1102

/**
 * @type {Integer (UInt32)}
 */
export global stc16 := 1103

/**
 * @type {Integer (UInt32)}
 */
export global stc17 := 1104

/**
 * @type {Integer (UInt32)}
 */
export global stc18 := 1105

/**
 * @type {Integer (UInt32)}
 */
export global stc19 := 1106

/**
 * @type {Integer (UInt32)}
 */
export global stc20 := 1107

/**
 * @type {Integer (UInt32)}
 */
export global stc21 := 1108

/**
 * @type {Integer (UInt32)}
 */
export global stc22 := 1109

/**
 * @type {Integer (UInt32)}
 */
export global stc23 := 1110

/**
 * @type {Integer (UInt32)}
 */
export global stc24 := 1111

/**
 * @type {Integer (UInt32)}
 */
export global stc25 := 1112

/**
 * @type {Integer (UInt32)}
 */
export global stc26 := 1113

/**
 * @type {Integer (UInt32)}
 */
export global stc27 := 1114

/**
 * @type {Integer (UInt32)}
 */
export global stc28 := 1115

/**
 * @type {Integer (UInt32)}
 */
export global stc29 := 1116

/**
 * @type {Integer (UInt32)}
 */
export global stc30 := 1117

/**
 * @type {Integer (UInt32)}
 */
export global stc31 := 1118

/**
 * @type {Integer (UInt32)}
 */
export global stc32 := 1119

/**
 * @type {Integer (UInt32)}
 */
export global lst1 := 1120

/**
 * @type {Integer (UInt32)}
 */
export global lst2 := 1121

/**
 * @type {Integer (UInt32)}
 */
export global lst3 := 1122

/**
 * @type {Integer (UInt32)}
 */
export global lst4 := 1123

/**
 * @type {Integer (UInt32)}
 */
export global lst5 := 1124

/**
 * @type {Integer (UInt32)}
 */
export global lst6 := 1125

/**
 * @type {Integer (UInt32)}
 */
export global lst7 := 1126

/**
 * @type {Integer (UInt32)}
 */
export global lst8 := 1127

/**
 * @type {Integer (UInt32)}
 */
export global lst9 := 1128

/**
 * @type {Integer (UInt32)}
 */
export global lst10 := 1129

/**
 * @type {Integer (UInt32)}
 */
export global lst11 := 1130

/**
 * @type {Integer (UInt32)}
 */
export global lst12 := 1131

/**
 * @type {Integer (UInt32)}
 */
export global lst13 := 1132

/**
 * @type {Integer (UInt32)}
 */
export global lst14 := 1133

/**
 * @type {Integer (UInt32)}
 */
export global lst15 := 1134

/**
 * @type {Integer (UInt32)}
 */
export global lst16 := 1135

/**
 * @type {Integer (UInt32)}
 */
export global cmb1 := 1136

/**
 * @type {Integer (UInt32)}
 */
export global cmb2 := 1137

/**
 * @type {Integer (UInt32)}
 */
export global cmb3 := 1138

/**
 * @type {Integer (UInt32)}
 */
export global cmb4 := 1139

/**
 * @type {Integer (UInt32)}
 */
export global cmb5 := 1140

/**
 * @type {Integer (UInt32)}
 */
export global cmb6 := 1141

/**
 * @type {Integer (UInt32)}
 */
export global cmb7 := 1142

/**
 * @type {Integer (UInt32)}
 */
export global cmb8 := 1143

/**
 * @type {Integer (UInt32)}
 */
export global cmb9 := 1144

/**
 * @type {Integer (UInt32)}
 */
export global cmb10 := 1145

/**
 * @type {Integer (UInt32)}
 */
export global cmb11 := 1146

/**
 * @type {Integer (UInt32)}
 */
export global cmb12 := 1147

/**
 * @type {Integer (UInt32)}
 */
export global cmb13 := 1148

/**
 * @type {Integer (UInt32)}
 */
export global cmb14 := 1149

/**
 * @type {Integer (UInt32)}
 */
export global cmb15 := 1150

/**
 * @type {Integer (UInt32)}
 */
export global cmb16 := 1151

/**
 * @type {Integer (UInt32)}
 */
export global edt1 := 1152

/**
 * @type {Integer (UInt32)}
 */
export global edt2 := 1153

/**
 * @type {Integer (UInt32)}
 */
export global edt3 := 1154

/**
 * @type {Integer (UInt32)}
 */
export global edt4 := 1155

/**
 * @type {Integer (UInt32)}
 */
export global edt5 := 1156

/**
 * @type {Integer (UInt32)}
 */
export global edt6 := 1157

/**
 * @type {Integer (UInt32)}
 */
export global edt7 := 1158

/**
 * @type {Integer (UInt32)}
 */
export global edt8 := 1159

/**
 * @type {Integer (UInt32)}
 */
export global edt9 := 1160

/**
 * @type {Integer (UInt32)}
 */
export global edt10 := 1161

/**
 * @type {Integer (UInt32)}
 */
export global edt11 := 1162

/**
 * @type {Integer (UInt32)}
 */
export global edt12 := 1163

/**
 * @type {Integer (UInt32)}
 */
export global edt13 := 1164

/**
 * @type {Integer (UInt32)}
 */
export global edt14 := 1165

/**
 * @type {Integer (UInt32)}
 */
export global edt15 := 1166

/**
 * @type {Integer (UInt32)}
 */
export global edt16 := 1167

/**
 * @type {Integer (UInt32)}
 */
export global scr1 := 1168

/**
 * @type {Integer (UInt32)}
 */
export global scr2 := 1169

/**
 * @type {Integer (UInt32)}
 */
export global scr3 := 1170

/**
 * @type {Integer (UInt32)}
 */
export global scr4 := 1171

/**
 * @type {Integer (UInt32)}
 */
export global scr5 := 1172

/**
 * @type {Integer (UInt32)}
 */
export global scr6 := 1173

/**
 * @type {Integer (UInt32)}
 */
export global scr7 := 1174

/**
 * @type {Integer (UInt32)}
 */
export global scr8 := 1175

/**
 * @type {Integer (UInt32)}
 */
export global ctl1 := 1184

/**
 * @type {Integer (UInt32)}
 */
export global FILEOPENORD := 1536

/**
 * @type {Integer (UInt32)}
 */
export global MULTIFILEOPENORD := 1537

/**
 * @type {Integer (UInt32)}
 */
export global PRINTDLGORD := 1538

/**
 * @type {Integer (UInt32)}
 */
export global PRNSETUPDLGORD := 1539

/**
 * @type {Integer (UInt32)}
 */
export global FINDDLGORD := 1540

/**
 * @type {Integer (UInt32)}
 */
export global REPLACEDLGORD := 1541

/**
 * @type {Integer (UInt32)}
 */
export global FONTDLGORD := 1542

/**
 * @type {Integer (UInt32)}
 */
export global FORMATDLGORD31 := 1543

/**
 * @type {Integer (UInt32)}
 */
export global FORMATDLGORD30 := 1544

/**
 * @type {Integer (UInt32)}
 */
export global RUNDLGORD := 1545

/**
 * @type {Integer (UInt32)}
 */
export global PAGESETUPDLGORD := 1546

/**
 * @type {Integer (UInt32)}
 */
export global NEWFILEOPENORD := 1547

/**
 * @type {Integer (UInt32)}
 */
export global PRINTDLGEXORD := 1549

/**
 * @type {Integer (UInt32)}
 */
export global PAGESETUPDLGORDMOTIF := 1550

/**
 * @type {Integer (UInt32)}
 */
export global COLORMGMTDLGORD := 1551

/**
 * @type {Integer (UInt32)}
 */
export global NEWFILEOPENV2ORD := 1552

/**
 * @type {Integer (UInt32)}
 */
export global NEWFILEOPENV3ORD := 1553

/**
 * @type {Integer (UInt32)}
 */
export global NEWFORMATDLGWITHLINK := 1591

/**
 * @type {Integer (UInt32)}
 */
export global IDC_MANAGE_LINK := 1592

/**
 * @type {Integer (UInt32)}
 */
export global DA_LAST := 2147483647

/**
 * @type {Integer (Int32)}
 */
export global DA_ERR := -1

/**
 * @type {Integer (UInt32)}
 */
export global DSA_APPEND := 2147483647

/**
 * @type {Integer (Int32)}
 */
export global DSA_ERR := -1

/**
 * @type {Integer (UInt32)}
 */
export global DPAM_SORTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DPAM_NORMAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global DPAM_UNION := 4

/**
 * @type {Integer (UInt32)}
 */
export global DPAM_INTERSECT := 8

/**
 * @type {Integer (UInt32)}
 */
export global DPAS_SORTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DPAS_INSERTBEFORE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DPAS_INSERTAFTER := 4

/**
 * @type {Integer (UInt32)}
 */
export global DPA_APPEND := 2147483647

/**
 * @type {Integer (Int32)}
 */
export global DPA_ERR := -1

/**
 * @type {Integer (UInt32)}
 */
export global MAXPROPPAGES := 100

/**
 * @type {Integer (UInt32)}
 */
export global PSP_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PSP_DLGINDIRECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSP_USEHICON := 2

/**
 * @type {Integer (UInt32)}
 */
export global PSP_USEICONID := 4

/**
 * @type {Integer (UInt32)}
 */
export global PSP_USETITLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PSP_RTLREADING := 16

/**
 * @type {Integer (UInt32)}
 */
export global PSP_HASHELP := 32

/**
 * @type {Integer (UInt32)}
 */
export global PSP_USEREFPARENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global PSP_USECALLBACK := 128

/**
 * @type {Integer (UInt32)}
 */
export global PSP_PREMATURE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PSP_HIDEHEADER := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PSP_USEHEADERTITLE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PSP_USEHEADERSUBTITLE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PSP_USEFUSIONCONTEXT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PSH_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PSH_PROPTITLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSH_USEHICON := 2

/**
 * @type {Integer (UInt32)}
 */
export global PSH_USEICONID := 4

/**
 * @type {Integer (UInt32)}
 */
export global PSH_PROPSHEETPAGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PSH_WIZARDHASFINISH := 16

/**
 * @type {Integer (UInt32)}
 */
export global PSH_WIZARD := 32

/**
 * @type {Integer (UInt32)}
 */
export global PSH_USEPSTARTPAGE := 64

/**
 * @type {Integer (UInt32)}
 */
export global PSH_NOAPPLYNOW := 128

/**
 * @type {Integer (UInt32)}
 */
export global PSH_USECALLBACK := 256

/**
 * @type {Integer (UInt32)}
 */
export global PSH_HASHELP := 512

/**
 * @type {Integer (UInt32)}
 */
export global PSH_MODELESS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PSH_RTLREADING := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PSH_WIZARDCONTEXTHELP := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PSH_WIZARD97 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PSH_WATERMARK := 32768

/**
 * @type {Integer (UInt32)}
 */
export global PSH_USEHBMWATERMARK := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PSH_USEHPLWATERMARK := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PSH_STRETCHWATERMARK := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PSH_HEADER := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PSH_USEHBMHEADER := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PSH_USEPAGELANG := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global PSH_WIZARD_LITE := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global PSH_NOCONTEXTHELP := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global PSH_AEROWIZARD := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PSH_RESIZABLE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global PSH_HEADERBITMAP := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global PSH_NOMARGIN := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global PSCB_INITIALIZED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSCB_PRECREATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PSCB_BUTTONPRESSED := 3

/**
 * @type {Integer (UInt32)}
 */
export global PSN_FIRST := 4294967096

/**
 * @type {Integer (UInt32)}
 */
export global PSN_LAST := 4294966997

/**
 * @type {Integer (UInt32)}
 */
export global PSN_SETACTIVE := 4294967096

/**
 * @type {Integer (UInt32)}
 */
export global PSN_KILLACTIVE := 4294967095

/**
 * @type {Integer (UInt32)}
 */
export global PSN_APPLY := 4294967094

/**
 * @type {Integer (UInt32)}
 */
export global PSN_RESET := 4294967093

/**
 * @type {Integer (UInt32)}
 */
export global PSN_HELP := 4294967091

/**
 * @type {Integer (UInt32)}
 */
export global PSN_WIZBACK := 4294967090

/**
 * @type {Integer (UInt32)}
 */
export global PSN_WIZNEXT := 4294967089

/**
 * @type {Integer (UInt32)}
 */
export global PSN_WIZFINISH := 4294967088

/**
 * @type {Integer (UInt32)}
 */
export global PSN_QUERYCANCEL := 4294967087

/**
 * @type {Integer (UInt32)}
 */
export global PSN_GETOBJECT := 4294967086

/**
 * @type {Integer (UInt32)}
 */
export global PSN_TRANSLATEACCELERATOR := 4294967084

/**
 * @type {Integer (UInt32)}
 */
export global PSN_QUERYINITIALFOCUS := 4294967083

/**
 * @type {Integer (UInt32)}
 */
export global PSNRET_NOERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global PSNRET_INVALID := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSNRET_INVALID_NOCHANGEPAGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PSNRET_MESSAGEHANDLED := 3

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETCURSEL := 1125

/**
 * @type {Integer (UInt32)}
 */
export global PSM_REMOVEPAGE := 1126

/**
 * @type {Integer (UInt32)}
 */
export global PSM_ADDPAGE := 1127

/**
 * @type {Integer (UInt32)}
 */
export global PSM_CHANGED := 1128

/**
 * @type {Integer (UInt32)}
 */
export global PSM_RESTARTWINDOWS := 1129

/**
 * @type {Integer (UInt32)}
 */
export global PSM_REBOOTSYSTEM := 1130

/**
 * @type {Integer (UInt32)}
 */
export global PSM_CANCELTOCLOSE := 1131

/**
 * @type {Integer (UInt32)}
 */
export global PSM_QUERYSIBLINGS := 1132

/**
 * @type {Integer (UInt32)}
 */
export global PSM_UNCHANGED := 1133

/**
 * @type {Integer (UInt32)}
 */
export global PSM_APPLY := 1134

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETTITLEA := 1135

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETTITLEW := 1144

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETTITLE := 1144

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETWIZBUTTONS := 1136

/**
 * @type {Integer (UInt32)}
 */
export global PSWIZB_BACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSWIZB_NEXT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PSWIZB_FINISH := 4

/**
 * @type {Integer (UInt32)}
 */
export global PSWIZB_DISABLEDFINISH := 8

/**
 * @type {Integer (UInt32)}
 */
export global PSWIZBF_ELEVATIONREQUIRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSWIZB_CANCEL := 16

/**
 * @type {Integer (UInt32)}
 */
export global PSM_PRESSBUTTON := 1137

/**
 * @type {Integer (UInt32)}
 */
export global PSBTN_BACK := 0

/**
 * @type {Integer (UInt32)}
 */
export global PSBTN_NEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSBTN_FINISH := 2

/**
 * @type {Integer (UInt32)}
 */
export global PSBTN_OK := 3

/**
 * @type {Integer (UInt32)}
 */
export global PSBTN_APPLYNOW := 4

/**
 * @type {Integer (UInt32)}
 */
export global PSBTN_CANCEL := 5

/**
 * @type {Integer (UInt32)}
 */
export global PSBTN_HELP := 6

/**
 * @type {Integer (UInt32)}
 */
export global PSBTN_MAX := 6

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETCURSELID := 1138

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETFINISHTEXTA := 1139

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETFINISHTEXTW := 1145

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETFINISHTEXT := 1145

/**
 * @type {Integer (UInt32)}
 */
export global PSM_GETTABCONTROL := 1140

/**
 * @type {Integer (UInt32)}
 */
export global PSM_ISDIALOGMESSAGE := 1141

/**
 * @type {Integer (UInt32)}
 */
export global PSM_GETCURRENTPAGEHWND := 1142

/**
 * @type {Integer (UInt32)}
 */
export global PSM_INSERTPAGE := 1143

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETHEADERTITLEA := 1149

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETHEADERTITLEW := 1150

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETHEADERTITLE := 1150

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETHEADERSUBTITLEA := 1151

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETHEADERSUBTITLEW := 1152

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETHEADERSUBTITLE := 1152

/**
 * @type {Integer (UInt32)}
 */
export global PSM_HWNDTOINDEX := 1153

/**
 * @type {Integer (UInt32)}
 */
export global PSM_INDEXTOHWND := 1154

/**
 * @type {Integer (UInt32)}
 */
export global PSM_PAGETOINDEX := 1155

/**
 * @type {Integer (UInt32)}
 */
export global PSM_INDEXTOPAGE := 1156

/**
 * @type {Integer (UInt32)}
 */
export global PSM_IDTOINDEX := 1157

/**
 * @type {Integer (UInt32)}
 */
export global PSM_INDEXTOID := 1158

/**
 * @type {Integer (UInt32)}
 */
export global PSM_GETRESULT := 1159

/**
 * @type {Integer (UInt32)}
 */
export global PSM_RECALCPAGESIZES := 1160

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETNEXTTEXTW := 1161

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETNEXTTEXT := 1161

/**
 * @type {Integer (UInt32)}
 */
export global PSWIZB_SHOW := 0

/**
 * @type {Integer (UInt32)}
 */
export global PSWIZB_RESTORE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SHOWWIZBUTTONS := 1162

/**
 * @type {Integer (UInt32)}
 */
export global PSM_ENABLEWIZBUTTONS := 1163

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETBUTTONTEXTW := 1164

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SETBUTTONTEXT := 1164

/**
 * @type {Integer (UInt32)}
 */
export global ID_PSRESTARTWINDOWS := 2

/**
 * @type {Integer (UInt32)}
 */
export global WIZ_CXDLG := 276

/**
 * @type {Integer (UInt32)}
 */
export global WIZ_CYDLG := 140

/**
 * @type {Integer (UInt32)}
 */
export global WIZ_CXBMP := 80

/**
 * @type {Integer (UInt32)}
 */
export global WIZ_BODYX := 92

/**
 * @type {Integer (UInt32)}
 */
export global WIZ_BODYCX := 184

/**
 * @type {Integer (UInt32)}
 */
export global PROP_SM_CXDLG := 212

/**
 * @type {Integer (UInt32)}
 */
export global PROP_SM_CYDLG := 188

/**
 * @type {Integer (UInt32)}
 */
export global PROP_MED_CXDLG := 227

/**
 * @type {Integer (UInt32)}
 */
export global PROP_MED_CYDLG := 215

/**
 * @type {Integer (UInt32)}
 */
export global PROP_LG_CXDLG := 252

/**
 * @type {Integer (UInt32)}
 */
export global PROP_LG_CYDLG := 218

/**
 * @type {Integer (UInt32)}
 */
export global MAX_THEMECOLOR := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAX_THEMESIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global DTBG_CLIPRECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DTBG_DRAWSOLID := 2

/**
 * @type {Integer (UInt32)}
 */
export global DTBG_OMITBORDER := 4

/**
 * @type {Integer (UInt32)}
 */
export global DTBG_OMITCONTENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global DTBG_COMPUTINGREGION := 16

/**
 * @type {Integer (UInt32)}
 */
export global DTBG_MIRRORDC := 32

/**
 * @type {Integer (UInt32)}
 */
export global DTBG_NOMIRROR := 64

/**
 * @type {Integer (UInt32)}
 */
export global DTT_GRAYED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DTT_FLAGS2VALIDBITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_INTLIST_COUNT := 402

/**
 * @type {Integer (UInt32)}
 */
export global ETDT_DISABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ETDT_ENABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global ETDT_USETABTEXTURE := 4

/**
 * @type {Integer (UInt32)}
 */
export global ETDT_USEAEROWIZARDTABTEXTURE := 8

/**
 * @type {String}
 */
export global SZ_THDOCPROP_DISPLAYNAME := "DisplayName"

/**
 * @type {String}
 */
export global SZ_THDOCPROP_CANONICALNAME := "ThemeName"

/**
 * @type {String}
 */
export global SZ_THDOCPROP_TOOLTIP := "ToolTip"

/**
 * @type {String}
 */
export global SZ_THDOCPROP_AUTHOR := "author"

/**
 * @type {Integer (UInt32)}
 */
export global WTNCA_NODRAWCAPTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WTNCA_NODRAWICON := 2

/**
 * @type {Integer (UInt32)}
 */
export global WTNCA_NOSYSMENU := 4

/**
 * @type {Integer (UInt32)}
 */
export global WTNCA_NOMIRRORHELP := 8

/**
 * @type {Integer (UInt32)}
 */
export global TMTVS_RESERVEDLOW := 100000

/**
 * @type {Integer (UInt32)}
 */
export global TMTVS_RESERVEDHIGH := 19999

/**
 * @type {String}
 */
export global VSCLASS_AEROWIZARDSTYLE := "AEROWIZARDSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_AEROWIZARD := "AEROWIZARD"

/**
 * @type {String}
 */
export global VSCLASS_BUTTONSTYLE := "BUTTONSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_BUTTON := "BUTTON"

/**
 * @type {String}
 */
export global VSCLASS_COMBOBOXSTYLE := "COMBOBOXSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_COMBOBOX := "COMBOBOX"

/**
 * @type {String}
 */
export global VSCLASS_COMMUNICATIONSSTYLE := "COMMUNICATIONSSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_COMMUNICATIONS := "COMMUNICATIONS"

/**
 * @type {String}
 */
export global VSCLASS_CONTROLPANELSTYLE := "CONTROLPANELSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_CONTROLPANEL := "CONTROLPANEL"

/**
 * @type {String}
 */
export global VSCLASS_DATEPICKERSTYLE := "DATEPICKERSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_DATEPICKER := "DATEPICKER"

/**
 * @type {String}
 */
export global VSCLASS_DRAGDROPSTYLE := "DRAGDROPSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_DRAGDROP := "DRAGDROP"

/**
 * @type {String}
 */
export global VSCLASS_EDITSTYLE := "EDITSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_EDIT := "EDIT"

/**
 * @type {String}
 */
export global VSCLASS_EXPLORERBARSTYLE := "EXPLORERBARSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_EXPLORERBAR := "EXPLORERBAR"

/**
 * @type {String}
 */
export global VSCLASS_FLYOUTSTYLE := "FLYOUTSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_FLYOUT := "FLYOUT"

/**
 * @type {String}
 */
export global VSCLASS_HEADERSTYLE := "HEADERSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_HEADER := "HEADER"

/**
 * @type {String}
 */
export global VSCLASS_LISTBOXSTYLE := "LISTBOXSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_LISTBOX := "LISTBOX"

/**
 * @type {String}
 */
export global VSCLASS_LISTVIEWSTYLE := "LISTVIEWSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_LISTVIEW := "LISTVIEW"

/**
 * @type {String}
 */
export global VSCLASS_MENUSTYLE := "MENUSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_MENU := "MENU"

/**
 * @type {String}
 */
export global VSCLASS_NAVIGATION := "NAVIGATION"

/**
 * @type {String}
 */
export global VSCLASS_PROGRESSSTYLE := "PROGRESSSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_PROGRESS := "PROGRESS"

/**
 * @type {String}
 */
export global VSCLASS_REBARSTYLE := "REBARSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_REBAR := "REBAR"

/**
 * @type {String}
 */
export global VSCLASS_SCROLLBARSTYLE := "SCROLLBARSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_SCROLLBAR := "SCROLLBAR"

/**
 * @type {String}
 */
export global VSCLASS_SPINSTYLE := "SPINSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_SPIN := "SPIN"

/**
 * @type {String}
 */
export global VSCLASS_STATUSSTYLE := "STATUSSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_STATUS := "STATUS"

/**
 * @type {String}
 */
export global VSCLASS_TABSTYLE := "TABSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_TAB := "TAB"

/**
 * @type {String}
 */
export global VSCLASS_TASKDIALOGSTYLE := "TASKDIALOGSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_TASKDIALOG := "TASKDIALOG"

/**
 * @type {String}
 */
export global VSCLASS_TEXTSTYLE := "TEXTSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_TOOLBARSTYLE := "TOOLBARSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_TOOLBAR := "TOOLBAR"

/**
 * @type {String}
 */
export global VSCLASS_TOOLTIPSTYLE := "TOOLTIPSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_TOOLTIP := "TOOLTIP"

/**
 * @type {String}
 */
export global VSCLASS_TRACKBARSTYLE := "TRACKBARSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_TRACKBAR := "TRACKBAR"

/**
 * @type {String}
 */
export global VSCLASS_TREEVIEWSTYLE := "TREEVIEWSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_TREEVIEW := "TREEVIEW"

/**
 * @type {String}
 */
export global VSCLASS_USERTILE := "USERTILE"

/**
 * @type {String}
 */
export global VSCLASS_TEXTSELECTIONGRIPPER := "TEXTSELECTIONGRIPPER"

/**
 * @type {String}
 */
export global VSCLASS_WINDOWSTYLE := "WINDOWSTYLE"

/**
 * @type {String}
 */
export global VSCLASS_WINDOW := "WINDOW"

/**
 * @type {String}
 */
export global VSCLASS_LINK := "LINK"

/**
 * @type {String}
 */
export global VSCLASS_EMPTYMARKUP := "EMPTYMARKUP"

/**
 * @type {String}
 */
export global VSCLASS_STATIC := "STATIC"

/**
 * @type {String}
 */
export global VSCLASS_PAGE := "PAGE"

/**
 * @type {String}
 */
export global VSCLASS_MONTHCAL := "MONTHCAL"

/**
 * @type {String}
 */
export global VSCLASS_CLOCK := "CLOCK"

/**
 * @type {String}
 */
export global VSCLASS_TRAYNOTIFY := "TRAYNOTIFY"

/**
 * @type {String}
 */
export global VSCLASS_TASKBAR := "TASKBAR"

/**
 * @type {String}
 */
export global VSCLASS_TASKBAND := "TASKBAND"

/**
 * @type {String}
 */
export global VSCLASS_STARTPANEL := "STARTPANEL"

/**
 * @type {String}
 */
export global VSCLASS_MENUBAND := "MENUBAND"

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETSEL := 176

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETSEL := 177

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETRECT := 178

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETRECT := 179

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETRECTNP := 180

/**
 * @type {Integer (UInt32)}
 */
export global EM_SCROLL := 181

/**
 * @type {Integer (UInt32)}
 */
export global EM_LINESCROLL := 182

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETMODIFY := 184

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETMODIFY := 185

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETLINECOUNT := 186

/**
 * @type {Integer (UInt32)}
 */
export global EM_LINEINDEX := 187

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETHANDLE := 188

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETHANDLE := 189

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETTHUMB := 190

/**
 * @type {Integer (UInt32)}
 */
export global EM_LINELENGTH := 193

/**
 * @type {Integer (UInt32)}
 */
export global EM_REPLACESEL := 194

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETLINE := 196

/**
 * @type {Integer (UInt32)}
 */
export global EM_LIMITTEXT := 197

/**
 * @type {Integer (UInt32)}
 */
export global EM_CANUNDO := 198

/**
 * @type {Integer (UInt32)}
 */
export global EM_UNDO := 199

/**
 * @type {Integer (UInt32)}
 */
export global EM_FMTLINES := 200

/**
 * @type {Integer (UInt32)}
 */
export global EM_LINEFROMCHAR := 201

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETTABSTOPS := 203

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETPASSWORDCHAR := 204

/**
 * @type {Integer (UInt32)}
 */
export global EM_EMPTYUNDOBUFFER := 205

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETFIRSTVISIBLELINE := 206

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETREADONLY := 207

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETWORDBREAKPROC := 208

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETWORDBREAKPROC := 209

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETPASSWORDCHAR := 210

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETMARGINS := 211

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETMARGINS := 212

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETIMESTATUS := 216

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETIMESTATUS := 217

/**
 * @type {Integer (UInt32)}
 */
export global EM_ENABLEFEATURE := 218
;@endregion Constants
