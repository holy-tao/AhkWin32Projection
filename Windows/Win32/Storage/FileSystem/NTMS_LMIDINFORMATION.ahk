#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The NTMS_LMIDINFORMATION structure defines the properties specific to a logical media object.
 * @remarks
 * The 
 * <b>NTMS_LMIDINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_lmidinformation
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_LMIDINFORMATION {
    #StructPack 4

    /**
     * Unique identifier of the media pool that contains the logical media.
     */
    MediaPool : Guid

    /**
     * Number of sides in the media object.
     */
    dwNumberOfPartitions : UInt32

}
