#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\WS_STRING.ahk

/**
 * Represents a unique ID URI.
 * @remarks
 * 
  * This structure represents a URI that is used as a unique ID.
  *                 It has native support for GUID-based URI's, but can also
  *                 accommodate other unique-id URI's as a string.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_unique_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_UNIQUE_ID extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A string representation of the URI.  If length is zero,
     *                     then the unique ID is a guid, and the value is stored
     *                     in the guid field.  Otherwise, the URI is a string
     *                     and the string value is stored in the uri field.
     * @type {WS_STRING}
     */
    uri{
        get {
            if(!this.HasProp("__uri"))
                this.__uri := WS_STRING(this.ptr + 0)
            return this.__uri
        }
    }

    /**
     * If the uri.length field is 0, then this field contains
     *                     the GUID representation of the unique ID.  Otherwise
     *                     the value of the field is not defined.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
