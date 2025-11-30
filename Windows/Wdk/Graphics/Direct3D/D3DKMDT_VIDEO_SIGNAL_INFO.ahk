#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_VIDEO_SIGNAL_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    VideoStandard {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<D3DKMDT_2DREGION>}
     */
    TotalSize {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3DKMDT_2DREGION>}
     */
    ActiveSize {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<D3DDDI_RATIONAL>}
     */
    VSyncFreq {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<D3DDDI_RATIONAL>}
     */
    HSyncFreq {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    PixelRate {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    class _AdditionalSignalInfo extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - ScanLineOrdering
         * - VSyncFreqDivider
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ScanLineOrdering {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }
    
        /**
         * @type {Integer}
         */
        VSyncFreqDivider {
            get => (this._bitfield >> 3) & 0x3F
            set => this._bitfield := ((value & 0x3F) << 3) | (this._bitfield & ~(0x3F << 3))
        }
    
    }

    /**
     * @type {_AdditionalSignalInfo}
     */
    AdditionalSignalInfo{
        get {
            if(!this.HasProp("__AdditionalSignalInfo"))
                this.__AdditionalSignalInfo := %this.__Class%._AdditionalSignalInfo(48, this)
            return this.__AdditionalSignalInfo
        }
    }

    /**
     * @type {Integer}
     */
    ScanLineOrdering {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
