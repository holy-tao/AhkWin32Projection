#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IORING_REF_KIND.ahk" { IORING_REF_KIND }

/**
 * Represents a reference to a file handle used in an I/O ring operation.
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_handle_ref
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IORING_HANDLE_REF {
    #StructPack 8


    struct HandleUnion {
        Handle : HANDLE

        static __New() {
            DefineProp(this.Prototype, 'Index', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * A value from the [IORING_REF_KIND](ne-ioringapi-ioring_ref_kind.md) enumeration specifying the kind of handle represented by the structure.
     */
    Kind : IORING_REF_KIND

    /**
     * The handle to a file if the *Kind* value is IORING_REF_RAW.
     */
    Handle : IORING_HANDLE_REF.HandleUnion

}
