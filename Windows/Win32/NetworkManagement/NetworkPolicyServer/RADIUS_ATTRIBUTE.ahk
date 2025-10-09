#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RADIUS_ATTRIBUTE structure represents a RADIUS attribute or an extended attribute.
 * @see https://learn.microsoft.com/windows/win32/api/authif/ns-authif-radius_attribute
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUS_ATTRIBUTE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Stores a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ne-authif-radius_attribute_type">RADIUS_ATTRIBUTE_TYPE</a> enumeration. This value specifies the type of the attribute represented by the 
     * <b>RADIUS_ATTRIBUTE</b> structure.
     * @type {Integer}
     */
    dwAttrType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Stores a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ne-authif-radius_data_type">RADIUS_DATA_TYPE</a> enumeration. This value specifies the type of the value stored in the union that contains the <b>dwValue</b> and <b>lpValue</b> members.
     * @type {Integer}
     */
    fDataType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Stores the length, in bytes, of the data. The <b>cbDataLength</b> member is used only if <b>lpValue</b> member is used.
     * @type {Integer}
     */
    cbDataLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwValue {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Byte>}
     */
    lpValue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
