#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WIN32_ERROR.ahk" { WIN32_ERROR }
#Import ".\NETINFOSTRUCT_CHARACTERISTICS.ahk" { NETINFOSTRUCT_CHARACTERISTICS }

/**
 * Contains information describing the network provider returned by the WNetGetNetworkInformation function.
 * @remarks
 * The <b>NETINFOSTRUCT</b> structure contains information describing the network, such as the version of the network provider software and the network's current status.
 * @see https://learn.microsoft.com/windows/win32/api/winnetwk/ns-winnetwk-netinfostruct
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct NETINFOSTRUCT {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the 
     * <b>NETINFOSTRUCT</b> structure. The caller must supply this value to indicate the size of the structure passed in. Upon return, it has the size of the structure filled in.
     */
    cbStructure : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The version number of the network provider software.
     */
    dwProviderVersion : UInt32

    /**
     * Type: <b>DWORD</b>
     */
    dwStatus : WIN32_ERROR

    /**
     * Type: <b>DWORD</b>
     * 
     * Characteristics of the network provider software. 
     * 
     * 
     * This value is zero.
     */
    dwCharacteristics : NETINFOSTRUCT_CHARACTERISTICS

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * An instance handle for the network provider or for the 16-bit Windows network driver.
     */
    dwHandle : IntPtr

    /**
     * Type: <b>WORD</b>
     * 
     * The network type unique to the running network. This value associates resources with a specific network when the resources are persistent or stored in links. You can find a complete list of network types in the header file Winnetwk.h.
     */
    wNetType : UInt16

    /**
     * Type: <b>DWORD</b>
     * 
     * A set of bit flags indicating the valid print numbers for redirecting local printer devices, with the low-order bit corresponding to LPT1. 
     * 
     * 
     * 
     * 
     * <b>Windows Me/98/95:  </b>This value is always set to –1.
     */
    dwPrinters : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * A set of bit flags indicating the valid local disk devices for redirecting disk drives, with the low-order bit corresponding to A:. 
     * 
     * 
     * 
     * 
     * <b>Windows Me/98/95:  </b>This value is always set to –1.
     */
    dwDrives : UInt32

}
