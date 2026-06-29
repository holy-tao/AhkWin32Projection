#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The QOS_VERSION structure indicates the version of the QOS protocol.
 * @see https://learn.microsoft.com/windows/win32/api/qos2/ns-qos2-qos_version
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_VERSION {
    #StructPack 2

    /**
     * Major version of the QOS protocol.
     */
    MajorVersion : UInt16

    /**
     * Minor version of the QOS protocol.
     */
    MinorVersion : UInt16

}
