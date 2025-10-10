#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a changer element.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-changer_element
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CHANGER_ELEMENT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The element type. This parameter can be one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-element_type">ELEMENT_TYPE</a> enumeration type.
     * @type {Integer}
     */
    ElementType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The zero-based address of the element.
     * @type {Integer}
     */
    ElementAddress {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
