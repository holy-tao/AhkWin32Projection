#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies which protocols the WDS transport server supports.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_protocol_flags
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDSTRANSPORT_PROTOCOL_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the server supports the Unicast transmission protocol.
     * @type {Integer (Int32)}
     */
    static WdsTptProtocolUnicast => 1

    /**
     * Indicates that the server supports the Multicast transmission protocol
     * @type {Integer (Int32)}
     */
    static WdsTptProtocolMulticast => 2
}
