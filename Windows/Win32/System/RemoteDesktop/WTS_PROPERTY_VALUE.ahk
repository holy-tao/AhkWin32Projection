#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Contains information about a property value to retrieve from the protocol.
 * @see https://docs.microsoft.com/windows/win32/api//wtsdefs/ns-wtsdefs-wts_property_value
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_PROPERTY_VALUE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    class _strVal extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        size {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {PWSTR}
         */
        pstrVal{
            get {
                if(!this.HasProp("__pstrVal"))
                    this.__pstrVal := PWSTR(this.ptr + 8)
                return this.__pstrVal
            }
        }
    
    }

    class _bVal extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        size {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {PSTR}
         */
        pbVal{
            get {
                if(!this.HasProp("__pbVal"))
                    this.__pbVal := PSTR(this.ptr + 8)
                return this.__pbVal
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    ulVal {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {_strVal}
     */
    strVal{
        get {
            if(!this.HasProp("__strVal"))
                this.__strVal := %this.__Class%._strVal(this.ptr + 8)
            return this.__strVal
        }
    }

    /**
     * @type {_bVal}
     */
    bVal{
        get {
            if(!this.HasProp("__bVal"))
                this.__bVal := %this.__Class%._bVal(this.ptr + 8)
            return this.__bVal
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
