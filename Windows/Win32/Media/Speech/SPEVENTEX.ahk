#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\WPARAM.ahk
#Include ..\..\Foundation\LPARAM.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPEVENTEX extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - eEventId
     * - elParamType
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    eEventId {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    elParamType {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }

    /**
     * @type {Integer}
     */
    ulStreamNum {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ullAudioStreamOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {WPARAM}
     */
    wParam{
        get {
            if(!this.HasProp("__wParam"))
                this.__wParam := WPARAM(this.ptr + 16)
            return this.__wParam
        }
    }

    /**
     * @type {LPARAM}
     */
    lParam{
        get {
            if(!this.HasProp("__lParam"))
                this.__lParam := LPARAM(this.ptr + 24)
            return this.__lParam
        }
    }

    /**
     * @type {Integer}
     */
    ullAudioTimeOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
