#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MENUEX_TEMPLATE_ITEM.ahk" { MENUEX_TEMPLATE_ITEM }
#Import ".\MENUITEMTEMPLATEHEADER.ahk" { MENUITEMTEMPLATEHEADER }
#Import ".\MENUITEMTEMPLATE.ahk" { MENUITEMTEMPLATE }
#Import ".\MENUEX_TEMPLATE_HEADER.ahk" { MENUEX_TEMPLATE_HEADER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MENUTEMPLATEEX {
    #StructPack 4


    struct _Menu {
        mitHeader : MENUITEMTEMPLATEHEADER

        miTemplate : MENUITEMTEMPLATE[1]

    }

    struct _MenuEx {
        mexHeader : MENUEX_TEMPLATE_HEADER

        mexItem : MENUEX_TEMPLATE_ITEM[1]

    }

    Menu : MENUTEMPLATEEX._Menu

    static __New() {
        DefineProp(this.Prototype, 'MenuEx', { type: MENUTEMPLATEEX._MenuEx, offset: 0 })
        this.DeleteProp("__New")
    }
}
