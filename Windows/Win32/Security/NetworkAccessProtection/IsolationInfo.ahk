#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\IsolationState.ahk" { IsolationState }
#Import ".\CountedString.ahk" { CountedString }

/**
 * Defines the isolation status of the machine or the connection.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-isolationinfo
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct IsolationInfo {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-isolationstate">IsolationState</a> values that contains the isolation state of a machine.
     */
    isolationState : IsolationState

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-datatypes">ProbationTime</a> value that contains the time at which a machine should come out from probation.
     */
    probEndTime : FILETIME

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-countedstring">CountedString</a> value that contains a URL to navigate to in the event of failure.
     */
    failureUrl : CountedString

}
