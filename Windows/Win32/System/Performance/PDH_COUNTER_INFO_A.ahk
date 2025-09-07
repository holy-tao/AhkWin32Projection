#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\PDH_DATA_ITEM_PATH_ELEMENTS_A.ahk
#Include .\PDH_COUNTER_PATH_ELEMENTS_A.ahk

/**
 * The PDH_COUNTER_INFO structure contains information describing the properties of a counter. This information also includes the counter path. (ANSI)
 * @remarks
 * When you allocate memory for this structure, allocate enough memory for the member strings, such as <b>szCounterName</b>, that are appended to the end of this structure.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_counter_info_a
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 * @charset ANSI
 */
class PDH_COUNTER_INFO_A extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Size of the structure, including the appended strings, in bytes.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Counter type. For a list of counter types, see the Counter Types section of the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc776490(v=ws.10)">Windows Server 2003 Deployment Kit</a>. The counter type constants are defined in Winperf.h.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Counter version information.
     * 					Not used.
     * @type {Integer}
     */
    CVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Counter status that indicates if the counter value is valid. For a list of possible values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/checking-pdh-interface-return-values">Checking PDH Interface Return Values</a>.
     * @type {Integer}
     */
    CStatus {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Scale factor to use when computing the displayable value of the counter.
     * 					The scale factor is a power of ten. The valid range of this parameter is PDH_MIN_SCALE (–7) (the returned value is the actual value times 10<sup>–</sup>⁷) to PDH_MAX_SCALE (+7) (the returned value is the actual value times 10⁺⁷). A value of zero will set the scale to one, so that the actual value is returned
     * @type {Integer}
     */
    lScale {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Default scale factor as suggested by the counter's provider.
     * @type {Integer}
     */
    lDefaultScale {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The value passed in the <i>dwUserData</i> parameter when calling <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a>.
     * @type {Pointer}
     */
    dwUserData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The value passed in the <i>dwUserData</i> parameter when calling <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a>.
     * @type {Pointer}
     */
    dwQueryUserData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * <b>Null</b>-terminated string that specifies the full counter path. The string follows this structure in memory.
     * @type {PSTR}
     */
    szFullPath{
        get {
            if(!this.HasProp("__szFullPath"))
                this.__szFullPath := PSTR(this.ptr + 40)
            return this.__szFullPath
        }
    }

    /**
     * @type {PDH_DATA_ITEM_PATH_ELEMENTS_A}
     */
    DataItemPath{
        get {
            if(!this.HasProp("__DataItemPath"))
                this.__DataItemPath := PDH_DATA_ITEM_PATH_ELEMENTS_A(this.ptr + 48)
            return this.__DataItemPath
        }
    }

    /**
     * @type {PDH_COUNTER_PATH_ELEMENTS_A}
     */
    CounterPath{
        get {
            if(!this.HasProp("__CounterPath"))
                this.__CounterPath := PDH_COUNTER_PATH_ELEMENTS_A(this.ptr + 48)
            return this.__CounterPath
        }
    }

    /**
     * @type {PSTR}
     */
    szMachineName{
        get {
            if(!this.HasProp("__szMachineName"))
                this.__szMachineName := PSTR(this.ptr + 48)
            return this.__szMachineName
        }
    }

    /**
     * @type {PSTR}
     */
    szObjectName{
        get {
            if(!this.HasProp("__szObjectName"))
                this.__szObjectName := PSTR(this.ptr + 56)
            return this.__szObjectName
        }
    }

    /**
     * @type {PSTR}
     */
    szInstanceName{
        get {
            if(!this.HasProp("__szInstanceName"))
                this.__szInstanceName := PSTR(this.ptr + 64)
            return this.__szInstanceName
        }
    }

    /**
     * @type {PSTR}
     */
    szParentInstance{
        get {
            if(!this.HasProp("__szParentInstance"))
                this.__szParentInstance := PSTR(this.ptr + 72)
            return this.__szParentInstance
        }
    }

    /**
     * @type {Integer}
     */
    dwInstanceIndex {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {PSTR}
     */
    szCounterName{
        get {
            if(!this.HasProp("__szCounterName"))
                this.__szCounterName := PSTR(this.ptr + 88)
            return this.__szCounterName
        }
    }

    /**
     * Help text that describes the counter. Is <b>NULL</b> if the source is a log file.
     * @type {PSTR}
     */
    szExplainText{
        get {
            if(!this.HasProp("__szExplainText"))
                this.__szExplainText := PSTR(this.ptr + 80)
            return this.__szExplainText
        }
    }

    /**
     * Start of the string data that is appended to the structure.
     * @type {Array<UInt32>}
     */
    DataBuffer{
        get {
            if(!this.HasProp("__DataBufferProxyArray"))
                this.__DataBufferProxyArray := Win32FixedArray(this.ptr + 88, 4, Primitive, "uint")
            return this.__DataBufferProxyArray
        }
    }
}
