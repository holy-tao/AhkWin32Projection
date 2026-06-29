#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\DWORD_BLOB.ahk" { DWORD_BLOB }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct GDI_NONREMOTE {
    #StructPack 8


    struct _u {
        hInproc : Int32

        static __New() {
            DefineProp(this.Prototype, 'hRemote', { type: DWORD_BLOB.Ptr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    fContext : Int32

    u : GDI_NONREMOTE._u

}
