#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWSDMessageParameters.ahk" { IWSDMessageParameters }

/**
 * Provides a context for handling the response to a two-way request.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_synchronous_response_context
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_SYNCHRONOUS_RESPONSE_CONTEXT {
    #StructPack 8

    /**
     * The result code of the last operation performed using this response context.
     */
    hr : HRESULT

    /**
     * The event handle to be signaled when the response is ready.
     */
    eventHandle : HANDLE

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdmessageparameters">IWSDMessageParameters</a> object that contains transport information associated with the response.
     */
    messageParameters : IWSDMessageParameters

    /**
     * The body of the response message.
     */
    results : IntPtr

}
