#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An optional type description used with WS_UNIQUE_ID_TYPE to specify constraints on the set of values which can be deserialized.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_unique_id_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_UNIQUE_ID_DESCRIPTION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The minimum number of characters.  This only pertains 
     *                     to the case where the unique ID is represented as a string.
     * @type {Integer}
     */
    minCharCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum number of characters.  This only pertains
     *                     to the case where the unique ID is represented as a string.
     * @type {Integer}
     */
    maxCharCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
