#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct CProperty {
    #StructPack 8

    dwPropID : UInt32

    cbData : UInt32

    dwType : UInt32

    lpszwData : PWSTR

    fPersist : BOOL

    static __New() {
        DefineProp(this.Prototype, 'lpvData', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'dwValue', { type: UInt32, offset: 16 })
        this.DeleteProp("__New")
    }
}
