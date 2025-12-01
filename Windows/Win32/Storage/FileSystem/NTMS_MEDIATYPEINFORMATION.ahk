#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NTMS_MEDIATYPEINFORMATION structure defines the properties specific to a type of media supported by RSM.
 * @remarks
 * The 
 * <b>NTMS_MEDIATYPEINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_mediatypeinformation
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NTMS_MEDIATYPEINFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Each disk or tape driver reports the media-type enumeration value of the medium that is currently mounted in the drive. This member can be one of the values in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_media_type">STORAGE_MEDIA_TYPE</a> enumeration type. This unique media type value is mapped to a human-readable string in the object <b>szName</b> member.
     * @type {Integer}
     */
    MediaType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of sides on the media.
     * @type {Integer}
     */
    NumberOfSides {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    ReadWriteCharacteristics {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    DeviceType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
