#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct RemotableHandle {
    #StructPack 4


    struct _u {
        hInproc : Int32

        static __New() {
            DefineProp(this.Prototype, 'hRemote', { type: Int32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    fContext : Int32

    u : RemotableHandle._u

}
