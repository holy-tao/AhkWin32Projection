#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Describes the tape drive. It is used by the SetTapeParametersfunction.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_set_drive_parameters
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TAPE_SET_DRIVE_PARAMETERS {
    #StructPack 4

    /**
     * If this member is <b>TRUE</b>, hardware error correction is supported. Otherwise, it is not.
     */
    ECC : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, hardware data compression is enabled. Otherwise, it is disabled.
     */
    Compression : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, data padding is enabled. Otherwise, it is disabled. Data padding keeps the tape streaming at a constant speed.
     */
    DataPadding : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, setmark reporting is enabled. Otherwise, it is disabled.
     */
    ReportSetmarks : BOOLEAN

    /**
     * Number of bytes between the end-of-tape warning and the physical end of the tape.
     */
    EOTWarningZoneSize : UInt32

}
