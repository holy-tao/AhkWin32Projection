#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Security
 */
export default struct LLFILETIME {
    #StructPack 8

    ll : Int64

    static __New() {
        DefineProp(this.Prototype, 'ft', { type: FILETIME, offset: 0 })
        this.DeleteProp("__New")
    }
}
