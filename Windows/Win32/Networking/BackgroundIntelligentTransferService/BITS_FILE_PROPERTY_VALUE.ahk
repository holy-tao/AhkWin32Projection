#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides the property value of a BITS file.
 * @see https://learn.microsoft.com/windows/win32/api/bits5_0/ns-bits5_0-bits_file_property_value
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BITS_FILE_PROPERTY_VALUE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * This value is used when using the property ID 
     *       enum value <b>BITS_FILE_PROPERTY_ID_HTTP_RESPONSE_HEADERS</b>.
     * @type {PWSTR}
     */
    String {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
