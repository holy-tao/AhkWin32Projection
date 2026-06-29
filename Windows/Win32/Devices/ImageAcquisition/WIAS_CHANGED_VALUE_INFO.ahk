#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
class WIAS_CHANGED_VALUE_INFO extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    class _Old extends Win32Struct {
        static sizeof => 16
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
        bstrVal {
            get {
                if(!this.HasProp("__bstrVal"))
                    this.__bstrVal := BSTR(0, this)
                return this.__bstrVal
            }
        }

        /**
         * @type {Guid}
         */
        guidVal {
            get {
                if(!this.HasProp("__guidVal"))
                    this.__guidVal := Guid(0, this)
                return this.__guidVal
            }
        }
    }

    class _Current extends Win32Struct {
        static sizeof => 16
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
        bstrVal {
            get {
                if(!this.HasProp("__bstrVal"))
                    this.__bstrVal := BSTR(0, this)
                return this.__bstrVal
            }
        }

        /**
         * @type {Guid}
         */
        guidVal {
            get {
                if(!this.HasProp("__guidVal"))
                    this.__guidVal := Guid(0, this)
                return this.__guidVal
            }
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
     * @type {_Old}
     */
    Old {
        get {
            if(!this.HasProp("__Old"))
                this.__Old := WIAS_CHANGED_VALUE_INFO._Old(8, this)
            return this.__Old
        }
    }

    /**
     * @type {_Current}
     */
    Current {
        get {
            if(!this.HasProp("__Current"))
                this.__Current := WIAS_CHANGED_VALUE_INFO._Current(24, this)
            return this.__Current
        }
    }
}
