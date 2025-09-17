#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents a system event structure, which contains the partition and application ID from which an event originated.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/ns-eventsys-comeventsyschangeinfo
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class COMEVENTSYSCHANGEINFO extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * The size of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of change that has been made to the subscription. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/ne-eventsys-eoc_changetype">EOC_ChangeType</a>.
     * @type {Integer}
     */
    changeType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The EventClass ID or subscription ID from which the change impacts.
     * @type {Pointer<Char>}
     */
    objectId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The EventClass partition ID or the subscriber partition ID affected.
     * @type {Pointer<Char>}
     */
    partitionId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The EventClass application ID or subscriber application ID affected.
     * @type {Pointer<Char>}
     */
    applicationId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * This member is reserved.
     * @type {Array<Guid>}
     */
    reserved{
        get {
            if(!this.HasProp("__reservedProxyArray"))
                this.__reservedProxyArray := Win32FixedArray(this.ptr + 32, 10, Primitive, "ptr")
            return this.__reservedProxyArray
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 112
    }
}
