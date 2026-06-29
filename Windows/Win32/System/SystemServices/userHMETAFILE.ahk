#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\BYTE_BLOB.ahk" { BYTE_BLOB }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct userHMETAFILE {
    #StructPack 8


    struct _u {
        hInproc : Int32

        static __New() {
            DefineProp(this.Prototype, 'hRemote', { type: BYTE_BLOB.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'hInproc64', { type: Int64, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    fContext : Int32

    u : userHMETAFILE._u

}
