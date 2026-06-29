#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_XPF_PROCINFO extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    class _CheckInfo extends Win32Struct {
        static sizeof => 8
        static packingSize => 1

        /**
         * @type {Pointer}
         */
        CacheCheck {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        TlbCheck {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        BusCheck {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        MsCheck {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        AsULONGLONG {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    /**
     * @type {Guid}
     */
    CheckInfoId {
        get {
            if(!this.HasProp("__CheckInfoId"))
                this.__CheckInfoId := Guid(0, this)
            return this.__CheckInfoId
        }
    }

    /**
     * @type {Pointer}
     */
    ValidBits {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {_CheckInfo}
     */
    CheckInfo {
        get {
            if(!this.HasProp("__CheckInfo"))
                this.__CheckInfo := WHEA_XPF_PROCINFO._CheckInfo(24, this)
            return this.__CheckInfo
        }
    }

    /**
     * @type {Integer}
     */
    TargetId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    RequesterId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ResponderId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    InstructionPointer {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
