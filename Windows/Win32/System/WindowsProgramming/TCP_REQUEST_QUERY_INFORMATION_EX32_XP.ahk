#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TDIEntityID.ahk
#Include .\TDIObjectID.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class TCP_REQUEST_QUERY_INFORMATION_EX32_XP extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

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
     * @type {Array<UInt32>}
     */
    Context{
        get {
            if(!this.HasProp("__ContextProxyArray"))
                this.__ContextProxyArray := Win32FixedArray(this.ptr + 20, 4, Primitive, "uint")
            return this.__ContextProxyArray
        }
    }
}
