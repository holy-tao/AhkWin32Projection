#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CHANGER_ELEMENT.ahk
#Include .\CHANGER_ELEMENT_STATUS.ahk

/**
 * Represents the volume tag information. It is used by the IOCTL_CHANGER_QUERY_VOLUME_TAGS control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-read_element_address_info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class READ_ELEMENT_ADDRESS_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of elements matching criteria set forth by the <b>ActionCode</b> member of 
     * <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_send_volume_tag_information">CHANGER_SEND_VOLUME_TAG_INFORMATION</a>. 
     * 
     * 
     * 
     * 
     * For information on compatibility with the current device, see the <b>Features0</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a>.
     * @type {Integer}
     */
    NumberOfElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element_status">CHANGER_ELEMENT_STATUS</a> structures, one for each element that corresponded with the information passed in with the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_send_volume_tag_information">CHANGER_SEND_VOLUME_TAG_INFORMATION</a> structure.
     * @type {Array<CHANGER_ELEMENT_STATUS>}
     */
    ElementStatus{
        get {
            if(!this.HasProp("__ElementStatusProxyArray"))
                this.__ElementStatusProxyArray := Win32FixedArray(this.ptr + 8, 8, CHANGER_ELEMENT_STATUS, "")
            return this.__ElementStatusProxyArray
        }
    }
}
