#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXGK_PTE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_GET_PTE extends Win32Struct
{
    static sizeof => 560

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PhysicalAdapterIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PageTableLevel {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<UInt32>}
     */
    PageTableIndex{
        get {
            if(!this.HasProp("__PageTableIndexProxyArray"))
                this.__PageTableIndexProxyArray := Win32FixedArray(this.ptr + 8, 6, Primitive, "uint")
            return this.__PageTableIndexProxyArray
        }
    }

    /**
     * @type {BOOLEAN}
     */
    b64KBPte {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    NumPtes {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Array<DXGK_PTE>}
     */
    Pte{
        get {
            if(!this.HasProp("__PteProxyArray"))
                this.__PteProxyArray := Win32FixedArray(this.ptr + 40, 64, Primitive, "ptr")
            return this.__PteProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NumValidEntries {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }
}
