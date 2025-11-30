#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class FILE_PROCESS_IDS_USING_FILE_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfProcessIdsInList {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UIntPtr>}
     */
    ProcessIdList{
        get {
            if(!this.HasProp("__ProcessIdListProxyArray"))
                this.__ProcessIdListProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__ProcessIdListProxyArray
        }
    }
}
