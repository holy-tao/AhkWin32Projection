#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies which protocols the WDS transport server supports.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/ne-wdstptmgmt-wdstransport_protocol_flags
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_PROTOCOL_FLAGS extends Win32Enum{

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
