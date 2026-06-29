#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The DBID structure encapsulates various ways of identifying a database object.
 * @remarks
 * The <b>DBID</b> structure identifies the requested columns for a query. Each unique column is represented by a unique combination of GUID and number or GUID and name.
 * @see https://learn.microsoft.com/windows/win32/api/oledbguid/ns-oledbguid-dbid
 * @namespace Windows.Win32.Storage.IndexServer
 * @architecture X64, Arm64
 */
class DBID extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    class _uGuid extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Guid}
         */
        guid {
            get {
                if(!this.HasProp("__guid"))
                    this.__guid := Guid(0, this)
                return this.__guid
            }
        }

        /**
         * @type {Pointer<Guid>}
         */
        pguid {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    }

    class _uName extends Win32Struct {
        static sizeof => 8
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
     * @type {_uGuid}
     */
    uGuid {
        get {
            if(!this.HasProp("__uGuid"))
                this.__uGuid := DBID._uGuid(0, this)
            return this.__uGuid
        }
    }

    /**
     * @type {Integer}
     */
    eKind {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {_uName}
     */
    uName {
        get {
            if(!this.HasProp("__uName"))
                this.__uName := DBID._uName(24, this)
            return this.__uName
        }
    }
}
