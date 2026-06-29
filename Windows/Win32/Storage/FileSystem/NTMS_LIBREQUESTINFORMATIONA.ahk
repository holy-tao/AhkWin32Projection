#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The NTMS_LIBREQUESTINFORMATION structure defines the properties specific to a work request, which are queued to RSM. (ANSI)
 * @remarks
 * The 
 * <b>NTMS_LIBREQUESTINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * 
 * GUID in the work times may become not valid over time. For example, an eject of a free medium deletes the PMID after the media is ejected. However the work item is not updated upon completion of the eject.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntmsapi.h header defines NTMS_LIBREQUESTINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_librequestinformationa
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
export default struct NTMS_LIBREQUESTINFORMATIONA {
    #StructPack 4

    OperationCode : UInt32

    /**
     * Work item options (command specific).
     */
    OperationOption : UInt32

    State : UInt32

    /**
     * Unique identifier of a side being serviced.
     */
    PartitionId : Guid

    /**
     * Unique identifier of a drive being serviced.
     */
    DriveId : Guid

    /**
     * Unique identifier of a piece of physical media being serviced.
     */
    PhysMediaId : Guid

    /**
     * Library for this request.
     */
    Library : Guid

    /**
     * Unique identifier of a slot of the piece of physical media being serviced.
     */
    SlotId : Guid

    /**
     * System time that this request was queued to RSM.
     */
    TimeQueued : SYSTEMTIME

    /**
     * System time that this request was completed by RSM.
     */
    TimeCompleted : SYSTEMTIME

    /**
     * Application that submitted the operator request.
     */
    szApplication : CHAR[64]

    /**
     * Interactive user logged on to the computer that submitted the operator request.
     */
    szUser : CHAR[64]

    /**
     * Computer that submitted the operator request.
     */
    szComputer : CHAR[64]

    /**
     * Error return for requests that return with state NTMS_LM_FAILED. This is a 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
     */
    dwErrorCode : UInt32

    /**
     * Associated work item ID for this request. This is currently used to contain the work item ID to be canceled on an NTMS_LM_REMOVE request.
     */
    WorkItemId : Guid

    /**
     * Priority of the work item.
     */
    dwPriority : UInt32

}
