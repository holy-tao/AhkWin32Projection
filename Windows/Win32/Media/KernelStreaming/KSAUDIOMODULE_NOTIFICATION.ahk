#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSAUDIOMODULE_NOTIFICATION extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    class _ProviderId extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Pointer}
         */
        DeviceId {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        ClassId {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }

        /**
         * @type {Integer}
         */
        InstanceId {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }

        /**
         * @type {Integer}
         */
        Reserved {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    }

    /**
     * @type {_ProviderId}
     */
    ProviderId {
        get {
            if(!this.HasProp("__ProviderId"))
                this.__ProviderId := KSAUDIOMODULE_NOTIFICATION._ProviderId(0, this)
            return this.__ProviderId
        }
    }

    /**
     * @type {Integer}
     */
    Alignment {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
