#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_DEVICEESCAPE_TYPE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_DEVICE_ESCAPE extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {D3DKMT_DEVICEESCAPE_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _VidPnFromAllocation extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        hPrimaryAllocation {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        VidPnSourceId {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    }

    /**
     * @type {_VidPnFromAllocation}
     */
    VidPnFromAllocation {
        get {
            if(!this.HasProp("__VidPnFromAllocation"))
                this.__VidPnFromAllocation := D3DKMT_DEVICE_ESCAPE._VidPnFromAllocation(4, this)
            return this.__VidPnFromAllocation
        }
    }
}
