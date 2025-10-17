#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CHANGER_ELEMENT.ahk

/**
 * Represents the status of the specified element.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-changer_element_status
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CHANGER_ELEMENT_STATUS extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that represents the element.
     * @type {CHANGER_ELEMENT}
     */
    Element{
        get {
            if(!this.HasProp("__Element"))
                this.__Element := CHANGER_ELEMENT(0, this)
            return this.__Element
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that represents the element from which the media currently in this element was most recently moved.
     * 
     * This member is valid only if the <b>Flags</b> member includes ELEMENT_STATUS_SVALID.
     * @type {CHANGER_ELEMENT}
     */
    SrcElementAddress{
        get {
            if(!this.HasProp("__SrcElementAddress"))
                this.__SrcElementAddress := CHANGER_ELEMENT(8, this)
            return this.__SrcElementAddress
        }
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    ExceptionCode {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * For a SCSI changer, specifies the SCSI target ID of the drive at this element address. This member is valid only if the <b>ElementType</b> member of the <b>Element</b> structure is ChangerDrive and the <b>Flags</b> member includes ELEMENT_STATUS_ID_VALID.
     * @type {Integer}
     */
    TargetId {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * The SCSI logical unit number of the drive at this element address. This member is valid only if the <b>ElementType</b> member of the <b>Element</b> structure is ChangerDrive and the <b>Flags</b> member includes ELEMENT_STATUS_LUN_VALID.
     * @type {Integer}
     */
    Lun {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * Reserved for future use. The value of this member must be zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * The primary volume identifier for the media. If the changer supports a barcode reader and the reader is installed (as indicated by CHANGER_BAR_CODE_SCANNER_INSTALLED in the <b>Features0</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a>), <b>PrimaryVolumeID</b> is the bar code of the media. If the changer does not support a barcode reader, <b>PrimaryVolumeID</b> is the value previously assigned to the media.
     * 
     * This member is valid only if the <b>Flags</b> member includes ELEMENT_STATUS_PVOLTAG.
     * 
     * If the volume identifier is missing or unreadable, this member is cleared.
     * @type {Array<Byte>}
     */
    PrimaryVolumeID{
        get {
            if(!this.HasProp("__PrimaryVolumeIDProxyArray"))
                this.__PrimaryVolumeIDProxyArray := Win32FixedArray(this.ptr + 28, 36, Primitive, "char")
            return this.__PrimaryVolumeIDProxyArray
        }
    }

    /**
     * An alternate volume identification for the media. This member is valid only for two-sided media, and pertains to the ID of the inverted side. It never represents a bar code. 
     * 
     * 
     * 
     * 
     * This member is valid only if the <b>Flags</b> member includes ELEMENT_STATUS_AVOLTAG.
     * @type {Array<Byte>}
     */
    AlternateVolumeID{
        get {
            if(!this.HasProp("__AlternateVolumeIDProxyArray"))
                this.__AlternateVolumeIDProxyArray := Win32FixedArray(this.ptr + 64, 36, Primitive, "char")
            return this.__AlternateVolumeIDProxyArray
        }
    }
}
