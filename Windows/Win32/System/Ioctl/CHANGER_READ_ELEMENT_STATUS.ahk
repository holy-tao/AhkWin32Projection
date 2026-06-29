#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ELEMENT_TYPE.ahk" { ELEMENT_TYPE }
#Import ".\CHANGER_ELEMENT.ahk" { CHANGER_ELEMENT }
#Import ".\CHANGER_ELEMENT_LIST.ahk" { CHANGER_ELEMENT_LIST }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains information that the IOCTL_CHANGER_GET_ELEMENT_STATUS control code needs to determine the elements whose status is to be retrieved.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_read_element_status
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CHANGER_READ_ELEMENT_STATUS {
    #StructPack 4

    /**
     * A
     */
    ElementList : CHANGER_ELEMENT_LIST

    /**
     * If this member is <b>TRUE</b>, volume tag information is to be retrieved. Otherwise, no volume information is retrieved. A volume tag can be a bar code or an application-defined value. This member is valid only if the <b>Features0</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a> structure is CHANGER_BAR_CODE_SCANNER_INSTALLED or CHANGER_VOLUME_IDENTIFICATION.
     */
    VolumeTagInfo : BOOLEAN

}
