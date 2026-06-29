#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEKMSKEY {
    #StructPack 4

    dwStatus : UInt32

    dwCompStatus : UInt32

    dwVKEY : UInt32

    dwControl : UInt32

    pwszDscr : WCHAR[31]

    static __New() {
        DefineProp(this.Prototype, 'dwNotUsed', { type: UInt32, offset: 12 })
        DefineProp(this.Prototype, 'pwszNoUse', { type: WCHAR[31], offset: 16 })
        this.DeleteProp("__New")
    }
}
