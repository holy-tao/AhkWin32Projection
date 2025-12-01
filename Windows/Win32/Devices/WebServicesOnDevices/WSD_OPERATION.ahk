#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an operation as defined by WSDL in terms of one or two messages.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_operation
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_OPERATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_type">WSDXML_TYPE</a> structure that specifies the request type of an incoming message.
     * @type {Pointer<WSDXML_TYPE>}
     */
    RequestType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_type">WSDXML_TYPE</a> structure that specifies the response type of an outgoing message.
     * @type {Pointer<WSDXML_TYPE>}
     */
    ResponseType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/nc-wsdtypes-wsd_stub_function">WSD_STUB_FUNCTION</a> function that specifies the address of a stub function which translates a generic SOAP message structure into a method call with a signature specific to the incoming message of the operation.
     * @type {Pointer<WSD_STUB_FUNCTION>}
     */
    RequestStubFunction {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
