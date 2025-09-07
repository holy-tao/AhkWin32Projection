#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\CountedString.ahk

/**
 * Defines the extended isolation status of the machine or the connection.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-isolationinfoex
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class IsolationInfoEx extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-isolationstate">IsolationState</a> value that contains the isolation state of a machine.
     * @type {Integer}
     */
    isolationState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-extendedisolationstate">ExtendedIsolationState</a> value that contains the extended isolation state of a machine.
     * @type {Integer}
     */
    extendedIsolationState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-datatypes">ProbationTime</a> value that contains the time at which a machine should come out from probation.
     * @type {FILETIME}
     */
    probEndTime{
        get {
            if(!this.HasProp("__probEndTime"))
                this.__probEndTime := FILETIME(this.ptr + 8)
            return this.__probEndTime
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-countedstring">CountedString</a> value that contains a URL to navigate to in the event of failure.
     * @type {CountedString}
     */
    failureUrl{
        get {
            if(!this.HasProp("__failureUrl"))
                this.__failureUrl := CountedString(this.ptr + 16)
            return this.__failureUrl
        }
    }
}
