#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a pointer to an optional callback function that can be used by the MiniDumpWriteDump function.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_callback_information
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X64, Arm64
 */
export default struct MINIDUMP_CALLBACK_INFORMATION {
    #StructPack 8

    /**
     * A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/nc-minidumpapiset-minidump_callback_routine">MiniDumpCallback</a> callback function.
     */
    CallbackRoutine : IntPtr

    /**
     * The application-defined data for <b>CallbackRoutine</b>.
     */
    CallbackParam : IntPtr

}
