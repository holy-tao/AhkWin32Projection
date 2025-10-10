#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains a pointer to an optional callback function that can be used by the MiniDumpWriteDump function.
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_callback_information
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_CALLBACK_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/nc-minidumpapiset-minidump_callback_routine">MiniDumpCallback</a> callback function.
     * @type {Pointer<MINIDUMP_CALLBACK_ROUTINE>}
     */
    CallbackRoutine {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The application-defined data for <b>CallbackRoutine</b>.
     * @type {Pointer<Void>}
     */
    CallbackParam {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
