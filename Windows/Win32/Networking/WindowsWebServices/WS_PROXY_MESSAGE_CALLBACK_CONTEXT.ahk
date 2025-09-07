#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the callback function and state for an application that wishes to associate or inspect headers in an input or an output message respectively.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_proxy_message_callback_context
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_PROXY_MESSAGE_CALLBACK_CONTEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * application specific callback for handling the message.
     * @type {Pointer<Ptr>}
     */
    callback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Application specific state that would be made available to the callback upon its invocation.
     * @type {Pointer<Void>}
     */
    state {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
