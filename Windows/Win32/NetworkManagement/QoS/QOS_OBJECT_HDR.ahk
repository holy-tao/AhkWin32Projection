#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The QOS object QOS_OBJECT_HDR is attached to each QOS object. It specifies the object type and its length.
 * @see https://learn.microsoft.com/windows/win32/api/qos/ns-qos-qos_object_hdr
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_OBJECT_HDR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

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
     * @type {Integer}
     */
    ObjectType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the length of the attached object, inclusive of QOS_OBJECT_HDR.
     * @type {Integer}
     */
    ObjectLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
