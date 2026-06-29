#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The NTMS_CHANGERINFORMATION structure defines properties specific to a robotic changer object. (ANSI)
 * @remarks
 * The 
 * <b>NTMS_CHANGERINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntmsapi.h header defines NTMS_CHANGERINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_changerinformationa
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
export default struct NTMS_CHANGERINFORMATIONA {
    #StructPack 4

    /**
     * Number of the changer within the library.
     */
    Number : UInt32

    /**
     * Identifier of the changer type of this changer.
     */
    ChangerType : Guid

    /**
     * Serial number for the changer represented as a string. Devices that do not support serial numbers report <b>NULL</b> for this member.
     */
    szSerialNumber : CHAR[32]

    /**
     * Revision for the changer, represented as a string.
     */
    szRevision : CHAR[32]

    /**
     * Name of the device used to access the changer.
     */
    szDeviceName : CHAR[64]

    /**
     * SCSI host adapter to which the changer is connected.
     */
    ScsiPort : UInt16

    /**
     * SCSI bus to which the changer is connected.
     */
    ScsiBus : UInt16

    /**
     * SCSI target ID for the changer.
     */
    ScsiTarget : UInt16

    /**
     * SCSI logical unit ID for the changer.
     */
    ScsiLun : UInt16

    /**
     * Unique identifier of the library that contains the changer.
     */
    Library : Guid

}
