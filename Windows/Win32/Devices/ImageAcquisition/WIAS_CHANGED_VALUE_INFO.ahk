#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIAS_CHANGED_VALUE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _Old_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        lVal {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Float}
         */
        fltVal {
            get => NumGet(this, 0, "float")
            set => NumPut("float", value, this, 0)
        }
    
        /**
         * @type {BSTR}
         */
        bstrVal{
            get {
                if(!this.HasProp("__bstrVal"))
                    this.__bstrVal := BSTR(0, this)
                return this.__bstrVal
            }
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        guidVal {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    class _Current_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        lVal {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Float}
         */
        fltVal {
            get => NumGet(this, 0, "float")
            set => NumPut("float", value, this, 0)
        }
    
        /**
         * @type {BSTR}
         */
        bstrVal{
            get {
                if(!this.HasProp("__bstrVal"))
                    this.__bstrVal := BSTR(0, this)
                return this.__bstrVal
            }
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        guidVal {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * @type {BOOL}
     */
    bChanged {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    vt {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {_Old_e__Union}
     */
    Old{
        get {
            if(!this.HasProp("__Old"))
                this.__Old := %this.__Class%._Old_e__Union(8, this)
            return this.__Old
        }
    }

    /**
     * @type {_Current_e__Union}
     */
    Current{
        get {
            if(!this.HasProp("__Current"))
                this.__Current := %this.__Class%._Current_e__Union(16, this)
            return this.__Current
        }
    }
}
