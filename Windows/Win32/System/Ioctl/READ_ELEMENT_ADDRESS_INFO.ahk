#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ELEMENT_TYPE.ahk" { ELEMENT_TYPE }
#Import ".\CHANGER_ELEMENT.ahk" { CHANGER_ELEMENT }
#Import ".\CHANGER_ELEMENT_STATUS_FLAGS.ahk" { CHANGER_ELEMENT_STATUS_FLAGS }
#Import ".\CHANGER_ELEMENT_STATUS.ahk" { CHANGER_ELEMENT_STATUS }

/**
 * Represents the volume tag information. It is used by the IOCTL_CHANGER_QUERY_VOLUME_TAGS control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-read_element_address_info
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct READ_ELEMENT_ADDRESS_INFO {
    #StructPack 4

    /**
     * The number of elements matching criteria set forth by the <b>ActionCode</b> member of 
     * <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_send_volume_tag_information">CHANGER_SEND_VOLUME_TAG_INFORMATION</a>. 
     * 
     * 
     * 
     * 
     * For information on compatibility with the current device, see the <b>Features0</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a>.
     */
    NumberOfElements : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element_status">CHANGER_ELEMENT_STATUS</a> structures, one for each element that corresponded with the information passed in with the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_send_volume_tag_information">CHANGER_SEND_VOLUME_TAG_INFORMATION</a> structure.
     */
    ElementStatus : CHANGER_ELEMENT_STATUS[1]

}
