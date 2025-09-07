#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SURFACEALIGNMENT.ahk
#Include .\HEAPALIGNMENT.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_GETHEAPALIGNMENTDATA extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    dwInstance {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwHeap {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ddRVal {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    GetHeapAlignment {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {HEAPALIGNMENT}
     */
    Alignment{
        get {
            if(!this.HasProp("__Alignment"))
                this.__Alignment := HEAPALIGNMENT(this.ptr + 24)
            return this.__Alignment
        }
    }
}
