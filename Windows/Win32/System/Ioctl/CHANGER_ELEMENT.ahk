#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ELEMENT_TYPE.ahk" { ELEMENT_TYPE }

/**
 * Represents a changer element.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_element
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CHANGER_ELEMENT {
    #StructPack 4

    /**
     * The element type. This parameter can be one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-element_type">ELEMENT_TYPE</a> enumeration type.
     */
    ElementType : ELEMENT_TYPE

    /**
     * The zero-based address of the element.
     */
    ElementAddress : UInt32

}
