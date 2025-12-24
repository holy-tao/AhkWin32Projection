#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class QUERY_PATH_REQUEST_EX extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Pointer<IO_SECURITY_CONTEXT>}
     */
    pSecurityContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EaLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    pEaBuffer {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {UNICODE_STRING}
     */
    PathName{
        get {
            if(!this.HasProp("__PathName"))
                this.__PathName := UNICODE_STRING(24, this)
            return this.__PathName
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    DomainServiceName{
        get {
            if(!this.HasProp("__DomainServiceName"))
                this.__DomainServiceName := UNICODE_STRING(40, this)
            return this.__DomainServiceName
        }
    }

    /**
     * @type {Pointer<ECP_LIST>}
     */
    EcpList {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {PESILO}
     */
    Silo {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer}
     */
    Reserved {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
