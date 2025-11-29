#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-extended-storage-info
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_EXTENDED_STORAGE_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    class _Specific_e__Union extends Win32Struct {
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
        FacialFeatures{
            get {
                if(!this.HasProp("__FacialFeatures"))
                    this.__FacialFeatures := %this.__Class%._FacialFeatures(0, this)
                return this.__FacialFeatures
            }
        }
    
        /**
         * @type {_Fingerprint}
         */
        Fingerprint{
            get {
                if(!this.HasProp("__Fingerprint"))
                    this.__Fingerprint := %this.__Class%._Fingerprint(0, this)
                return this.__Fingerprint
            }
        }
    
        /**
         * @type {_Iris}
         */
        Iris{
            get {
                if(!this.HasProp("__Iris"))
                    this.__Iris := %this.__Class%._Iris(0, this)
                return this.__Iris
            }
        }
    
        /**
         * @type {_Voice}
         */
        Voice{
            get {
                if(!this.HasProp("__Voice"))
                    this.__Voice := %this.__Class%._Voice(0, this)
                return this.__Voice
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    GenericStorageCapabilities {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Factor {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {_Specific_e__Union}
     */
    Specific{
        get {
            if(!this.HasProp("__Specific"))
                this.__Specific := %this.__Class%._Specific_e__Union(8, this)
            return this.__Specific
        }
    }
}
