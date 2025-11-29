#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/mapinameid
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class MAPINAMEID extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _Kind_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        lID {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {PWSTR}
         */
        lpwstrName {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * @type {Pointer<Guid>}
     */
    lpguid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulKind {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {_Kind_e__Union}
     */
    Kind{
        get {
            if(!this.HasProp("__Kind"))
                this.__Kind := %this.__Class%._Kind_e__Union(16, this)
            return this.__Kind
        }
    }
}
