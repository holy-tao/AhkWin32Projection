#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSAUDIOMODULE_NOTIFICATION extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    class _ProviderId extends Win32Struct {
        static sizeof => 40
        static packingSize => 4

        /**
         * @type {Guid}
         */
        DeviceId {
            get {
                if(!this.HasProp("__DeviceId"))
                    this.__DeviceId := Guid(0, this)
                return this.__DeviceId
            }
        }

        /**
         * @type {Guid}
         */
        ClassId {
            get {
                if(!this.HasProp("__ClassId"))
                    this.__ClassId := Guid(16, this)
                return this.__ClassId
            }
        }

        /**
         * @type {Integer}
         */
        InstanceId {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }

        /**
         * @type {Integer}
         */
        Reserved {
            get => NumGet(this, 36, "uint")
            set => NumPut("uint", value, this, 36)
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
