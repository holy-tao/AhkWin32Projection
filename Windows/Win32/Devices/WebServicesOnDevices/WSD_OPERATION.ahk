#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_TYPE.ahk" { WSDXML_TYPE }

/**
 * Describes an operation as defined by WSDL in terms of one or two messages.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_operation
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_OPERATION {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_type">WSDXML_TYPE</a> structure that specifies the request type of an incoming message.
     */
    RequestType : WSDXML_TYPE.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_type">WSDXML_TYPE</a> structure that specifies the response type of an outgoing message.
     */
    ResponseType : WSDXML_TYPE.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/nc-wsdtypes-wsd_stub_function">WSD_STUB_FUNCTION</a> function that specifies the address of a stub function which translates a generic SOAP message structure into a method call with a signature specific to the incoming message of the operation.
     */
    RequestStubFunction : IntPtr

}
