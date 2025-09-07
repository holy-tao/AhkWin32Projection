#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WS_CERTIFICATE_VALIDATION_CALLBACK_CONTEXT structure contains the callback function and state for validating the certificate for an HTTP connection.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_certificate_validation_callback_context
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CERTIFICATE_VALIDATION_CALLBACK_CONTEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_certificate_validation_callback">WS_CERTIFICATE_VALIDATION_CALLBACK</a> callback that is an application specific callback for validating HTTP certificates.
     * @type {Pointer<Ptr>}
     */
    callback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Application specific state that is made available to the callback when invoked.
     * @type {Pointer<Void>}
     */
    state {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
