#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\BinaryParam.ahk
#Include .\RPC_EE_INFO_PARAM.ahk

/**
 * The RPC_EXTENDED_ERROR_INFO structure is used to store extended error information.
 * @remarks
 * On input, the caller fills in only the <b>Version</b> and <b>Flags</b> members of the 
  * <b>RPC_EXTENDED_ERROR_INFO</b> structure. All other members are filled upon output by RPC.
  * 
  * The 
  * <b>RPC_EXTENDED_ERROR_INFO</b> structure is used in conjunction with the <b>RpcError</b>* functions to investigate and create extended RPC error information.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ns-rpcasync-rpc_extended_error_info
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_EXTENDED_ERROR_INFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Version of the structure. Must be RPC_EEINFO_VERSION.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Non-qualified DNS name, expressed in Unicode.
     * @type {Pointer<PWSTR>}
     */
    ComputerName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Process identifier for the offending error event.
     * @type {Integer}
     */
    ProcessID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {SYSTEMTIME}
     */
    SystemTime{
        get {
            if(!this.HasProp("__SystemTime"))
                this.__SystemTime := SYSTEMTIME(this.ptr + 24)
            return this.__SystemTime
        }
    }

    /**
     * @type {FILETIME}
     */
    FileTime{
        get {
            if(!this.HasProp("__FileTime"))
                this.__FileTime := FILETIME(this.ptr + 24)
            return this.__FileTime
        }
    }

    /**
     * Code for the component that generated the error.
     * @type {Integer}
     */
    GeneratingComponent {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Status code for the error.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Code for the detection location. See 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/extended-error-information-detection-locations">Extended Error Information Detection Locations</a> for valid locations.
     * @type {Integer}
     */
    DetectionLocation {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * On input, specifies whether <b>SystemTime</b> or <b>FileTime</b> is used. Set to zero to use <b>SystemTime</b>, or EEInfoUseFileTime to use <b>FileTime</b>. 
     * 
     * 
     * 
     * 
     * On output, specifies whether records are missing. If a record is missing after the current record, <b>Flags</b> is set to EEInfoNextRecordsMissing. If a record is missing before the current record, <b>Flags</b> is set to EEInfoPreviousRecordsMissing.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * Number of parameters in the <b>Parameters</b> member.
     * @type {Integer}
     */
    NumberOfParameters {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_ee_info_param">RPC_EE_INFO_PARAM</a> structures containing the extended error information.
     * @type {Array<RPC_EE_INFO_PARAM>}
     */
    Parameters{
        get {
            if(!this.HasProp("__ParametersProxyArray"))
                this.__ParametersProxyArray := Win32FixedArray(this.ptr + 48, 4, RPC_EE_INFO_PARAM, "")
            return this.__ParametersProxyArray
        }
    }
}
