#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_OPERATION_DESCRIPTION.ahk" { WS_OPERATION_DESCRIPTION }

/**
 * The metadata for a service contract for service model.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_contract_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CONTRACT_DESCRIPTION {
    #StructPack 8

    /**
     * The total number of service operations that are part of the contract.
     */
    operationCount : UInt32

    /**
     * An array of individual operation description, each representing 
     *                     a service operations.
     */
    operations : IntPtr

}
