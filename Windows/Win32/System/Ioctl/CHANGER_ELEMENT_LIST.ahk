#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ELEMENT_TYPE.ahk" { ELEMENT_TYPE }
#Import ".\CHANGER_ELEMENT.ahk" { CHANGER_ELEMENT }

/**
 * Represents a range of elements of a single type, typically for an operation such as getting or initializing the status of multiple elements.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_element_list
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CHANGER_ELEMENT_LIST {
    #StructPack 4

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that represent the first element in the range.
     */
    Element : CHANGER_ELEMENT

    /**
     * The number of elements in the range.
     */
    NumberOfElements : UInt32

}
