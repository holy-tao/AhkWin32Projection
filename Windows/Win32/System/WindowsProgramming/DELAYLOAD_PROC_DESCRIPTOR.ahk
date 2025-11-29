#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class DELAYLOAD_PROC_DESCRIPTOR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _Description_e__Union extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {PSTR}
         */
        Name {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Ordinal {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * @type {Integer}
     */
    ImportDescribedByName {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_Description_e__Union}
     */
    Description{
        get {
            if(!this.HasProp("__Description"))
                this.__Description := %this.__Class%._Description_e__Union(8, this)
            return this.__Description
        }
    }
}
