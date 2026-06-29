#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRT_SECURITY_MODE.ahk" { DRT_SECURITY_MODE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DRT_SECURITY_PROVIDER.ahk" { DRT_SECURITY_PROVIDER }
#Import ".\DRT_BOOTSTRAP_PROVIDER.ahk" { DRT_BOOTSTRAP_PROVIDER }

/**
 * DRT_SETTINGS structure contains the settings utilized by the local Distributed Routing Table.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_settings
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_SETTINGS {
    #StructPack 8

    /**
     * The size of the  structure specified by  the  <i>sizeof</i> parameter found in <b>DRT_SETTINGS</b> with the purpose of  allowing new fields in the structure in future versions of the DRT API.
     */
    dwSize : UInt32

    /**
     * Specifies the exact number of bytes for keys in this DRT instance.  Currently only 8 bytes are supported. Any other values will return <b>E_INVALIDARG</b> via the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtopen">DrtOpen</a> function.
     */
    cbKey : UInt32

    /**
     * Pointer to the byte array that represents the protocol major version specified by the application. This is packed in every DRT packet to identify the version of the Security or Bootstrap Providers in use when a single DRT instance is supporting multiple Security or Bootstrap Providers.
     */
    bProtocolMajorVersion : Int8

    /**
     * Pointer to the byte array that represents the protocol minor version specified by the application. 
     *  This is packed in every DRT packet to identify the version of the Security or Bootstrap Providers in use when a single DRT instance is supporting multiple Security or Bootstrap Providers.
     */
    bProtocolMinorVersion : Int8

    /**
     * Specifies the maximum number of address the DRT registers when an application registers a key. The maximum value for this field is 4.
     */
    ulMaxRoutingAddresses : UInt32

    /**
     * This string forms the basis of the name of the DRT instance. The name of the instance can be used to locate the Windows performance counters associated with it.
     */
    pwzDrtInstancePrefix : PWSTR

    /**
     * Handle to a transport created by the transport creation API.  This is used to open a DRT with a transport specified by the <b>DRT_SETTINGS</b> structure.  Currently only IPv6 UDP is supported via <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtcreateipv6udptransport">DrtCreateIpv6UdpTransport</a>.
     */
    hTransport : IntPtr

    /**
     * Pointer to the security provider specified for use. An instance of the Derived Key Security Provider can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtcreatederivedkeysecurityprovider">DrtCreateDerivedKeySecurityProvider</a>.
     */
    pSecurityProvider : DRT_SECURITY_PROVIDER.Ptr

    /**
     * Pointer to the Bootstrap Provider specified for use. An instance of the PNRP Bootstrap Provider can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtcreatepnrpbootstrapresolver">DrtCreatePnrpBootstrapResolver</a>.
     */
    pBootstrapProvider : DRT_BOOTSTRAP_PROVIDER.Ptr

    /**
     * Specifies the security mode that the DRT should operate under. All nodes participating in a DRT mesh must use the same security mode.
     */
    eSecurityMode : DRT_SECURITY_MODE

}
