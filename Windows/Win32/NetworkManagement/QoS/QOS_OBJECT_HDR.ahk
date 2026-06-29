#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The QOS object QOS_OBJECT_HDR is attached to each QOS object. It specifies the object type and its length.
 * @see https://learn.microsoft.com/windows/win32/api/qos/ns-qos-qos_object_hdr
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_OBJECT_HDR {
    #StructPack 4

    /**
     * Specifies the type of object to which 
     * <b>QOS_OBJECT_HDR</b> is attached. The following values are valid for 
     * <b>QOS_OBJECT_HDR</b>: 
     * 
     * 
     * 
     * 
     * <a id="QOS_OBJECT_DESTADDR"></a>
     * <a id="qos_object_destaddr"></a>
     */
    ObjectType : UInt32

    /**
     * Specifies the length of the attached object, inclusive of QOS_OBJECT_HDR.
     */
    ObjectLength : UInt32

}
