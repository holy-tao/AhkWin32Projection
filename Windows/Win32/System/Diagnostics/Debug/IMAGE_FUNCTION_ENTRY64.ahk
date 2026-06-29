#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an entry in the function table.I
 * @remarks
 * The following definition exists for 64-bit support.
 * 
 * 
 * ```cpp
 * typedef struct _IMAGE_FUNCTION_ENTRY64 {
 *     ULONGLONG   StartingAddress;
 *     ULONGLONG   EndingAddress;
 *     union {
 *         ULONGLONG   EndOfPrologue;
 *         ULONGLONG   UnwindInfoAddress;
 *     };
 * } IMAGE_FUNCTION_ENTRY64, *PIMAGE_FUNCTION_ENTRY64;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-image_function_entry64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_FUNCTION_ENTRY64 {
    #StructPack 8

    /**
     * The image address of the start of the function.
     */
    StartingAddress : Int64

    /**
     * The image address of the end of the function.
     */
    EndingAddress : Int64

    EndOfPrologue : Int64

    static __New() {
        DefineProp(this.Prototype, 'UnwindInfoAddress', { type: Int64, offset: 16 })
        this.DeleteProp("__New")
    }
}
