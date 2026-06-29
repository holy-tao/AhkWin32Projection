#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QOS_OBJECT_HDR.ahk" { QOS_OBJECT_HDR }

/**
 * The QOS object QOS_SHAPING_RATE specifies the uniform traffic shaping rate be applied to a given flow.
 * @see https://learn.microsoft.com/windows/win32/api/qos/ns-qos-qos_shaping_rate
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_SHAPING_RATE {
    #StructPack 4

    /**
     * The QOS object 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos/ns-qos-qos_object_hdr">QOS_OBJECT_HDR</a>. The object type for this QOS object should be 
     * <b>QOS_SHAPING_RATE</b>.
     */
    ObjectHdr : QOS_OBJECT_HDR

    /**
     * Unsigned 32-bit integer that specifies the uniform traffic shaping rate in bytes per second.
     */
    ShapingRate : UInt32

}
