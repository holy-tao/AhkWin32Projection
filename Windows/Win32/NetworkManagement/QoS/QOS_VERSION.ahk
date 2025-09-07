#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The QOS_VERSION structure indicates the version of the QOS protocol.
 * @see https://learn.microsoft.com/windows/win32/api/qos2/ns-qos2-qos_version
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_VERSION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Major version of the QOS protocol.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Minor version of the QOS protocol.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
