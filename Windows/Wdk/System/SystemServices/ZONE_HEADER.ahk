#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\SINGLE_LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class ZONE_HEADER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {SINGLE_LIST_ENTRY}
     */
    FreeList{
        get {
            if(!this.HasProp("__FreeList"))
                this.__FreeList := SINGLE_LIST_ENTRY(0, this)
            return this.__FreeList
        }
    }

    /**
     * @type {SINGLE_LIST_ENTRY}
     */
    SegmentList{
        get {
            if(!this.HasProp("__SegmentList"))
                this.__SegmentList := SINGLE_LIST_ENTRY(8, this)
            return this.__SegmentList
        }
    }

    /**
     * @type {Integer}
     */
    BlockSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    TotalSegmentSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
