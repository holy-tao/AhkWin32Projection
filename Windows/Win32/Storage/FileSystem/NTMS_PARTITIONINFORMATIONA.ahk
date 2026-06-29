#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The NTMS_PARTITIONINFORMATION structure defines the properties specific to the side object. (ANSI)
 * @remarks
 * The 
 * <b>NTMS_PARTITIONINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntmsapi.h header defines NTMS_PARTITIONINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_partitioninformationa
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
export default struct NTMS_PARTITIONINFORMATIONA {
    #StructPack 8

    /**
     * Unique physical media identifier for the medium that contains this side.
     */
    PhysicalMedia : Guid

    /**
     * Unique logical media identifier (LMID) for a piece of logical media that contains this side. This parameter is a <b>NULL</b> if the side is not allocated.
     */
    LogicalMedia : Guid

    State : UInt32

    /**
     * Zero-relative value which indicates which side of a multi-sided media this is. For single-sided media, such as tape, this value is always zero. For dual-sided media one NTMS_PARITIONINFORMATION record has this property set to zero - the "A" side - and a second NTMS_PARTITIONINFORMATION record has it set to 1 - the "B" side.
     */
    Side : UInt16

    /**
     * Length of the label ID string of the on-media identifier.
     */
    dwOmidLabelIdLength : UInt32

    /**
     * Label ID unique identifier of the on-media identifier.
     */
    OmidLabelId : Int8[255]

    /**
     * Label type of the on-media identifier.
     */
    szOmidLabelType : CHAR[64]

    /**
     * Label information of the on-media identifier.
     */
    szOmidLabelInfo : CHAR[256]

    /**
     * Number of times this media has been mounted into a drive. This is initialized to zero when the objects are created in the database.
     */
    dwMountCount : UInt32

    /**
     * Number of times this media has been allocated.
     */
    dwAllocateCount : UInt32

    /**
     * Number bytes of storage available on this side.
     */
    Capacity : Int64

}
