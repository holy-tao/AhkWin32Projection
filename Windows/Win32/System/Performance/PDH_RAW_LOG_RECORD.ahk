#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDH_LOG_TYPE.ahk" { PDH_LOG_TYPE }

/**
 * The PDH_RAW_LOG_RECORD structure contains information about a binary trace log file record.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_raw_log_record
 * @namespace Windows.Win32.System.Performance
 */
export default struct PDH_RAW_LOG_RECORD {
    #StructPack 4

    /**
     * Size of this structure, in bytes. The size includes this structure and the <b>RawBytes</b> appended to the end of this structure.
     */
    dwStructureSize : UInt32

    dwRecordType : PDH_LOG_TYPE

    /**
     * Size of the <b>RawBytes</b> data.
     */
    dwItems : UInt32

    /**
     * Binary record.
     */
    RawBytes : Int8[1]

}
