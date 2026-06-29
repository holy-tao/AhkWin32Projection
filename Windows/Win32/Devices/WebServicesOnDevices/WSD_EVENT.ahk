#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_OPERATION.ahk" { WSD_OPERATION }
#Import ".\WSD_HANDLER_CONTEXT.ahk" { WSD_HANDLER_CONTEXT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWSDMessageParameters.ahk" { IWSDMessageParameters }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WSD_SOAP_MESSAGE.ahk" { WSD_SOAP_MESSAGE }

/**
 * Provides an internal representation of a SOAP message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_event
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_EVENT {
    #StructPack 8

    /**
     * The result code of the event.
     */
    Hr : HRESULT

    /**
     * The event type.
     */
    EventType : UInt32

    /**
     * Pointer to the protocol string when dispatch by tags is required.
     */
    DispatchTag : PWSTR

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_handler_context">WSD_HANDLER_CONTEXT</a> structure that specifies the handler context.
     */
    HandlerContext : WSD_HANDLER_CONTEXT

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_message">WSD_SOAP_MESSAGE</a> structure that describes the event.
     */
    Soap : WSD_SOAP_MESSAGE.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structure that specifies the operation performed.
     */
    Operation : WSD_OPERATION.Ptr

    /**
     * Message transmission parameters.
     */
    MessageParameters : IWSDMessageParameters

}
