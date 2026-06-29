#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCSI_LUN_LIST.ahk" { SCSI_LUN_LIST }
#Import ".\ISCSI_UNIQUE_SESSION_ID.ahk" { ISCSI_UNIQUE_SESSION_ID }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * ISCSI_TARGET_MAPPING. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The iscsidsc.h header defines ISCSI_TARGET_MAPPING as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-iscsi_target_mappingw
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @charset Unicode
 */
export default struct ISCSI_TARGET_MAPPINGW {
    #StructPack 8

    /**
     * A string representing the name of the HBA initiator through which the target is accessed.
     */
    InitiatorName : WCHAR[256]

    /**
     * A string representing the target name.
     */
    TargetName : WCHAR[224]

    /**
     * A string representing the device name of the HBA initiator; for example '<b>\device\ScsiPort3</b>'.
     */
    OSDeviceName : WCHAR[260]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> structure containing information that uniquely identifies the session..
     */
    SessionId : ISCSI_UNIQUE_SESSION_ID

    /**
     * The bus number used by the initiator as the local SCSI address of the target.
     */
    OSBusNumber : UInt32

    /**
     * The target number used by the initiator as the local SCSI address of the target.
     */
    OSTargetNumber : UInt32

    /**
     * The number of logical units (LUN) on the target.
     */
    LUNCount : UInt32

    /**
     * A list of SCSI_LUN_LIST structures that contain information about the LUNs associated with the target.
     */
    LUNList : SCSI_LUN_LIST.Ptr

}
