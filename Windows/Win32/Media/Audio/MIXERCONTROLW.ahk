#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixercontrolw
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset Unicode
 */
class MIXERCONTROLW extends Win32Struct
{
    static sizeof => 232

    static packingSize => 8

    class _Bounds_e__Union extends Win32Struct {
        static sizeof => 24
        static packingSize => 1

        /**
         * @type {Integer}
         */
        lMinimum {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        lMaximum {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        dwMinimum {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwMaximum {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Array<UInt32>}
         */
        dwReserved{
            get {
                if(!this.HasProp("__dwReservedProxyArray"))
                    this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "uint")
                return this.__dwReservedProxyArray
            }
        }
    
    }

    class _Metrics_e__Union extends Win32Struct {
        static sizeof => 24
        static packingSize => 1

        /**
         * @type {Integer}
         */
        cSteps {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        cbCustomData {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Array<UInt32>}
         */
        dwReserved{
            get {
                if(!this.HasProp("__dwReservedProxyArray"))
                    this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "uint")
                return this.__dwReservedProxyArray
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwControlID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwControlType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    fdwControl {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    cMultipleItems {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    szShortName {
        get => StrGet(this.ptr + 20, 15, "UTF-16")
        set => StrPut(value, this.ptr + 20, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 52, 63, "UTF-16")
        set => StrPut(value, this.ptr + 52, 63, "UTF-16")
    }

    /**
     * @type {_Bounds_e__Union}
     */
    Bounds{
        get {
            if(!this.HasProp("__Bounds"))
                this.__Bounds := %this.__Class%._Bounds_e__Union(184, this)
            return this.__Bounds
        }
    }

    /**
     * @type {_Metrics_e__Union}
     */
    Metrics{
        get {
            if(!this.HasProp("__Metrics"))
                this.__Metrics := %this.__Class%._Metrics_e__Union(208, this)
            return this.__Metrics
        }
    }
}
