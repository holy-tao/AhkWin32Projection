#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDH_DATA_ITEM_PATH_ELEMENTS_W.ahk" { PDH_DATA_ITEM_PATH_ELEMENTS_W }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PDH_COUNTER_PATH_ELEMENTS_W.ahk" { PDH_COUNTER_PATH_ELEMENTS_W }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The PDH_COUNTER_INFO structure contains information describing the properties of a counter. This information also includes the counter path. (Unicode)
 * @remarks
 * When you allocate memory for this structure, allocate enough memory for the member strings, such as <b>szCounterName</b>, that are appended to the end of this structure.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_counter_info_w
 * @namespace Windows.Win32.System.Performance
 * @charset Unicode
 */
export default struct PDH_COUNTER_INFO_W {
    #StructPack 8

    /**
     * Size of the structure, including the appended strings, in bytes.
     */
    dwLength : UInt32

    /**
     * Counter type. For a list of counter types, see the Counter Types section of the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc776490(v=ws.10)">Windows Server 2003 Deployment Kit</a>. The counter type constants are defined in Winperf.h.
     */
    dwType : UInt32

    /**
     * Counter version information.
     * 					Not used.
     */
    CVersion : UInt32

    /**
     * Counter status that indicates if the counter value is valid. For a list of possible values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/checking-pdh-interface-return-values">Checking PDH Interface Return Values</a>.
     */
    CStatus : UInt32

    /**
     * Scale factor to use when computing the displayable value of the counter.
     * 					The scale factor is a power of ten. The valid range of this parameter is PDH_MIN_SCALE (–7) (the returned value is the actual value times 10<sup>–</sup>⁷) to PDH_MAX_SCALE (+7) (the returned value is the actual value times 10⁺⁷). A value of zero will set the scale to one, so that the actual value is returned
     */
    lScale : Int32

    /**
     * Default scale factor as suggested by the counter's provider.
     */
    lDefaultScale : Int32

    /**
     * The value passed in the <i>dwUserData</i> parameter when calling <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a>.
     */
    dwUserData : IntPtr

    /**
     * The value passed in the <i>dwUserData</i> parameter when calling <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a>.
     */
    dwQueryUserData : IntPtr

    /**
     * <b>Null</b>-terminated string that specifies the full counter path. The string follows this structure in memory.
     */
    szFullPath : PWSTR

    DataItemPath : PDH_DATA_ITEM_PATH_ELEMENTS_W

    szCounterName : PWSTR

    /**
     * Help text that describes the counter. Is <b>NULL</b> if the source is a log file.
     */
    szExplainText : PWSTR

    /**
     * Start of the string data that is appended to the structure.
     */
    DataBuffer : UInt32[1]

    static __New() {
        DefineProp(this.Prototype, 'CounterPath', { type: PDH_COUNTER_PATH_ELEMENTS_W, offset: 48 })
        DefineProp(this.Prototype, 'szMachineName', { type: PWSTR, offset: 48 })
        DefineProp(this.Prototype, 'szObjectName', { type: PWSTR, offset: 56 })
        DefineProp(this.Prototype, 'szInstanceName', { type: PWSTR, offset: 64 })
        DefineProp(this.Prototype, 'szParentInstance', { type: PWSTR, offset: 72 })
        DefineProp(this.Prototype, 'dwInstanceIndex', { type: UInt32, offset: 80 })
        this.DeleteProp("__New")
    }
}
