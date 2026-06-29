#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_20_PORT_CHANGE {
    #StructPack 1

    AsUshort16 : UInt16


    /**
     * @type {Integer}
     */
    ConnectStatusChange {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    PortEnableDisableChange {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    SuspendChange {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    OverCurrentIndicatorChange {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    ResetChange {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield >> 5) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 5) | (this._bitfield & ~(0x7FF << 5))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int16, offset: 0 })
        this.DeleteProp("__New")
    }
}
