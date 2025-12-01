#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BinaryParam.ahk

/**
 * The RPC_EE_INFO_PARAM structure is used to store extended error information.
 * @remarks
 * The 
 * <b>RPC_EE_INFO_PARAM</b> structure is used in conjunction with the <b>RpcError</b>* functions to investigate and create extended RPC error information.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ns-rpcasync-rpc_ee_info_param
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_EE_INFO_PARAM extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _u_e__Union extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {PSTR}
         */
        AnsiString {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {PWSTR}
         */
        UnicodeString {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        LVal {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        SVal {
            get => NumGet(this, 0, "short")
            set => NumPut("short", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        PVal {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {BinaryParam}
         */
        BVal{
            get {
                if(!this.HasProp("__BVal"))
                    this.__BVal := BinaryParam(0, this)
                return this.__BVal
            }
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
     * @type {Integer}
     */
    ParameterType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(8, this)
            return this.__u
        }
    }
}
