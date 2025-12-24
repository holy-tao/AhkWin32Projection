#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\SINGLE_LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class ZONE_SEGMENT_HEADER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {SINGLE_LIST_ENTRY}
     */
    SegmentList{
        get {
            if(!this.HasProp("__SegmentList"))
                this.__SegmentList := SINGLE_LIST_ENTRY(0, this)
            return this.__SegmentList
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    Reserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
