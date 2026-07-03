#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Specifies the context for handling incoming messages.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_handler_context
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_HANDLER_CONTEXT {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/nc-wsdtypes-pwsd_soap_message_handler">PSWD_SOAP_MESSAGE_HANDLER</a> function that specifies the incoming message handler.
     */
    Handler : IntPtr

    /**
     * The value supplied by the <i>pVoidContext</i> parameter of the IWSDSession::AddPort, IWSDSession::RegisterForIncomingRequests, or IWSDSession::RegisterForIncomingResponse methods.
     */
    PVoid : IntPtr

    /**
     * The value supplied by the <i>unknownContext</i> parameter of the IWSDSession::AddPort, IWSDSession::RegisterForIncomingRequests, or IWSDSession::RegisterForIncomingResponse methods.
     */
    Unknown : IUnknown

}
