#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_DEVICE_TYPE.ahk" { FILE_DEVICE_TYPE }

/**
 * The NTMS_MEDIATYPEINFORMATION structure defines the properties specific to a type of media supported by RSM.
 * @remarks
 * The 
 * <b>NTMS_MEDIATYPEINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_mediatypeinformation
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_MEDIATYPEINFORMATION {
    #StructPack 4

    /**
     * Each disk or tape driver reports the media-type enumeration value of the medium that is currently mounted in the drive. This member can be one of the values in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_media_type">STORAGE_MEDIA_TYPE</a> enumeration type. This unique media type value is mapped to a human-readable string in the object <b>szName</b> member.
     */
    MediaType : UInt32

    /**
     * Number of sides on the media.
     */
    NumberOfSides : UInt32

    ReadWriteCharacteristics : UInt32

    DeviceType : FILE_DEVICE_TYPE

}
