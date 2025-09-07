#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an ordered list of controller identifiers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_controller_list
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CONTROLLER_LIST extends Win32Struct
{
    static sizeof => 4096

    static packingSize => 2

    /**
     * Specifies the number of controller entries in the list.
     * 
     * There may be up to 2047 identifiers in the list. A value of 0 indicates that there are no controllers in the list.
     * @type {Integer}
     */
    NumberOfIdentifiers {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Contains a list of unique controller identifiers.
     * 
     * If the first value in the list is `0h`, the list is empty and there are no controllers in the list.
     * @type {Array<UInt16>}
     */
    ControllerID{
        get {
            if(!this.HasProp("__ControllerIDProxyArray"))
                this.__ControllerIDProxyArray := Win32FixedArray(this.ptr + 2, 2, Primitive, "ushort")
            return this.__ControllerIDProxyArray
        }
    }
}
