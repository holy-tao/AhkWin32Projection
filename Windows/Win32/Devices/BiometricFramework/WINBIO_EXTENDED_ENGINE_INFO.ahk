#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the capabilities and enrollment requirements of the engine adapter for a biometric unit.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-extended-engine-info
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_EXTENDED_ENGINE_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The generic capabilities of the engine component that is connected to a specific biometric unit.
     * @type {Integer}
     */
    GenericEngineCapabilities {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of biometric unit for which this structure contains information about capabilities and enrollment requirements of the engine adapter. For example, if the value of the **Factor** member is **WINBIO\_TYPE\_FINGERPRINT**, the **WINBIO\_EXTENDED\_ENGINE\_INFO** structure applies to a fingerprint reader and contains the relevant information in the **Specifc.Fingerprint** structure.
     * @type {Integer}
     */
    Factor {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    class _FacialFeatures extends Win32Struct {
        static sizeof => 4
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Capabilities {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        EnrollmentRequirements {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    class _Fingerprint extends Win32Struct {
        static sizeof => 4
        static packingSize => 8

        class _EnrollmentRequirements extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            GeneralSamples {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Center {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            TopEdge {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            BottomEdge {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            LeftEdge {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            RightEdge {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
        }
    
        /**
         * @type {Integer}
         */
        Capabilities {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {_EnrollmentRequirements}
         */
        EnrollmentRequirements{
            get {
                if(!this.HasProp("__EnrollmentRequirements"))
                    this.__EnrollmentRequirements := %this.__Class%._EnrollmentRequirements(this.ptr + 8)
                return this.__EnrollmentRequirements
            }
        }
    
    }

    class _Iris extends Win32Struct {
        static sizeof => 4
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Capabilities {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        EnrollmentRequirements {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    class _Voice extends Win32Struct {
        static sizeof => 4
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Capabilities {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        EnrollmentRequirements {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    /**
     * @type {Integer}
     */
    Null {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {_FacialFeatures}
     */
    FacialFeatures{
        get {
            if(!this.HasProp("__FacialFeatures"))
                this.__FacialFeatures := %this.__Class%._FacialFeatures(this.ptr + 8)
            return this.__FacialFeatures
        }
    }

    /**
     * @type {_Fingerprint}
     */
    Fingerprint{
        get {
            if(!this.HasProp("__Fingerprint"))
                this.__Fingerprint := %this.__Class%._Fingerprint(this.ptr + 8)
            return this.__Fingerprint
        }
    }

    /**
     * @type {_Iris}
     */
    Iris{
        get {
            if(!this.HasProp("__Iris"))
                this.__Iris := %this.__Class%._Iris(this.ptr + 8)
            return this.__Iris
        }
    }

    /**
     * @type {_Voice}
     */
    Voice{
        get {
            if(!this.HasProp("__Voice"))
                this.__Voice := %this.__Class%._Voice(this.ptr + 8)
            return this.__Voice
        }
    }
}
