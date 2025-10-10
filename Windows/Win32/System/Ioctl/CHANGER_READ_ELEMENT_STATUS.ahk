#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CHANGER_ELEMENT.ahk
#Include .\CHANGER_ELEMENT_LIST.ahk

/**
 * Contains information that the IOCTL_CHANGER_GET_ELEMENT_STATUS control code needs to determine the elements whose status is to be retrieved.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-changer_read_element_status
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CHANGER_READ_ELEMENT_STATUS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A
     * @type {CHANGER_ELEMENT_LIST}
     */
    ElementList{
        get {
            if(!this.HasProp("__ElementList"))
                this.__ElementList := CHANGER_ELEMENT_LIST(this.ptr + 0)
            return this.__ElementList
        }
    }

    /**
     * If this member is <b>TRUE</b>, volume tag information is to be retrieved. Otherwise, no volume information is retrieved. A volume tag can be a bar code or an application-defined value. This member is valid only if the <b>Features0</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a> structure is CHANGER_BAR_CODE_SCANNER_INSTALLED or CHANGER_VOLUME_IDENTIFICATION.
     * @type {Integer}
     */
    VolumeTagInfo {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
