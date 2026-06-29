#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents contextual information about an event, such as the time it was generated and which process server and COM+ application generated it.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct COMSVCSEVENTINFO {
    #StructPack 8

    /**
     * The size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * The process ID of the server application from which the event originated.
     */
    dwPid : UInt32

    /**
     * The coordinated universal time of the event, as seconds elapsed since midnight, January 1, 1970.
     */
    lTime : Int64

    /**
     * The microseconds added to <b>lTime</b> for time to microsecond resolution.
     */
    lMicroTime : Int32

    /**
     * The value of the high-resolution performance counter when the event originated.
     */
    perfCount : Int64

    /**
     * The applications globally unique identifier (GUID) for the first component instantiated in <b>dwPid</b>. If you are subscribing to an administration interface or event and the event is not generated from a COM+ application, this member is set to zero.
     */
    guidApp : Guid

    /**
     * The fully qualified name of the computer where the event originated.
     */
    sMachineName : PWSTR

}
