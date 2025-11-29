#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DBID structure encapsulates various ways of identifying a database object.
 * @remarks
 * 
 * The <b>DBID</b> structure identifies the requested columns for a query. Each unique column is represented by a unique combination of GUID and number or GUID and name.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//oledbguid/ns-oledbguid-dbid
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class DBID extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _uGuid_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        guid {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        pguid {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    class _uName_e__Union extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {PWSTR}
         */
        pwszName {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ulPropid {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * 
     * @type {_uGuid_e__Union}
     */
    uGuid{
        get {
            if(!this.HasProp("__uGuid"))
                this.__uGuid := %this.__Class%._uGuid_e__Union(0, this)
            return this.__uGuid
        }
    }

    /**
     * 
     * @type {Integer}
     */
    eKind {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {_uName_e__Union}
     */
    uName{
        get {
            if(!this.HasProp("__uName"))
                this.__uName := %this.__Class%._uName_e__Union(16, this)
            return this.__uName
        }
    }
}
