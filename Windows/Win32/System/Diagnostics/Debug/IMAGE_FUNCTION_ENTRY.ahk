#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an entry in the function table. (IMAGE_FUNCTION_ENTRY)
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
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-image_function_entry
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_FUNCTION_ENTRY {
    #StructPack 4

    /**
     * The image address of the start of the function.
     */
    StartingAddress : UInt32

    /**
     * The image address of the end of the function.
     */
    EndingAddress : UInt32

    /**
     * The image address of the end of the prologue code.
     */
    EndOfPrologue : UInt32

}
