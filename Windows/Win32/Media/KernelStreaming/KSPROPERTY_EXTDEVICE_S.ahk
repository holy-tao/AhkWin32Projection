#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DEVCAPS.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_EXTDEVICE_S extends Win32Struct {
    static sizeof => 544

    static packingSize => 8

    class _u extends Win32Struct {
        static sizeof => 520
        static packingSize => 4

        /**
         * @type {DEVCAPS}
         */
        Capabilities {
            get {
                if(!this.HasProp("__Capabilities"))
                    this.__Capabilities := DEVCAPS(0, this)
                return this.__Capabilities
            }
        }

        /**
         * @type {Integer}
         */
        DevPort {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        PowerState {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {String}
         */
        pawchString {
            get => StrGet(this.ptr + 0, 259, "UTF-16")
            set => StrPut(value, this.ptr + 0, 259, "UTF-16")
        }

        /**
         * @type {Array<Integer>}
         */
        NodeUniqueID {
            get {
                if(!this.HasProp("__NodeUniqueIDProxyArray"))
                    this.__NodeUniqueIDProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "uint")
                return this.__NodeUniqueIDProxyArray
            }
        }
    }

    /**
     * @type {KSIDENTIFIER}
     */
    Property {
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(0, this)
            return this.__Property
        }
    }

    /**
     * @type {_u}
     */
    u {
        get {
            if(!this.HasProp("__u"))
                this.__u := KSPROPERTY_EXTDEVICE_S._u(24, this)
            return this.__u
        }
    }
}
