#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset Unicode
 */
class JET_INSTANCE_INFO_W extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    hInstanceId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    szInstanceName{
        get {
            if(!this.HasProp("__szInstanceName"))
                this.__szInstanceName := PWSTR(this.ptr + 8)
            return this.__szInstanceName
        }
    }

    /**
     * @type {Pointer}
     */
    cDatabases {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    szDatabaseFileName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    szDatabaseDisplayName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    szDatabaseSLVFileName_Obsolete {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
