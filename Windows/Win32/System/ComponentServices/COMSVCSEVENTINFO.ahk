#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Represents contextual information about an event, such as the time it was generated and which process server and COM+ application generated it.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMSVCSEVENTINFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The process ID of the server application from which the event originated.
     * @type {Integer}
     */
    dwPid {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The coordinated universal time of the event, as seconds elapsed since midnight, January 1, 1970.
     * @type {Integer}
     */
    lTime {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The microseconds added to <b>lTime</b> for time to microsecond resolution.
     * @type {Integer}
     */
    lMicroTime {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The value of the high-resolution performance counter when the event originated.
     * @type {Integer}
     */
    perfCount {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The applications globally unique identifier (GUID) for the first component instantiated in <b>dwPid</b>. If you are subscribing to an administration interface or event and the event is not generated from a COM+ application, this member is set to zero.
     * @type {Pointer<Guid>}
     */
    guidApp {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The fully qualified name of the computer where the event originated.
     * @type {PWSTR}
     */
    sMachineName{
        get {
            if(!this.HasProp("__sMachineName"))
                this.__sMachineName := PWSTR(this.ptr + 40)
            return this.__sMachineName
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}
