#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * DRT_SETTINGS structure contains the settings utilized by the local Distributed Routing Table.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_settings
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_SETTINGS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The size of the  structure specified by  the  <i>sizeof</i> parameter found in <b>DRT_SETTINGS</b> with the purpose of  allowing new fields in the structure in future versions of the DRT API.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the exact number of bytes for keys in this DRT instance.  Currently only 8 bytes are supported. Any other values will return <b>E_INVALIDARG</b> via the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtopen">DrtOpen</a> function.
     * @type {Integer}
     */
    cbKey {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to the byte array that represents the protocol major version specified by the application. This is packed in every DRT packet to identify the version of the Security or Bootstrap Providers in use when a single DRT instance is supporting multiple Security or Bootstrap Providers.
     * @type {Integer}
     */
    bProtocolMajorVersion {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Pointer to the byte array that represents the protocol minor version specified by the application. 
     *  This is packed in every DRT packet to identify the version of the Security or Bootstrap Providers in use when a single DRT instance is supporting multiple Security or Bootstrap Providers.
     * @type {Integer}
     */
    bProtocolMinorVersion {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Specifies the maximum number of address the DRT registers when an application registers a key. The maximum value for this field is 4.
     * @type {Integer}
     */
    ulMaxRoutingAddresses {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * This string forms the basis of the name of the DRT instance. The name of the instance can be used to locate the Windows performance counters associated with it.
     * @type {PWSTR}
     */
    pwzDrtInstancePrefix {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Handle to a transport created by the transport creation API.  This is used to open a DRT with a transport specified by the <b>DRT_SETTINGS</b> structure.  Currently only IPv6 UDP is supported via <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtcreateipv6udptransport">DrtCreateIpv6UdpTransport</a>.
     * @type {Pointer<Void>}
     */
    hTransport {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the security provider specified for use. An instance of the Derived Key Security Provider can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtcreatederivedkeysecurityprovider">DrtCreateDerivedKeySecurityProvider</a>.
     * @type {Pointer<DRT_SECURITY_PROVIDER>}
     */
    pSecurityProvider {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the Bootstrap Provider specified for use. An instance of the PNRP Bootstrap Provider can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtcreatepnrpbootstrapresolver">DrtCreatePnrpBootstrapResolver</a>.
     * @type {Pointer<DRT_BOOTSTRAP_PROVIDER>}
     */
    pBootstrapProvider {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Specifies the security mode that the DRT should operate under. All nodes participating in a DRT mesh must use the same security mode.
     * @type {Integer}
     */
    eSecurityMode {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
