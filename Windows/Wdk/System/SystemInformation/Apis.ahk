#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\Win32\Foundation\NTSTATUS.ahk

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
     * @remarks
     * The <b>NtQuerySystemInformation</b> function and the structures
     * that it returns are internal to the operating system and  subject to change from
     * one  release of Windows to another.  To maintain the    compatibility of your
     * application, it is better to use the alternate functions previously mentioned instead.
     * 
     * If you do use <b>NtQuerySystemInformation</b>, access the function through
     * <a href="https://docs.microsoft.com/windows/desktop/Dlls/using-run-time-dynamic-linking">run-time dynamic
     * linking</a>.  This gives  your code an
     * opportunity to respond gracefully if the function has been   changed or removed
     * from the operating system. Signature changes, however, may not be
     * detectable.
     * 
     * This function has no associated import library. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to Ntdll.dll.
     * @param {Integer} SystemInformationClass One of the values enumerated in SYSTEM_INFORMATION_CLASS, which indicate the
     * kind of system information to be retrieved. These include the following values.
     * @param {Pointer<Void>} _SystemInformation 
     * @param {Integer} SystemInformationLength The size of the buffer pointed to by the <i>SystemInformation</i> parameter, in bytes.
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
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntquerysysteminformation
     */
    static NtQuerySystemInformation(SystemInformationClass, _SystemInformation, SystemInformationLength, ReturnLength) {
        _SystemInformationMarshal := _SystemInformation is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQuerySystemInformation", "int", SystemInformationClass, _SystemInformationMarshal, _SystemInformation, "uint", SystemInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * Retrieves the specified system information.
     * @remarks
     * The **ZwQuerySystemInformation** function and the structures that it returns are internal to the operating system and subject to change from one release of Windows to another. To maintain the compatibility of your application, it is better to use the alternate functions previously mentioned instead.
     * 
     * If you do use **ZwQuerySystemInformation**, access the function through [run-time dynamic linking](/windows/desktop/Dlls/using-run-time-dynamic-linking). This gives your code an opportunity to respond gracefully if the function has been changed or removed from the operating system. Signature changes, however, may not be detectable.
     * 
     * This function has no associated import library. You must use the [**LoadLibrary**](/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress) functions to dynamically link to Ntdll.dll.
     * @param {Integer} SystemInformationClass The type of system information to be retrieved. This parameter can be one of the following values from the **SYSTEM\_INFORMATION\_CLASS** enumeration type.
     * 
     * 
     * <span id="SystemBasicInformation"></span><span id="systembasicinformation"></span><span id="SYSTEMBASICINFORMATION"></span>
     * 
     * <span id="SystemBasicInformation"></span><span id="systembasicinformation"></span><span id="SYSTEMBASICINFORMATION"></span>**SystemBasicInformation**
     * 
     * 
     * 
     * The number of processors in the system in a **SYSTEM\_BASIC\_INFORMATION** structure. Use the [**GetSystemInfo**](/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsysteminfo) function instead.
     * 
     * 
     * <span id="SystemPerformanceInformation"></span><span id="systemperformanceinformation"></span><span id="SYSTEMPERFORMANCEINFORMATION"></span>
     * 
     * <span id="SystemPerformanceInformation"></span><span id="systemperformanceinformation"></span><span id="SYSTEMPERFORMANCEINFORMATION"></span>**SystemPerformanceInformation**
     * 
     * 
     * 
     * An opaque **SYSTEM\_PERFORMANCE\_INFORMATION** structure that can be used to generate an unpredictable seed for a random number generator. Use the [**CryptGenRandom**](/windows/desktop/api/wincrypt/nf-wincrypt-cryptgenrandom) function instead.
     * 
     * 
     * <span id="SystemTimeOfDayInformation"></span><span id="systemtimeofdayinformation"></span><span id="SYSTEMTIMEOFDAYINFORMATION"></span>
     * 
     * <span id="SystemTimeOfDayInformation"></span><span id="systemtimeofdayinformation"></span><span id="SYSTEMTIMEOFDAYINFORMATION"></span>**SystemTimeOfDayInformation**
     * 
     * 
     * 
     * An opaque **SYSTEM\_TIMEOFDAY\_INFORMATION** structure that can be used to generate an unpredictable seed for a random number generator. Use the [**CryptGenRandom**](/windows/desktop/api/wincrypt/nf-wincrypt-cryptgenrandom) function instead.
     * 
     * 
     * <span id="SystemProcessInformation"></span><span id="systemprocessinformation"></span><span id="SYSTEMPROCESSINFORMATION"></span>
     * 
     * <span id="SystemProcessInformation"></span><span id="systemprocessinformation"></span><span id="SYSTEMPROCESSINFORMATION"></span>**SystemProcessInformation**
     * 
     * 
     * 
     * An array of **SYSTEM\_PROCESS\_INFORMATION** structures, one for each process running in the system.
     * 
     * These structures contain information about the resource usage of each process, including the number of handles used by the process, the peak page-file usage, and the number of memory pages that the process has allocated.
     * 
     * 
     * <span id="SystemProcessorPerformanceInformation"></span><span id="systemprocessorperformanceinformation"></span><span id="SYSTEMPROCESSORPERFORMANCEINFORMATION"></span>
     * 
     * <span id="SystemProcessorPerformanceInformation"></span><span id="systemprocessorperformanceinformation"></span><span id="SYSTEMPROCESSORPERFORMANCEINFORMATION"></span>**SystemProcessorPerformanceInformation**
     * 
     * 
     * 
     * An array of **SYSTEM\_PROCESSOR\_PERFORMANCE\_INFORMATION** structures, one for each processor installed in the system.
     * 
     * 
     * <span id="SystemInterruptInformation"></span><span id="systeminterruptinformation"></span><span id="SYSTEMINTERRUPTINFORMATION"></span>
     * 
     * <span id="SystemInterruptInformation"></span><span id="systeminterruptinformation"></span><span id="SYSTEMINTERRUPTINFORMATION"></span>**SystemInterruptInformation**
     * 
     * 
     * 
     * An opaque **SYSTEM\_INTERRUPT\_INFORMATION** structure that can be used to generate an unpredictable seed for a random number generator. Use the [**CryptGenRandom**](/windows/desktop/api/wincrypt/nf-wincrypt-cryptgenrandom) function instead.
     * 
     * 
     * <span id="SystemExceptionInformation"></span><span id="systemexceptioninformation"></span><span id="SYSTEMEXCEPTIONINFORMATION"></span>
     * 
     * <span id="SystemExceptionInformation"></span><span id="systemexceptioninformation"></span><span id="SYSTEMEXCEPTIONINFORMATION"></span>**SystemExceptionInformation**
     * 
     * 
     * 
     * An opaque **SYSTEM\_EXCEPTION\_INFORMATION** structure that can be used to generate an unpredictable seed for a random number generator. Use the [**CryptGenRandom**](/windows/desktop/api/wincrypt/nf-wincrypt-cryptgenrandom) function instead.
     * 
     * 
     * <span id="SystemRegistryQuotaInformation"></span><span id="systemregistryquotainformation"></span><span id="SYSTEMREGISTRYQUOTAINFORMATION"></span>
     * 
     * <span id="SystemRegistryQuotaInformation"></span><span id="systemregistryquotainformation"></span><span id="SYSTEMREGISTRYQUOTAINFORMATION"></span>**SystemRegistryQuotaInformation**
     * 
     * 
     * 
     * A **SYSTEM\_REGISTRY\_QUOTA\_INFORMATION** structure.
     * 
     * 
     * <span id="SystemLookasideInformation"></span><span id="systemlookasideinformation"></span><span id="SYSTEMLOOKASIDEINFORMATION"></span>
     * 
     * <span id="SystemLookasideInformation"></span><span id="systemlookasideinformation"></span><span id="SYSTEMLOOKASIDEINFORMATION"></span>**SystemLookasideInformation**
     * 
     * 
     * 
     * An opaque **SYSTEM\_LOOKASIDE\_INFORMATION** structure that can be used to generate an unpredictable seed for a random number generator. Use the [**CryptGenRandom**](/windows/desktop/api/wincrypt/nf-wincrypt-cryptgenrandom) function instead.
     * @param {Pointer<Void>} _SystemInformation 
     * @param {Integer} SystemInformationLength The size of the buffer pointed to by the *SystemInformation* parameter, in bytes.
     * @param {Pointer<Integer>} ReturnLength An optional pointer to a location where the function writes the actual size of the information requested. If that size is less than or equal to the *SystemInformationLength* parameter, the function copies the information into the *SystemInformation* buffer; otherwise, it returns an NTSTATUS error code and returns in *ReturnLength* the size of buffer required to receive the requested information.
     * @returns {NTSTATUS} Returns an NTSTATUS success or error code.
     * 
     * The forms and significance of NTSTATUS error codes are listed in the Ntstatus.h header file available in the DDK, and are described in the DDK documentation.
     * @see https://learn.microsoft.com/windows/win32/SysInfo/zwquerysysteminformation
     */
    static ZwQuerySystemInformation(SystemInformationClass, _SystemInformation, SystemInformationLength, ReturnLength) {
        _SystemInformationMarshal := _SystemInformation is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQuerySystemInformation", "int", SystemInformationClass, _SystemInformationMarshal, _SystemInformation, "uint", SystemInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * Retrieves the current system time.
     * @remarks
     * This function has no associated import library. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to Ntdll.dll.
     * @param {Pointer<Integer>} _SystemTime 
     * @returns {NTSTATUS} If the function succeeds, it returns STATUS_SUCCESS.  If it fails, it will return the appropriate status code, which will typically be STATUS_ACCESS_VIOLATION.
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntquerysystemtime
     */
    static NtQuerySystemTime(_SystemTime) {
        _SystemTimeMarshal := _SystemTime is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtQuerySystemTime", _SystemTimeMarshal, _SystemTime, "int")
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} _SystemTime 
     * @returns {NTSTATUS} 
     */
    static ZwQuerySystemTime(_SystemTime) {
        _SystemTimeMarshal := _SystemTime is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwQuerySystemTime", _SystemTimeMarshal, _SystemTime, "int")
        NTSTATUS.ThrowIfError(result)
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
        NTSTATUS.ThrowIfError(result)
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
        NTSTATUS.ThrowIfError(result)
        return result
    }

;@endregion Methods
}
