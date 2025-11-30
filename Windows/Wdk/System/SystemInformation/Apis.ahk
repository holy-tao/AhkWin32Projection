#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Wdk.System.SystemInformation
 * @version v4.0.30319
 */
class SystemInformation {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Retrieves the specified system information.
     * @param {Integer} SystemInformationClass One of the values enumerated in SYSTEM_INFORMATION_CLASS, which indicate the
     * kind of system information to be retrieved. These include the following values.
     * @param {Pointer<Void>} SystemInformation A pointer to a buffer that receives the requested information. The
     * size and structure of this information varies depending on the value of the
     * <i>SystemInformationClass</i> parameter:
     * @param {Integer} SystemInformationLength The size of the buffer pointed to by the <i>SystemInformation</i>parameter, in bytes.
     * @param {Pointer<Integer>} ReturnLength An optional pointer to a location where the function  writes the actual size
     * of the information requested. If that size is less than or equal to the    
     * <i>SystemInformationLength</i> parameter, the function copies the information
     * into the <i>SystemInformation</i> buffer; otherwise, it returns an NTSTATUS
     * error code and returns in <i>ReturnLength</i> the size of
     * buffer required to receive the requested information.
     * @returns {NTSTATUS} Returns an  NTSTATUS success or error code. 
     * 
     * The
     * forms and significance of NTSTATUS error codes are listed in the
     * Ntstatus.h header file available in the DDK, and are described in the DDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//winternl/nf-winternl-ntquerysysteminformation
     */
    static NtQuerySystemInformation(SystemInformationClass, SystemInformation, SystemInformationLength, ReturnLength) {
        SystemInformationMarshal := SystemInformation is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQuerySystemInformation", "int", SystemInformationClass, SystemInformationMarshal, SystemInformation, "uint", SystemInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} SystemInformationClass 
     * @param {Pointer<Void>} SystemInformation 
     * @param {Integer} SystemInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwQuerySystemInformation(SystemInformationClass, SystemInformation, SystemInformationLength, ReturnLength) {
        SystemInformationMarshal := SystemInformation is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQuerySystemInformation", "int", SystemInformationClass, SystemInformationMarshal, SystemInformation, "uint", SystemInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * Retrieves the current system time.
     * @param {Pointer<Integer>} SystemTime A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a> structure that receives the system time. This is a 64-bit value representing the number of 100-nanosecond intervals since January 1, 1601 (UTC).
     * @returns {NTSTATUS} If the function succeeds, it returns STATUS_SUCCESS.  If it fails, it will return the appropriate status code, which will typically be STATUS_ACCESS_VIOLATION.
     * @see https://docs.microsoft.com/windows/win32/api//winternl/nf-winternl-ntquerysystemtime
     */
    static NtQuerySystemTime(SystemTime) {
        SystemTimeMarshal := SystemTime is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtQuerySystemTime", SystemTimeMarshal, SystemTime, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SystemTime 
     * @returns {NTSTATUS} 
     */
    static ZwQuerySystemTime(SystemTime) {
        SystemTimeMarshal := SystemTime is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwQuerySystemTime", SystemTimeMarshal, SystemTime, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} MaximumTime 
     * @param {Pointer<Integer>} MinimumTime 
     * @param {Pointer<Integer>} CurrentTime 
     * @returns {NTSTATUS} 
     */
    static NtQueryTimerResolution(MaximumTime, MinimumTime, CurrentTime) {
        MaximumTimeMarshal := MaximumTime is VarRef ? "uint*" : "ptr"
        MinimumTimeMarshal := MinimumTime is VarRef ? "uint*" : "ptr"
        CurrentTimeMarshal := CurrentTime is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryTimerResolution", MaximumTimeMarshal, MaximumTime, MinimumTimeMarshal, MinimumTime, CurrentTimeMarshal, CurrentTime, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} MaximumTime 
     * @param {Pointer<Integer>} MinimumTime 
     * @param {Pointer<Integer>} CurrentTime 
     * @returns {NTSTATUS} 
     */
    static ZwQueryTimerResolution(MaximumTime, MinimumTime, CurrentTime) {
        MaximumTimeMarshal := MaximumTime is VarRef ? "uint*" : "ptr"
        MinimumTimeMarshal := MinimumTime is VarRef ? "uint*" : "ptr"
        CurrentTimeMarshal := CurrentTime is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryTimerResolution", MaximumTimeMarshal, MaximumTime, MinimumTimeMarshal, MinimumTime, CurrentTimeMarshal, CurrentTime, "int")
        return result
    }

;@endregion Methods
}
