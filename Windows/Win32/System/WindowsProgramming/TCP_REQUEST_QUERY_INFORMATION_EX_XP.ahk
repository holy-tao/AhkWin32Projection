#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TDIEntityID.ahk
#Include .\TDIObjectID.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/tdiinfo/ns-tdiinfo-tcp_request_query_information_ex_xp
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class TCP_REQUEST_QUERY_INFORMATION_EX_XP extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {TDIObjectID}
     */
    ID{
        get {
            if(!this.HasProp("__ID"))
                this.__ID := TDIObjectID(0, this)
            return this.__ID
        }
    }

    /**
     * @type {Array<UIntPtr>}
     */
    Context{
        get {
            if(!this.HasProp("__ContextProxyArray"))
                this.__ContextProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "ptr")
            return this.__ContextProxyArray
        }
    }
}
