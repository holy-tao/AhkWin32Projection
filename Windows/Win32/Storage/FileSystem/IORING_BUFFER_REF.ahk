#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IORING_REGISTERED_BUFFER.ahk" { IORING_REGISTERED_BUFFER }
#Import ".\IORING_REF_KIND.ahk" { IORING_REF_KIND }

/**
 * IORING_BUFFER_REF represents a reference to a buffer used in an I/O ring operation.
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_buffer_ref
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IORING_BUFFER_REF {
    #StructPack 8


    struct BufferUnion {
        Address : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'IndexAndOffset', { type: IORING_REGISTERED_BUFFER, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * A value from the [IORING_REF_KIND](ne-ioringapi-ioring_ref_kind.md) enumeration specifying the kind of buffer represented by the structure.
     */
    Kind : IORING_REF_KIND

    Buffer : IORING_BUFFER_REF.BufferUnion

}
