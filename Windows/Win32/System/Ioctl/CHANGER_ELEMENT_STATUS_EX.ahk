#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ELEMENT_TYPE.ahk" { ELEMENT_TYPE }
#Import ".\CHANGER_ELEMENT.ahk" { CHANGER_ELEMENT }
#Import ".\CHANGER_ELEMENT_STATUS_FLAGS.ahk" { CHANGER_ELEMENT_STATUS_FLAGS }

/**
 * Represents the status of the specified element. (CHANGER_ELEMENT_STATUS_EX)
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_element_status_ex
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CHANGER_ELEMENT_STATUS_EX {
    #StructPack 4

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that represents the element to which this structure refers.
     */
    Element : CHANGER_ELEMENT

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that represents the element from which the media currently in this element was most recently moved. 
     * 
     * 
     * 
     * 
     * This member is valid only if the <b>Flags</b> member includes ELEMENT_STATUS_SVALID.
     */
    SrcElementAddress : CHANGER_ELEMENT

    Flags : CHANGER_ELEMENT_STATUS_FLAGS

    ExceptionCode : UInt32

    /**
     * For a SCSI changer, specifies the SCSI target ID of the drive at this element address. This member is valid only if the <b>ElementType</b> member of the <b>Element</b> structure is ChangerDrive and the <b>Flags</b> member includes ELEMENT_STATUS_ID_VALID.
     */
    TargetId : Int8

    /**
     * The SCSI logical unit number of the drive at this element address. This member is valid only if the <b>ElementType</b> member of the <b>Element</b> structure is ChangerDrive and the <b>Flags</b> member includes ELEMENT_STATUS_LUN_VALID.
     */
    Lun : Int8

    /**
     * Reserved for future use. The value of this member must be zero.
     */
    Reserved : UInt16

    /**
     * The primary volume identifier for the media. If the changer supports a barcode reader and the reader is installed (as indicated by CHANGER_BAR_CODE_SCANNER_INSTALLED in the <b>Features0</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a>), <b>PrimaryVolumeID</b> is the bar code of the media. If the changer does not support a barcode reader, <b>PrimaryVolumeID</b> is the value previously assigned to the media. 
     * 
     * 
     * 
     * 
     * This member is valid only if the <b>Flags</b> member includes ELEMENT_STATUS_PVOLTAG.
     * 
     * If the volume identifier is missing or unreadable, this member is cleared.
     */
    PrimaryVolumeID : Int8[36]

    /**
     * An alternate volume identification for the media. This member is valid for two-sided media only, and pertains to the ID of the inverted side. It never represents a bar code. 
     * 
     * 
     * 
     * 
     * This member is valid only if the <b>Flags</b> member includes ELEMENT_STATUS_AVOLTAG.
     */
    AlternateVolumeID : Int8[36]

    /**
     * The vendor identifier.
     */
    VendorIdentification : Int8[8]

    /**
     * The product identifier.
     */
    ProductIdentification : Int8[16]

    /**
     * The serial number for the drive.
     */
    SerialNumber : Int8[32]

}
