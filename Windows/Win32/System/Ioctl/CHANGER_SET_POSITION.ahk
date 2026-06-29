#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ELEMENT_TYPE.ahk" { ELEMENT_TYPE }
#Import ".\CHANGER_ELEMENT.ahk" { CHANGER_ELEMENT }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains information needed by the IOCTL_CHANGER_SET_POSITION control code to set the changer's robotic transport mechanism to the specified element address.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_set_position
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CHANGER_SET_POSITION {
    #StructPack 4

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that indicates the transport to be moved. The <b>ElementType</b> member must be ChangerTransport.
     */
    Transport : CHANGER_ELEMENT

    /**
     * A
     */
    Destination : CHANGER_ELEMENT

    /**
     * If this member is <b>TRUE</b>, the media currently carried by <b>Transport</b> should be flipped. Otherwise, it should not. This member is valid only if the <b>Features0</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a> structure is CHANGER_MEDIUM_FLIP.
     */
    Flip : BOOLEAN

}
