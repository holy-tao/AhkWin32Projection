#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_HUB_30_PORT_REMOTE_WAKE_MASK {
    #StructPack 1

    AsUchar8 : Int8


    /**
     * @type {Integer}
     */
    ConnectRemoteWakeEnable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    DisconnectRemoteWakeEnable {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    OverCurrentRemoteWakeEnable {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 3) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 0 })
        this.DeleteProp("__New")
    }
}
