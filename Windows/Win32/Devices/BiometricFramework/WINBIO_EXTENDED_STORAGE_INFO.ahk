#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the capabilities and enrollment requirements of the storage adapter for a biometric unit.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-extended-storage-info
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
class WINBIO_EXTENDED_STORAGE_INFO extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    class _Specific extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        class _FacialFeatures extends Win32Struct {
            static sizeof => 4
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Capabilities {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        }

        class _Fingerprint extends Win32Struct {
            static sizeof => 4
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Capabilities {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        }

        class _Iris extends Win32Struct {
            static sizeof => 4
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Capabilities {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        }

        class _Voice extends Win32Struct {
            static sizeof => 4
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Capabilities {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        }

        /**
         * @type {Integer}
         */
        Null {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {_FacialFeatures}
         */
        FacialFeatures {
            get {
                if(!this.HasProp("__FacialFeatures"))
                    this.__FacialFeatures := WINBIO_EXTENDED_STORAGE_INFO._Specific._FacialFeatures(0, this)
                return this.__FacialFeatures
            }
        }

        /**
         * @type {_Fingerprint}
         */
        Fingerprint {
            get {
                if(!this.HasProp("__Fingerprint"))
                    this.__Fingerprint := WINBIO_EXTENDED_STORAGE_INFO._Specific._Fingerprint(0, this)
                return this.__Fingerprint
            }
        }

        /**
         * @type {_Iris}
         */
        Iris {
            get {
                if(!this.HasProp("__Iris"))
                    this.__Iris := WINBIO_EXTENDED_STORAGE_INFO._Specific._Iris(0, this)
                return this.__Iris
            }
        }

        /**
         * @type {_Voice}
         */
        Voice {
            get {
                if(!this.HasProp("__Voice"))
                    this.__Voice := WINBIO_EXTENDED_STORAGE_INFO._Specific._Voice(0, this)
                return this.__Voice
            }
        }
    }

    /**
     * The generic capabilities of the storage component that is connected to a specific biometric unit.
     * @type {Integer}
     */
    GenericStorageCapabilities {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of biometric unit for which this structure contains information about capabilities and enrollment requirements of the storage adapter. For example, if the value of the **Factor** member is **WINBIO\_TYPE\_FINGERPRINT**, the **WINBIO\_EXTENDED\_STORAGE\_INFO** structure applies to a fingerprint reader and contains the relevant information in the **Specifc.Fingerprint** structure.
     * @type {Integer}
     */
    Factor {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Information about the capabilities and enrollment requirements of the storage adapter for a biometric unit related to a specific biometric factor.
     * @type {_Specific}
     */
    Specific {
        get {
            if(!this.HasProp("__Specific"))
                this.__Specific := WINBIO_EXTENDED_STORAGE_INFO._Specific(8, this)
            return this.__Specific
        }
    }
}
