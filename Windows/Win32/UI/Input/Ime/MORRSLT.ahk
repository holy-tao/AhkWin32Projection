#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WDD.ahk" { WDD }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct MORRSLT {
    #StructPack 8

    dwSize : UInt32

    pwchOutput : PWSTR

    cchOutput : UInt16

    pwchRead : PWSTR

    cchRead : UInt16

    pchInputPos : IntPtr

    pchOutputIdxWDD : IntPtr

    pchReadIdxWDD : IntPtr

    paMonoRubyPos : IntPtr

    pWDD : WDD.Ptr

    cWDD : Int32

    pPrivate : IntPtr

    BLKBuff : WCHAR[1]

    static __New() {
        DefineProp(this.Prototype, 'pwchComp', { type: PWSTR, offset: 18 })
        DefineProp(this.Prototype, 'cchComp', { type: UInt16, offset: 26 })
        DefineProp(this.Prototype, 'pchCompIdxWDD', { type: IntPtr, offset: 48 })
        this.DeleteProp("__New")
    }
}
