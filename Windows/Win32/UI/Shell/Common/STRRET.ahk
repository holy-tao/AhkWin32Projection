#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains strings returned from the IShellFolder interface methods.
 * @see https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-strret
 * @namespace Windows.Win32.UI.Shell.Common
 */
export default struct STRRET {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     */
    uType : UInt32

    pOleStr : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'uOffset', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'cStr', { type: Int8[260], offset: 8 })
        this.DeleteProp("__New")
    }
}
