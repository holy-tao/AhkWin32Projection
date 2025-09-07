#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RAS_AUTH_ATTRIBUTE structure is used to pass authentication attributes, of type RAS_AUTH_ATTRIBUTE_TYPE, during an EAP session.
 * @remarks
 * Often an array of these structures is used to store or obtain a set of attributes for a given user. Since the number of attributes for a session is unknown, the array must be dynamic. The array is terminated by a structure with an <b>raaType</b> member that has a value of <b>raatMinimum</b>.
 * @see https://learn.microsoft.com/windows/win32/api/raseapif/ns-raseapif-ras_auth_attribute
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class RAS_AUTH_ATTRIBUTE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the type of attribute, as defined in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/raseapif/ne-raseapif-ras_auth_attribute_type">RAS_AUTH_ATTRIBUTE_TYPE</a> enumerated type.
     * @type {Integer}
     */
    raaType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the length in bytes of the value of this attribute. If the <b>Value</b> member is a pointer, <b>dwLength</b> specifies the length of the buffer pointed to. If the <b>Value</b> member is the value itself, <b>dwLength</b> specifies how much of the length of the <b>Value</b> member is taken up by the value.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the value of the attribute. Although this member is of the <b>PVOID</b> type, this member sometimes contains the value of the attribute rather than pointing to the value. The only way to know whether to interpret the <b>Value</b> member as a pointer to the value or the value itself, is to check the <b>raaType</b> member. See the reference page for 
     * <a href="https://docs.microsoft.com/windows/win32/api/raseapif/ne-raseapif-ras_auth_attribute_type">RAS_AUTH_ATTRIBUTE_TYPE</a> for information about how the <b>Value</b> member should be interpreted for different types.
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
