#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ExtendedErrorParamTypes.ahk" { ExtendedErrorParamTypes }
#Import ".\BinaryParam.ahk" { BinaryParam }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The RPC_EE_INFO_PARAM structure is used to store extended error information.
 * @remarks
 * The 
 * <b>RPC_EE_INFO_PARAM</b> structure is used in conjunction with the <b>RpcError</b>* functions to investigate and create extended RPC error information.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ns-rpcasync-rpc_ee_info_param
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_EE_INFO_PARAM {
    #StructPack 8


    struct _u {
        AnsiString : PSTR

        static __New() {
            DefineProp(this.Prototype, 'UnicodeString', { type: PWSTR, offset: 0 })
            DefineProp(this.Prototype, 'LVal', { type: Int32, offset: 0 })
            DefineProp(this.Prototype, 'SVal', { type: Int16, offset: 0 })
            DefineProp(this.Prototype, 'PVal', { type: Int64, offset: 0 })
            DefineProp(this.Prototype, 'BVal', { type: BinaryParam, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Type of parameter being provided as extended error information. This value determines which union member(s) is used. Valid values are the following: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><b>eeptAnsiString</b> to specify an ANSI string, indicating the value is provided in <b>AnsiString</b>.</li>
     * <li><b>eeptUnicodeString</b> to specify a Unicode string, indicating the value is provided in <b>UnicodeString</b>.</li>
     * <li><b>eeptLongVal</b> to specify a LONG value, indicating the value is provided in <b>LVal</b>.</li>
     * <li><b>eeptShortVal</b> to specify a SHORT value, indicating the values is provided in <b>SVal</b>.</li>
     * <li><b>eeptPointerVal</b> to specify a pointer value, indicating the values is provided in <b>PVal</b>.</li>
     * <li><b>eeptBinary</b> is used by the RPC Runtime and should not be used or specified by applications.</li>
     * <li><b>eeptNone</b> indicates the parameter contained either a Unicode or ANSI string, but was truncated due to lack of memory or network fragment length limitations.</li>
     * </ul>
     */
    ParameterType : ExtendedErrorParamTypes

    u : RPC_EE_INFO_PARAM._u

}
