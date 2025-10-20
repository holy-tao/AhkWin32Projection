#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JET_INSTANCE.ahk
#Include ..\StructuredStorage\JET_API_PTR.ahk

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
     * @type {JET_INSTANCE}
     */
    hInstanceId{
        get {
            if(!this.HasProp("__hInstanceId"))
                this.__hInstanceId := JET_INSTANCE(0, this)
            return this.__hInstanceId
        }
    }

    /**
     * @type {Pointer<Integer>}
     */
    szInstanceName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {JET_API_PTR}
     */
    cDatabases{
        get {
            if(!this.HasProp("__cDatabases"))
                this.__cDatabases := JET_API_PTR(16, this)
            return this.__cDatabases
        }
    }

    /**
     * @type {Pointer<Pointer<Integer>>}
     */
    szDatabaseFileName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Pointer<Integer>>}
     */
    szDatabaseDisplayName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Pointer<Integer>>}
     */
    szDatabaseSLVFileName_Obsolete {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
