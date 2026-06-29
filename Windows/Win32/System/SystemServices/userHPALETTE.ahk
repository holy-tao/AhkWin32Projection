#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\LOGPALETTE.ahk" { LOGPALETTE }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct userHPALETTE {
    #StructPack 8


    struct _u {
        hInproc : Int32

        static __New() {
            DefineProp(this.Prototype, 'hRemote', { type: LOGPALETTE.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'hInproc64', { type: Int64, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    fContext : Int32

    u : userHPALETTE._u

}
