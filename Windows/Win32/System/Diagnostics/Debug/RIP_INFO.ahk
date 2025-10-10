#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the error that caused the RIP debug event.
 * @see https://docs.microsoft.com/windows/win32/api//minwinbase/ns-minwinbase-rip_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class RIP_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The error that caused the RIP debug event. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/error-handling">Error Handling</a>.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
