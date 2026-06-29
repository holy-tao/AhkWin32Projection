#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct IMAGE_THUNK_DATA32 {
    #StructPack 4


    struct _u1 {
        ForwarderString : UInt32

        static __New() {
            DefineProp(this.Prototype, 'Function', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'Ordinal', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'AddressOfData', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    u1 : IMAGE_THUNK_DATA32._u1

}
