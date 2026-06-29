#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct IMAGE_THUNK_DATA64 {
    #StructPack 8


    struct _u1 {
        ForwarderString : Int64

        static __New() {
            DefineProp(this.Prototype, 'Function', { type: Int64, offset: 0 })
            DefineProp(this.Prototype, 'Ordinal', { type: Int64, offset: 0 })
            DefineProp(this.Prototype, 'AddressOfData', { type: Int64, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    u1 : IMAGE_THUNK_DATA64._u1

}
