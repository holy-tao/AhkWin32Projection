#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JET_INSTANCE.ahk
#Include ..\StructuredStorage\JET_API_PTR.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset ANSI
 */
class JET_INSTANCE_INFO_A extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {JET_INSTANCE}
     */
    hInstanceId{
        get {
            if(!this.HasProp("__hInstanceId"))
                this.__hInstanceId := JET_INSTANCE(this.ptr + 0)
            return this.__hInstanceId
        }
    }

    /**
     * @type {Pointer<SByte>}
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
                this.__cDatabases := JET_API_PTR(this.ptr + 16)
            return this.__cDatabases
        }
    }

    /**
     * @type {Pointer<SByte>}
     */
    szDatabaseFileName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<SByte>}
     */
    szDatabaseDisplayName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<SByte>}
     */
    szDatabaseSLVFileName_Obsolete {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
