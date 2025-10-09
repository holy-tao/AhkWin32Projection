#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PDH_DATA_ITEM_PATH_ELEMENTS_W.ahk
#Include .\PDH_COUNTER_PATH_ELEMENTS_W.ahk

/**
 * The PDH_COUNTER_INFO structure contains information describing the properties of a counter. This information also includes the counter path. (Unicode)
 * @remarks
 * When you allocate memory for this structure, allocate enough memory for the member strings, such as <b>szCounterName</b>, that are appended to the end of this structure.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_counter_info_w
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 * @charset Unicode
 */
class PDH_COUNTER_INFO_W extends Win32Struct
{
    static sizeof => 112

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
     * @type {Pointer<Char>}
     */
    szFullPath {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {PDH_DATA_ITEM_PATH_ELEMENTS_W}
     */
    DataItemPath{
        get {
            if(!this.HasProp("__DataItemPath"))
                this.__DataItemPath := PDH_DATA_ITEM_PATH_ELEMENTS_W(this.ptr + 48)
            return this.__DataItemPath
        }
    }

    /**
     * @type {PDH_COUNTER_PATH_ELEMENTS_W}
     */
    CounterPath{
        get {
            if(!this.HasProp("__CounterPath"))
                this.__CounterPath := PDH_COUNTER_PATH_ELEMENTS_W(this.ptr + 48)
            return this.__CounterPath
        }
    }

    /**
     * @type {Pointer<Char>}
     */
    szMachineName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Char>}
     */
    szObjectName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Char>}
     */
    szInstanceName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<Char>}
     */
    szParentInstance {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    dwInstanceIndex {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer<Char>}
     */
    szCounterName {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Help text that describes the counter. Is <b>NULL</b> if the source is a log file.
     * @type {Pointer<Char>}
     */
    szExplainText {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Start of the string data that is appended to the structure.
     * @type {Array<UInt32>}
     */
    DataBuffer{
        get {
            if(!this.HasProp("__DataBufferProxyArray"))
                this.__DataBufferProxyArray := Win32FixedArray(this.ptr + 104, 1, Primitive, "uint")
            return this.__DataBufferProxyArray
        }
    }
}
