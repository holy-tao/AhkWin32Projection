#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NTMS_ASYNC_IO extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Guid}
     */
    OperationId {
        get {
            if(!this.HasProp("__OperationId"))
                this.__OperationId := Guid(0, this)
            return this.__OperationId
        }
    }

    /**
     * @type {Guid}
     */
    EventId {
        get {
            if(!this.HasProp("__EventId"))
                this.__EventId := Guid(16, this)
            return this.__EventId
        }
    }

    /**
     * @type {Integer}
     */
    dwOperationType {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwResult {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dwAsyncState {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {HANDLE}
     */
    hEvent {
        get {
            if(!this.HasProp("__hEvent"))
                this.__hEvent := HANDLE(48, this)
            return this.__hEvent
        }
    }

    /**
     * @type {BOOL}
     */
    bOnStateChange {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
