#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_KEY_HANDLE.ahk
#Include .\WS_BYTES.ahk

/**
 * The type for specifying a symmetric cryptographic key as raw bytes.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_raw_symmetric_security_key_handle
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_RAW_SYMMETRIC_SECURITY_KEY_HANDLE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The base type from which this type and all other key handle types derive.
     * @type {WS_SECURITY_KEY_HANDLE}
     */
    keyHandle{
        get {
            if(!this.HasProp("__keyHandle"))
                this.__keyHandle := WS_SECURITY_KEY_HANDLE(this.ptr + 0)
            return this.__keyHandle
        }
    }

    /**
     * The cryptographic key as raw bytes.  It is strongly recommended that
     * after the key is supplied in this form to any API, it is immediately
     * cleared using SecureZeroMemory.
     * @type {WS_BYTES}
     */
    rawKeyBytes{
        get {
            if(!this.HasProp("__rawKeyBytes"))
                this.__rawKeyBytes := WS_BYTES(this.ptr + 8)
            return this.__rawKeyBytes
        }
    }
}
