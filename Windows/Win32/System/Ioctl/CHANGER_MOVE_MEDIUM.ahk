#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ELEMENT_TYPE.ahk" { ELEMENT_TYPE }
#Import ".\CHANGER_ELEMENT.ahk" { CHANGER_ELEMENT }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains information that the IOCTL_CHANGER_MOVE_MEDIUM control code uses to move a piece of media to a destination.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_move_medium
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CHANGER_MOVE_MEDIUM {
    #StructPack 4

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that indicates which transport element to use for the move operation.
     */
    Transport : CHANGER_ELEMENT

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that indicates the element that contains the media that is to be moved.
     */
    Source : CHANGER_ELEMENT

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that indicates the element that is the destination of the media originally at <b>Source</b>.
     */
    Destination : CHANGER_ELEMENT

    /**
     * If this member is <b>TRUE</b>, the media should be flipped. Otherwise, it should not. This member is valid only if the <b>Features0</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a> structure is CHANGER_MEDIUM_FLIP.
     */
    Flip : BOOLEAN

}
