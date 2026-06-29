#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SERVICE_ADDRESS.ahk" { SERVICE_ADDRESS }

/**
 * The SERVICE_ADDRESSES structure contains an array of SERVICE_ADDRESS data structures.
 * @see https://learn.microsoft.com/windows/win32/api/nspapi/ns-nspapi-service_addresses
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SERVICE_ADDRESSES {
    #StructPack 8

    /**
     * Number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_address">SERVICE_ADDRESS</a> structures in the <b>Addresses</b> array.
     */
    dwAddressCount : UInt32

    Addresses : SERVICE_ADDRESS[1]

}
