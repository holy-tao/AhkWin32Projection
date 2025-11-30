#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk
#Include ..\..\..\Win32\System\WindowsProgramming\CLIENT_ID.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PS_CREATE_NOTIFY_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Size {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This bitfield backs the following members:
     * - FileOpenNameAvailable
     * - IsSubsystemProcess
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    FileOpenNameAvailable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    IsSubsystemProcess {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {HANDLE}
     */
    ParentProcessId{
        get {
            if(!this.HasProp("__ParentProcessId"))
                this.__ParentProcessId := HANDLE(16, this)
            return this.__ParentProcessId
        }
    }

    /**
     * @type {CLIENT_ID}
     */
    CreatingThreadId{
        get {
            if(!this.HasProp("__CreatingThreadId"))
                this.__CreatingThreadId := CLIENT_ID(24, this)
            return this.__CreatingThreadId
        }
    }

    /**
     * @type {Pointer<FILE_OBJECT>}
     */
    FileObject {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<UNICODE_STRING>}
     */
    ImageFileName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<UNICODE_STRING>}
     */
    CommandLine {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {NTSTATUS}
     */
    CreationStatus {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }
}
