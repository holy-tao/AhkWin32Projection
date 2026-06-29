#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\RPC_EE_INFO_PARAM.ahk" { RPC_EE_INFO_PARAM }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\ExtendedErrorParamTypes.ahk" { ExtendedErrorParamTypes }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import ".\BinaryParam.ahk" { BinaryParam }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

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
 */
export default struct RPC_EXTENDED_ERROR_INFO {
    #StructPack 8


    struct _u {
        SystemTime : SYSTEMTIME

        static __New() {
            DefineProp(this.Prototype, 'FileTime', { type: FILETIME, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Version of the structure. Must be RPC_EEINFO_VERSION.
     */
    Version : UInt32

    /**
     * Non-qualified DNS name, expressed in Unicode.
     */
    ComputerName : PWSTR

    /**
     * Process identifier for the offending error event.
     */
    ProcessID : UInt32

    u : RPC_EXTENDED_ERROR_INFO._u

    /**
     * Code for the component that generated the error.
     */
    GeneratingComponent : UInt32

    /**
     * Status code for the error.
     */
    Status : UInt32

    /**
     * Code for the detection location. See 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/extended-error-information-detection-locations">Extended Error Information Detection Locations</a> for valid locations.
     */
    DetectionLocation : UInt16

    /**
     * On input, specifies whether <b>SystemTime</b> or <b>FileTime</b> is used. Set to zero to use <b>SystemTime</b>, or EEInfoUseFileTime to use <b>FileTime</b>. 
     * 
     * 
     * 
     * 
     * On output, specifies whether records are missing. If a record is missing after the current record, <b>Flags</b> is set to EEInfoNextRecordsMissing. If a record is missing before the current record, <b>Flags</b> is set to EEInfoPreviousRecordsMissing.
     */
    Flags : UInt16

    /**
     * Number of parameters in the <b>Parameters</b> member.
     */
    NumberOfParameters : Int32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_ee_info_param">RPC_EE_INFO_PARAM</a> structures containing the extended error information.
     */
    Parameters : RPC_EE_INFO_PARAM[4]

}
