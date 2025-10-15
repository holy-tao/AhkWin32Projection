#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Provides a context for handling the response to a two-way request.
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-wsd_synchronous_response_context
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_SYNCHRONOUS_RESPONSE_CONTEXT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The result code of the last operation performed using this response context.
     * @type {HRESULT}
     */
    hr {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The event handle to be signaled when the response is ready.
     * @type {HANDLE}
     */
    eventHandle{
        get {
            if(!this.HasProp("__eventHandle"))
                this.__eventHandle := HANDLE(this.ptr + 8)
            return this.__eventHandle
        }
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdmessageparameters">IWSDMessageParameters</a> object that contains transport information associated with the response.
     * @type {Pointer<IWSDMessageParameters>}
     */
    messageParameters {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The body of the response message.
     * @type {Pointer<Void>}
     */
    results {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
