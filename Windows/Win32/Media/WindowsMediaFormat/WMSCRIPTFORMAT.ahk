#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMSCRIPTFORMAT structure describes the type of script data used in a script stream.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmscriptformat
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMSCRIPTFORMAT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * GUID identifying the type of script commands in a script stream. Always set to WMSCRIPTTYPE_TwoStrings.
     * @type {Pointer<Guid>}
     */
    scriptType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
