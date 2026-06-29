#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct DELTA_INPUT {
    #StructPack 8

    lpcStart : IntPtr

    uSize : IntPtr

    Editable : BOOL

    static __New() {
        DefineProp(this.Prototype, 'lpStart', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
