#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_CONTRACT_DESCRIPTION.ahk" { WS_CONTRACT_DESCRIPTION }

/**
 * Specifies a service contract on an endpoint.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_contract
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_CONTRACT {
    #StructPack 8

    /**
     * The typed contract metadata. See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_contract_description">WS_CONTRACT_DESCRIPTION</a>. Optional, if <b>defaultMessageHandlerCallback</b> is given.
     */
    contractDescription : WS_CONTRACT_DESCRIPTION.Ptr

    /**
     * Callback for processing unhandled messages. Optional if contractDescription is given.
     */
    defaultMessageHandlerCallback : IntPtr

    /**
     * The function table. Mandatory, if <b>contractDescription</b> is given.
     */
    methodTable : IntPtr

}
