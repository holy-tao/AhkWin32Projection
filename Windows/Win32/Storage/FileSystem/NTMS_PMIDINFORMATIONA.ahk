#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The NTMS_PMIDINFORMATION structure defines the properties specific to a physical media object. (ANSI)
 * @remarks
 * The 
 * <b>NTMS_PMIDINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntmsapi.h header defines NTMS_PMIDINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_pmidinformationa
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
export default struct NTMS_PMIDINFORMATIONA {
    #StructPack 4

    /**
     * Unique ID of the library in which the media is contained.
     */
    CurrentLibrary : Guid

    /**
     * Unique ID of the media pool to which the media is assigned.
     */
    MediaPool : Guid

    /**
     * Unique ID of the physical location object for the media.
     */
    Location : Guid

    /**
     * Current location type of a piece of physical media. The value of this member can be set to NTMS_STORAGESLOT, NTMS_DRIVE, NTMS_IEPORT. (Offline media are in slots.)
     */
    LocationType : UInt32

    /**
     * Unique ID of a media type object.
     */
    MediaType : Guid

    /**
     * Unique ID of the library storage slot in which media is stored.
     */
    HomeSlot : Guid

    /**
     * String that matches the bar-code value on a bar-code label of a piece of physical media.
     */
    szBarCode : CHAR[64]

    BarCodeState : UInt32

    /**
     * Sequential number assigned to the specified medium as a human-readable value that must be transcribed by a user on the medium so that the medium can be located in an offline library.
     */
    szSequenceNumber : CHAR[32]

    MediaState : UInt32

    /**
     * Number of sides on the medium.
     */
    dwNumberOfPartitions : UInt32

    /**
     * SCSI media type code.
     */
    dwMediaTypeCode : UInt32

    /**
     * SCSI density code.
     */
    dwDensityCode : UInt32

    /**
     * Globally unique ID of the side of the media that is currently mounted.
     */
    MountedPartition : Guid

}
