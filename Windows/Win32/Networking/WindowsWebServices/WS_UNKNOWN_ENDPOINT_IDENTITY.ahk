#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_ENDPOINT_IDENTITY.ahk

/**
 * Type for unknown endpoint identity. This type is only used to represent an endpoint identity type that was deserialized but was not understood.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_unknown_endpoint_identity
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_UNKNOWN_ENDPOINT_IDENTITY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The base type from which this type and all other endpoint identity types derive.
     * @type {WS_ENDPOINT_IDENTITY}
     */
    identity{
        get {
            if(!this.HasProp("__identity"))
                this.__identity := WS_ENDPOINT_IDENTITY(this.ptr + 0)
            return this.__identity
        }
    }

    /**
     * An XML buffer containing a single XML Element which corresponds to the
     *                     identity element that was not understood.  This field may not be <b>NULL</b>.
     * @type {Pointer<IntPtr>}
     */
    element {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
