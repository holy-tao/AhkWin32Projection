#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_PAGE_TABLE_LEVEL_DESC.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_ESCAPE_GPUMMUCAPS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {BOOLEAN}
     */
    ReadOnlyMemorySupported {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    NoExecuteMemorySupported {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {BOOLEAN}
     */
    ZeroInPteSupported {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {BOOLEAN}
     */
    CacheCoherentMemorySupported {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {BOOLEAN}
     */
    LargePageSupported {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    DualPteSupported {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {BOOLEAN}
     */
    AllowNonAlignedLargePageAddress {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    VirtualAddressBitCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    PageTableLevelCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<D3DKMT_PAGE_TABLE_LEVEL_DESC>}
     */
    PageTableLevelDesk{
        get {
            if(!this.HasProp("__PageTableLevelDeskProxyArray"))
                this.__PageTableLevelDeskProxyArray := Win32FixedArray(this.ptr + 16, 6, Primitive, "ptr")
            return this.__PageTableLevelDeskProxyArray
        }
    }
}
