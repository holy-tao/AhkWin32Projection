#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QOS_OBJECT_HDR.ahk

/**
 * The QOS object QOS_SHAPING_RATE specifies the uniform traffic shaping rate be applied to a given flow.
 * @see https://learn.microsoft.com/windows/win32/api/qos/ns-qos-qos_shaping_rate
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_SHAPING_RATE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The QOS object 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos/ns-qos-qos_object_hdr">QOS_OBJECT_HDR</a>. The object type for this QOS object should be 
     * <b>QOS_SHAPING_RATE</b>.
     * @type {QOS_OBJECT_HDR}
     */
    ObjectHdr{
        get {
            if(!this.HasProp("__ObjectHdr"))
                this.__ObjectHdr := QOS_OBJECT_HDR(0, this)
            return this.__ObjectHdr
        }
    }

    /**
     * Unsigned 32-bit integer that specifies the uniform traffic shaping rate in bytes per second.
     * @type {Integer}
     */
    ShapingRate {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
