#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class SystemInformation {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN2K => 83886080

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WINXP => 83951616

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WINXPSP2 => 83952128

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WS03SP1 => 84017408

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_VISTA => 100663296

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_VISTASP1 => 100663552

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN7 => 100728832

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN8 => 100794368

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WINBLUE => 100859904

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WINTHRESHOLD => 167772160

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_CPU_SET_INFORMATION_PARKED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_CPU_SET_INFORMATION_ALLOCATED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_CPU_SET_INFORMATION_ALLOCATED_TO_TARGET_PROCESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_CPU_SET_INFORMATION_REALTIME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_NT4 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_WIN2K => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_WINXP => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_WS03 => 1282

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_WIN6 => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_VISTA => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_WS08 => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_LONGHORN => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_WIN7 => 1537

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_WIN8 => 1538

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_WINBLUE => 1539

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_WINTHRESHOLD => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_WIN10 => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE20 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE30 => 768

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE302 => 770

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE40 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE401 => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE50 => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE501 => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE55 => 1360

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE60 => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE60SP1 => 1537

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE60SP2 => 1539

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE70 => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE80 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE90 => 2304

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE100 => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_IE110 => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_NT4 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_NT4SP1 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_NT4SP2 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_NT4SP3 => 770

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_NT4SP4 => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_NT4SP5 => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_NT4SP6 => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WIN98 => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WIN98SE => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WINME => 1360

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WIN2K => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WIN2KSP1 => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WIN2KSP2 => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WIN2KSP3 => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WIN2KSP4 => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_XP => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_XPSP1 => 1537

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_XPSP2 => 1539

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WS03 => 1538

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WS03SP1 => 1539

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WIN6 => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_LONGHORN => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WIN7 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WIN8 => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WINBLUE => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WINTHRESHOLD => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_WIN10 => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN4 => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN2KSP1 => 83886336

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN2KSP2 => 83886592

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN2KSP3 => 83886848

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN2KSP4 => 83887104

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WINXPSP1 => 83951872

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WINXPSP3 => 83952384

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WINXPSP4 => 83952640

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WS03 => 84017152

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WS03SP2 => 84017664

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WS03SP3 => 84017920

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WS03SP4 => 84018176

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN6 => 100663296

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN6SP1 => 100663552

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN6SP2 => 100663808

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN6SP3 => 100664064

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN6SP4 => 100664320

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_VISTASP2 => 100663808

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_VISTASP3 => 100664064

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_VISTASP4 => 100664320

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_LONGHORN => 100663296

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WS08 => 100663552

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WS08SP2 => 100663808

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WS08SP3 => 100664064

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WS08SP4 => 100664320

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10 => 167772160

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10_TH2 => 167772161

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10_RS1 => 167772162

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10_RS2 => 167772163

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10_RS3 => 167772164

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10_RS4 => 167772165

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10_RS5 => 167772166

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10_19H1 => 167772167

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10_VB => 167772168

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10_MN => 167772169

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10_FE => 167772170

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10_CO => 167772171

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10_NI => 167772172

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN10_CU => 167772173

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN11_ZN => 167772174

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN11_GA => 167772175

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_WIN11_GE => 167772176

    /**
     * @type {Integer (UInt32)}
     */
    static WDK_NTDDI_VERSION => 167772176

    /**
     * @type {Integer (UInt32)}
     */
    static OSVERSION_MASK => 4294901760

    /**
     * @type {Integer (UInt32)}
     */
    static SPVERSION_MASK => 65280

    /**
     * @type {Integer (UInt32)}
     */
    static SUBVERSION_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_VERSION => 167772176

    /**
     * @type {Integer (UInt32)}
     */
    static SCEX2_ALT_NETBIOS_NAME => 1
;@endregion Constants

;@region Methods
    /**
     * Retrieves information about the system's current usage of both physical and virtual memory.
     * @param {Pointer<MEMORYSTATUSEX>} lpBuffer A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/ns-sysinfoapi-memorystatusex">MEMORYSTATUSEX</a> structure that receives information about current memory availability.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-globalmemorystatusex
     * @since windows5.1.2600
     */
    static GlobalMemoryStatusEx(lpBuffer) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalMemoryStatusEx", "ptr", lpBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the current system.
     * @param {Pointer<SYSTEM_INFO>} lpSystemInfo A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/ns-sysinfoapi-system_info">SYSTEM_INFO</a> structure that receives the information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getsysteminfo
     * @since windows5.0
     */
    static GetSystemInfo(lpSystemInfo) {
        DllCall("KERNEL32.dll\GetSystemInfo", "ptr", lpSystemInfo)
    }

    /**
     * Retrieves the current system date and time in Coordinated Universal Time (UTC) format.
     * @remarks
     * 
     * To set the current system date and time, use the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-setsystemtime">SetSystemTime</a> function.
     * 
     * 
     * 
     * @param {Pointer<SYSTEMTIME>} lpSystemTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure to receive the current system date and time. The <i>lpSystemTime</i> parameter must not be <b>NULL</b>. Using <b>NULL</b> will result in an access violation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getsystemtime
     * @since windows5.0
     */
    static GetSystemTime(lpSystemTime) {
        DllCall("KERNEL32.dll\GetSystemTime", "ptr", lpSystemTime)
    }

    /**
     * Retrieves the current system date and time. The information is in Coordinated Universal Time (UTC) format.
     * @param {Pointer<FILETIME>} lpSystemTimeAsFileTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure to receive the current system date and time in UTC format.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getsystemtimeasfiletime
     * @since windows5.0
     */
    static GetSystemTimeAsFileTime(lpSystemTimeAsFileTime) {
        DllCall("KERNEL32.dll\GetSystemTimeAsFileTime", "ptr", lpSystemTimeAsFileTime)
    }

    /**
     * Retrieves the current local date and time.
     * @remarks
     * 
     * To set the current local date and time, use the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-setlocaltime">SetLocalTime</a> function.
     * 
     * 
     * 
     * @param {Pointer<SYSTEMTIME>} lpSystemTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure to receive the current local date and time.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getlocaltime
     * @since windows5.0
     */
    static GetLocalTime(lpSystemTime) {
        DllCall("KERNEL32.dll\GetLocalTime", "ptr", lpSystemTime)
    }

    /**
     * Queries whether user-mode Hardware-enforced Stack Protection is available for the specified environment.
     * @param {Integer} UserCetEnvironment 
     * @returns {BOOL} TRUE if user-mode Hardware-enforced Stack Protection is available for the specified environment, FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-isusercetavailableinenvironment
     */
    static IsUserCetAvailableInEnvironment(UserCetEnvironment) {
        result := DllCall("KERNEL32.dll\IsUserCetAvailableInEnvironment", "uint", UserCetEnvironment, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} Enabled 
     * @param {Pointer<Integer>} Flags 
     * @returns {BOOL} 
     */
    static GetSystemLeapSecondInformation(Enabled, Flags) {
        EnabledMarshal := Enabled is VarRef ? "int*" : "ptr"
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetSystemLeapSecondInformation", EnabledMarshal, Enabled, FlagsMarshal, Flags, "int")
        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @returns {Integer} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     * @deprecated 
     * @since windows5.0
     */
    static GetVersion() {
        result := DllCall("KERNEL32.dll\GetVersion", "uint")
        return result
    }

    /**
     * Sets the current local time and date.
     * @param {Pointer<SYSTEMTIME>} lpSystemTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the new local date and time. 
     * 
     * 
     * 
     * 
     * The <b>wDayOfWeek</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure is ignored.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-setlocaltime
     * @since windows5.0
     */
    static SetLocalTime(lpSystemTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetLocalTime", "ptr", lpSystemTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the number of milliseconds that have elapsed since the system was started, up to 49.7 days.
     * @returns {Integer} The return value is the number of milliseconds that have elapsed since the system was started.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-gettickcount
     * @since windows5.0
     */
    static GetTickCount() {
        result := DllCall("KERNEL32.dll\GetTickCount", "uint")
        return result
    }

    /**
     * Retrieves the number of milliseconds that have elapsed since the system was started.
     * @returns {Integer} The number of milliseconds.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-gettickcount64
     * @since windows6.0.6000
     */
    static GetTickCount64() {
        result := DllCall("KERNEL32.dll\GetTickCount64", "uint")
        return result
    }

    /**
     * Determines whether the system is applying periodic time adjustments to its time-of-day clock, and obtains the value and period of any such adjustments.
     * @param {Pointer<Integer>} lpTimeAdjustment A pointer to a variable that the function sets to the number of <i>lpTimeIncrement</i>100-nanosecond units added to the time-of-day clock for every  period of time which actually passes as counted by the system. This value only has meaning if <i>lpTimeAdjustmentDisabled</i> is <b>FALSE</b>.
     * @param {Pointer<Integer>} lpTimeIncrement A pointer to a variable that the function sets to the interval in 100-nanosecond units at which the system will add <i>lpTimeAdjustment</i> to the time-of-day clock. This value only has meaning if <i>lpTimeAdjustmentDisabled</i> is <b>FALSE</b>.
     * @param {Pointer<BOOL>} lpTimeAdjustmentDisabled A pointer to a variable that the function sets to indicate whether periodic time adjustment is in effect. 
     * 
     * 
     * 
     * 
     * A value of <b>TRUE</b> indicates that periodic time adjustment is disabled, and the system time-of-day clock advances at the normal rate. In this mode, the system may adjust the time of day using its own internal time synchronization mechanisms. These internal time synchronization mechanisms may cause the time-of-day clock to change during the normal course of the system operation, which can include noticeable jumps in time as deemed necessary by the system.
     * 
     * A value of <b>FALSE</b> indicates that periodic time adjustment is being used to adjust the time-of-day clock. For each <i>lpTimeIncrement</i> period of time that actually passes, <i>lpTimeAdjustment</i> will be added to the time of day.  If the <i>lpTimeAdjustment</i> value is smaller than <i>lpTimeIncrement</i>, the system time-of-day clock will advance at a rate slower than normal. If the <i>lpTimeAdjustment</i> value is larger than <i>lpTimeIncrement</i>, the time-of-day clock will advance at a rate faster than normal. If <i>lpTimeAdjustment</i> equals <i>lpTimeIncrement</i>, the time-of-day clock will advance at its normal speed.  The <i>lpTimeAdjustment</i>  value can be set by calling <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-setsystemtimeadjustment">SetSystemTimeAdjustment</a>. The <i>lpTimeIncrement</i> value is fixed by the system upon start, and does not change during system operation. In this mode, the system will not interfere with the time adjustment scheme, and will not attempt to synchronize time of day on its own via other techniques.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getsystemtimeadjustment
     * @since windows5.0
     */
    static GetSystemTimeAdjustment(lpTimeAdjustment, lpTimeIncrement, lpTimeAdjustmentDisabled) {
        lpTimeAdjustmentMarshal := lpTimeAdjustment is VarRef ? "uint*" : "ptr"
        lpTimeIncrementMarshal := lpTimeIncrement is VarRef ? "uint*" : "ptr"
        lpTimeAdjustmentDisabledMarshal := lpTimeAdjustmentDisabled is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetSystemTimeAdjustment", lpTimeAdjustmentMarshal, lpTimeAdjustment, lpTimeIncrementMarshal, lpTimeIncrement, lpTimeAdjustmentDisabledMarshal, lpTimeAdjustmentDisabled, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether the system is applying periodic, programmed time adjustments to its time-of-day clock, and obtains the value and period of any such adjustments.
     * @param {Pointer<Integer>} lpTimeAdjustment Returns the adjusted clock update frequency.
     * @param {Pointer<Integer>} lpTimeIncrement Returns the clock update frequency.
     * @param {Pointer<BOOL>} lpTimeAdjustmentDisabled Returns an indicator which specifies whether the time adjustment is enabled.
     * 
     * A value of <b>TRUE</b> indicates that periodic adjustment is disabled. In this case, the system may attempt to keep the time-of-day clock in sync using its own internal mechanisms. This may cause time-of-day to periodically jump to the "correct time."
     * 
     * A value of <b>FALSE</b> indicates that periodic, programmed time adjustment is being used to serialize time-of-day, and the system will not interfere or attempt to synchronize time-of-day on its own.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getsystemtimeadjustmentprecise
     * @since windows10.0.10240
     */
    static GetSystemTimeAdjustmentPrecise(lpTimeAdjustment, lpTimeIncrement, lpTimeAdjustmentDisabled) {
        lpTimeAdjustmentMarshal := lpTimeAdjustment is VarRef ? "uint*" : "ptr"
        lpTimeIncrementMarshal := lpTimeIncrement is VarRef ? "uint*" : "ptr"
        lpTimeAdjustmentDisabledMarshal := lpTimeAdjustmentDisabled is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("api-ms-win-core-sysinfo-l1-2-4.dll\GetSystemTimeAdjustmentPrecise", lpTimeAdjustmentMarshal, lpTimeAdjustment, lpTimeIncrementMarshal, lpTimeIncrement, lpTimeAdjustmentDisabledMarshal, lpTimeAdjustmentDisabled, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the path of the system directory.
     * @param {PSTR} lpBuffer A pointer to the buffer to receive the path. This path does not end with a backslash unless the system directory is the root directory. For example, if the system directory is named Windows\System32 on drive C, the path of the system directory retrieved by this function is C:\Windows\System32.
     * @param {Integer} uSize The maximum size of the buffer, in <b>TCHARs</b>.
     * @returns {Integer} If the function succeeds, the return value is the length, in <b>TCHARs</b>, of the string copied to the buffer, not including the terminating null character. If the length is greater than the size of the buffer, the return value is the size of the buffer required to hold the path, including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getsystemdirectorya
     * @since windows5.0
     */
    static GetSystemDirectoryA(lpBuffer, uSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetSystemDirectoryA", "ptr", lpBuffer, "uint", uSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the path of the system directory.
     * @param {PWSTR} lpBuffer A pointer to the buffer to receive the path. This path does not end with a backslash unless the system directory is the root directory. For example, if the system directory is named Windows\System32 on drive C, the path of the system directory retrieved by this function is C:\Windows\System32.
     * @param {Integer} uSize The maximum size of the buffer, in <b>TCHARs</b>.
     * @returns {Integer} If the function succeeds, the return value is the length, in <b>TCHARs</b>, of the string copied to the buffer, not including the terminating null character. If the length is greater than the size of the buffer, the return value is the size of the buffer required to hold the path, including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getsystemdirectoryw
     * @since windows5.0
     */
    static GetSystemDirectoryW(lpBuffer, uSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetSystemDirectoryW", "ptr", lpBuffer, "uint", uSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the path of the Windows directory.
     * @param {PSTR} lpBuffer A pointer to a buffer that receives the path. This path does not end with a 
     *       backslash unless the Windows directory is the root directory. For example, if the Windows directory is named 
     *       Windows on drive C, the path of the Windows directory retrieved by this function is C:\Windows. If the system 
     *       was installed in the root directory of drive C, the path retrieved is C:\.
     * @param {Integer} uSize The maximum size of the buffer specified by the <i>lpBuffer</i> parameter, in 
     *       <b>TCHARs</b>. This value should be set to <b>MAX_PATH</b>.
     * @returns {Integer} If the function succeeds, the return value is the length of the string copied to the buffer, in 
     *        <b>TCHARs</b>, not including the terminating null character.
     *       
     * 
     * If the length is greater than the size of the buffer, the return value is the size of the buffer required to 
     *        hold the path.
     *       
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getwindowsdirectorya
     * @since windows5.0
     */
    static GetWindowsDirectoryA(lpBuffer, uSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetWindowsDirectoryA", "ptr", lpBuffer, "uint", uSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the path of the Windows directory.
     * @param {PWSTR} lpBuffer A pointer to a buffer that receives the path. This path does not end with a 
     *       backslash unless the Windows directory is the root directory. For example, if the Windows directory is named 
     *       Windows on drive C, the path of the Windows directory retrieved by this function is C:\Windows. If the system 
     *       was installed in the root directory of drive C, the path retrieved is C:\.
     * @param {Integer} uSize The maximum size of the buffer specified by the <i>lpBuffer</i> parameter, in 
     *       <b>TCHARs</b>. This value should be set to <b>MAX_PATH</b>.
     * @returns {Integer} If the function succeeds, the return value is the length of the string copied to the buffer, in 
     *        <b>TCHARs</b>, not including the terminating null character.
     *       
     * 
     * If the length is greater than the size of the buffer, the return value is the size of the buffer required to 
     *        hold the path.
     *       
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getwindowsdirectoryw
     * @since windows5.0
     */
    static GetWindowsDirectoryW(lpBuffer, uSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetWindowsDirectoryW", "ptr", lpBuffer, "uint", uSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the path of the shared Windows directory on a multi-user system.
     * @param {PSTR} lpBuffer A pointer to the buffer to receive the path. This path does not end with a backslash unless the Windows directory is the root directory. For example, if the Windows directory is named Windows on drive C, the path of the Windows directory retrieved by this function is C:\Windows. If the system was installed in the root directory of drive C, the path retrieved is C:\.
     * @param {Integer} uSize The maximum size of the buffer specified by the <i>lpBuffer</i> parameter, in <b>TCHARs</b>.
     * @returns {Integer} If the function succeeds, the return value is the length of the string copied to the buffer, in <b>TCHARs</b>, not including the terminating null character.
     * 
     * If the length is greater than the size of the buffer, the return value is the size of the buffer required to hold the path.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getsystemwindowsdirectorya
     * @since windows5.0
     */
    static GetSystemWindowsDirectoryA(lpBuffer, uSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetSystemWindowsDirectoryA", "ptr", lpBuffer, "uint", uSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the path of the shared Windows directory on a multi-user system.
     * @param {PWSTR} lpBuffer A pointer to the buffer to receive the path. This path does not end with a backslash unless the Windows directory is the root directory. For example, if the Windows directory is named Windows on drive C, the path of the Windows directory retrieved by this function is C:\Windows. If the system was installed in the root directory of drive C, the path retrieved is C:\.
     * @param {Integer} uSize The maximum size of the buffer specified by the <i>lpBuffer</i> parameter, in <b>TCHARs</b>.
     * @returns {Integer} If the function succeeds, the return value is the length of the string copied to the buffer, in <b>TCHARs</b>, not including the terminating null character.
     * 
     * If the length is greater than the size of the buffer, the return value is the size of the buffer required to hold the path.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getsystemwindowsdirectoryw
     * @since windows5.0
     */
    static GetSystemWindowsDirectoryW(lpBuffer, uSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetSystemWindowsDirectoryW", "ptr", lpBuffer, "uint", uSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a NetBIOS or DNS name associated with the local computer. The names are established at system startup, when the system reads them from the registry.
     * @param {Integer} NameType The type of name to be retrieved. This parameter is a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/ne-sysinfoapi-computer_name_format">COMPUTER_NAME_FORMAT</a> enumeration type. The following table provides additional information. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNameDnsDomain"></a><a id="computernamednsdomain"></a><a id="COMPUTERNAMEDNSDOMAIN"></a><dl>
     * <dt><b>ComputerNameDnsDomain</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name of the DNS domain assigned to the local computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the DNS domain name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNameDnsFullyQualified"></a><a id="computernamednsfullyqualified"></a><a id="COMPUTERNAMEDNSFULLYQUALIFIED"></a><dl>
     * <dt><b>ComputerNameDnsFullyQualified</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The fully qualified DNS name that uniquely identifies the local computer. This name is a combination of the DNS host name and the DNS domain name, using the form <i>HostName</i>.<i>DomainName</i>. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the fully qualified DNS name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNameDnsHostname"></a><a id="computernamednshostname"></a><a id="COMPUTERNAMEDNSHOSTNAME"></a><dl>
     * <dt><b>ComputerNameDnsHostname</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS host name of the local computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the DNS host name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNameNetBIOS"></a><a id="computernamenetbios"></a><a id="COMPUTERNAMENETBIOS"></a><dl>
     * <dt><b>ComputerNameNetBIOS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The NetBIOS name of the local computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the NetBIOS name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNamePhysicalDnsDomain"></a><a id="computernamephysicaldnsdomain"></a><a id="COMPUTERNAMEPHYSICALDNSDOMAIN"></a><dl>
     * <dt><b>ComputerNamePhysicalDnsDomain</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name of the DNS domain assigned to the local computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the DNS domain name of the local computer, not the name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNamePhysicalDnsFullyQualified"></a><a id="computernamephysicaldnsfullyqualified"></a><a id="COMPUTERNAMEPHYSICALDNSFULLYQUALIFIED"></a><dl>
     * <dt><b>ComputerNamePhysicalDnsFullyQualified</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The fully qualified DNS name that uniquely identifies the computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the fully qualified DNS name of the local computer, not the name of the cluster virtual server. 
     * 
     * 
     * 
     * 
     * The fully qualified DNS name is a combination of the DNS host name and the DNS domain name, using the form <i>HostName</i>.<i>DomainName</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNamePhysicalDnsHostname"></a><a id="computernamephysicaldnshostname"></a><a id="COMPUTERNAMEPHYSICALDNSHOSTNAME"></a><dl>
     * <dt><b>ComputerNamePhysicalDnsHostname</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS host name of the local computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the DNS host name of the local computer, not the name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNamePhysicalNetBIOS"></a><a id="computernamephysicalnetbios"></a><a id="COMPUTERNAMEPHYSICALNETBIOS"></a><dl>
     * <dt><b>ComputerNamePhysicalNetBIOS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The NetBIOS name of the local computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the NetBIOS name of the local computer, not the name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PSTR} lpBuffer A pointer to a buffer that receives the computer name or the cluster virtual server name. 
     * 
     * 
     * 
     * 
     * The length of the name may be greater than MAX_COMPUTERNAME_LENGTH characters because DNS allows longer names. To ensure that this buffer is large enough, set this parameter to <b>NULL</b> and use the required buffer size returned in the <i>lpnSize</i> parameter.
     * @param {Pointer<Integer>} nSize On input, specifies the size of the buffer, in <b>TCHARs</b>. On output, receives the number of <b>TCHARs</b> copied to the destination buffer, not including the terminating <b>null</b> character. 
     * 
     * 
     * 
     * 
     * If the buffer is too small, the function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_MORE_DATA. This parameter receives the size of the buffer required,  including the terminating <b>null</b> character.
     * 
     * If <i>lpBuffer</i> is <b>NULL</b>, this parameter must be zero.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpBuffer</i> buffer is too small. The <i>lpnSize</i> parameter contains the number of bytes required to receive the name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getcomputernameexa
     * @since windows5.0
     */
    static GetComputerNameExA(NameType, lpBuffer, nSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetComputerNameExA", "int", NameType, "ptr", lpBuffer, nSizeMarshal, nSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a NetBIOS or DNS name associated with the local computer. The names are established at system startup, when the system reads them from the registry.
     * @param {Integer} NameType The type of name to be retrieved. This parameter is a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/ne-sysinfoapi-computer_name_format">COMPUTER_NAME_FORMAT</a> enumeration type. The following table provides additional information. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNameDnsDomain"></a><a id="computernamednsdomain"></a><a id="COMPUTERNAMEDNSDOMAIN"></a><dl>
     * <dt><b>ComputerNameDnsDomain</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name of the DNS domain assigned to the local computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the DNS domain name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNameDnsFullyQualified"></a><a id="computernamednsfullyqualified"></a><a id="COMPUTERNAMEDNSFULLYQUALIFIED"></a><dl>
     * <dt><b>ComputerNameDnsFullyQualified</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The fully qualified DNS name that uniquely identifies the local computer. This name is a combination of the DNS host name and the DNS domain name, using the form <i>HostName</i>.<i>DomainName</i>. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the fully qualified DNS name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNameDnsHostname"></a><a id="computernamednshostname"></a><a id="COMPUTERNAMEDNSHOSTNAME"></a><dl>
     * <dt><b>ComputerNameDnsHostname</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS host name of the local computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the DNS host name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNameNetBIOS"></a><a id="computernamenetbios"></a><a id="COMPUTERNAMENETBIOS"></a><dl>
     * <dt><b>ComputerNameNetBIOS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The NetBIOS name of the local computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the NetBIOS name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNamePhysicalDnsDomain"></a><a id="computernamephysicaldnsdomain"></a><a id="COMPUTERNAMEPHYSICALDNSDOMAIN"></a><dl>
     * <dt><b>ComputerNamePhysicalDnsDomain</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name of the DNS domain assigned to the local computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the DNS domain name of the local computer, not the name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNamePhysicalDnsFullyQualified"></a><a id="computernamephysicaldnsfullyqualified"></a><a id="COMPUTERNAMEPHYSICALDNSFULLYQUALIFIED"></a><dl>
     * <dt><b>ComputerNamePhysicalDnsFullyQualified</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The fully qualified DNS name that uniquely identifies the computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the fully qualified DNS name of the local computer, not the name of the cluster virtual server. 
     * 
     * 
     * 
     * 
     * The fully qualified DNS name is a combination of the DNS host name and the DNS domain name, using the form <i>HostName</i>.<i>DomainName</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNamePhysicalDnsHostname"></a><a id="computernamephysicaldnshostname"></a><a id="COMPUTERNAMEPHYSICALDNSHOSTNAME"></a><dl>
     * <dt><b>ComputerNamePhysicalDnsHostname</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS host name of the local computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the DNS host name of the local computer, not the name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ComputerNamePhysicalNetBIOS"></a><a id="computernamephysicalnetbios"></a><a id="COMPUTERNAMEPHYSICALNETBIOS"></a><dl>
     * <dt><b>ComputerNamePhysicalNetBIOS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The NetBIOS name of the local computer. If the local computer is a node in a cluster, <i>lpBuffer</i> receives the NetBIOS name of the local computer, not the name of the cluster virtual server.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} lpBuffer A pointer to a buffer that receives the computer name or the cluster virtual server name. 
     * 
     * 
     * 
     * 
     * The length of the name may be greater than MAX_COMPUTERNAME_LENGTH characters because DNS allows longer names. To ensure that this buffer is large enough, set this parameter to <b>NULL</b> and use the required buffer size returned in the <i>lpnSize</i> parameter.
     * @param {Pointer<Integer>} nSize On input, specifies the size of the buffer, in <b>TCHARs</b>. On output, receives the number of <b>TCHARs</b> copied to the destination buffer, not including the terminating <b>null</b> character. 
     * 
     * 
     * 
     * 
     * If the buffer is too small, the function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_MORE_DATA. This parameter receives the size of the buffer required,  including the terminating <b>null</b> character.
     * 
     * If <i>lpBuffer</i> is <b>NULL</b>, this parameter must be zero.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpBuffer</i> buffer is too small. The <i>lpnSize</i> parameter contains the number of bytes required to receive the name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getcomputernameexw
     * @since windows5.0
     */
    static GetComputerNameExW(NameType, lpBuffer, nSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetComputerNameExW", "int", NameType, "ptr", lpBuffer, nSizeMarshal, nSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets a new NetBIOS or DNS name for the local computer.
     * @param {Integer} NameType 
     * @param {PWSTR} lpBuffer The new name. The name cannot include control characters, leading or trailing spaces, or any of the following characters: " / \ [ ] : | &lt; &gt; + = ; , ?
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-setcomputernameexw
     * @since windows5.0
     */
    static SetComputerNameExW(NameType, lpBuffer) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetComputerNameExW", "int", NameType, "ptr", lpBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the current system time and date. The system time is expressed in Coordinated Universal Time (UTC).
     * @param {Pointer<SYSTEMTIME>} lpSystemTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the new system date and time. 
     * 
     * 
     * 
     * 
     * The <b>wDayOfWeek</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure is ignored.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-setsystemtime
     * @since windows5.0
     */
    static SetSystemTime(lpSystemTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetSystemTime", "ptr", lpSystemTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersionEx API has changed in the value it will return for the operating system version. The value returned by the GetVersionEx function now depends on how the application is manifested.
     * @param {Pointer<OSVERSIONINFOA>} lpVersionInformation An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-osversioninfoa">OSVERSIONINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-osversioninfoexa">OSVERSIONINFOEX</a> structure that receives the operating system information. 
     * 
     * 
     * 
     * 
     * Before calling the 
     * <b>GetVersionEx</b> function, set the <b>dwOSVersionInfoSize</b> member of the structure as appropriate to indicate which data structure is being passed to this function.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The function fails if you specify an invalid value for the <b>dwOSVersionInfoSize</b> member of the 
     * <a href="/windows/desktop/api/winnt/ns-winnt-osversioninfoa">OSVERSIONINFO</a> or 
     * <a href="/windows/desktop/api/winnt/ns-winnt-osversioninfoexa">OSVERSIONINFOEX</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversionexa
     * @deprecated 
     * @since windows5.0
     */
    static GetVersionExA(lpVersionInformation) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetVersionExA", "ptr", lpVersionInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersionEx API has changed in the value it will return for the operating system version. The value returned by the GetVersionEx function now depends on how the application is manifested.
     * @param {Pointer<OSVERSIONINFOW>} lpVersionInformation An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-osversioninfoa">OSVERSIONINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-osversioninfoexa">OSVERSIONINFOEX</a> structure that receives the operating system information. 
     * 
     * 
     * 
     * 
     * Before calling the 
     * <b>GetVersionEx</b> function, set the <b>dwOSVersionInfoSize</b> member of the structure as appropriate to indicate which data structure is being passed to this function.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The function fails if you specify an invalid value for the <b>dwOSVersionInfoSize</b> member of the 
     * <a href="/windows/desktop/api/winnt/ns-winnt-osversioninfoa">OSVERSIONINFO</a> or 
     * <a href="/windows/desktop/api/winnt/ns-winnt-osversioninfoexa">OSVERSIONINFOEX</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversionexw
     * @deprecated 
     * @since windows5.0
     */
    static GetVersionExW(lpVersionInformation) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetVersionExW", "ptr", lpVersionInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about logical processors and related hardware.
     * @param {Pointer} Buffer A pointer to a buffer that receives  an array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_logical_processor_information">SYSTEM_LOGICAL_PROCESSOR_INFORMATION</a> structures. If the function fails, the contents of this buffer are undefined.
     * @param {Pointer<Integer>} ReturnedLength On input, specifies the length of the buffer pointed to by  <i>Buffer</i>, in bytes. If the buffer is large enough to contain all of the data, this function succeeds and <i>ReturnLength</i> is set to the number of bytes returned. If the buffer is not large enough to contain all of the data, the function fails, <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, and <i>ReturnLength</i> is set to the buffer length required to contain all of the data. If the function fails with an error other than ERROR_INSUFFICIENT_BUFFER, the value of <i>ReturnLength</i> is undefined.
     * @returns {BOOL} If the function succeeds, the return value is TRUE and at least one <a href="/windows/desktop/api/winnt/ns-winnt-system_logical_processor_information">SYSTEM_LOGICAL_PROCESSOR_INFORMATION</a> structure is written to the output buffer.
     * 
     * If the function fails, the return value is FALSE. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getlogicalprocessorinformation
     * @since windows6.0.6000
     */
    static GetLogicalProcessorInformation(Buffer, ReturnedLength) {
        ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetLogicalProcessorInformation", "ptr", Buffer, ReturnedLengthMarshal, ReturnedLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the relationships of logical processors and related hardware.
     * @param {Integer} RelationshipType The type of relationship to retrieve. This parameter can be one of the following <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-logical_processor_relationship">LOGICAL_PROCESSOR_RELATIONSHIP</a> values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RelationCache"></a><a id="relationcache"></a><a id="RELATIONCACHE"></a><dl>
     * <dt><b>RelationCache</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves information about logical processors  that share a cache. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RelationNumaNode"></a><a id="relationnumanode"></a><a id="RELATIONNUMANODE"></a><dl>
     * <dt><b>RelationNumaNode</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves information about logical processors  that are part of the same NUMA node. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RelationProcessorCore"></a><a id="relationprocessorcore"></a><a id="RELATIONPROCESSORCORE"></a><dl>
     * <dt><b>RelationProcessorCore</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves information about logical processors that share a single processor core. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RelationProcessorPackage"></a><a id="relationprocessorpackage"></a><a id="RELATIONPROCESSORPACKAGE"></a><dl>
     * <dt><b>RelationProcessorPackage</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves information about logical processors that share a physical package. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RelationGroup"></a><a id="relationgroup"></a><a id="RELATIONGROUP"></a><dl>
     * <dt><b>RelationGroup</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves information about logical processors that share a processor group. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RelationAll"></a><a id="relationall"></a><a id="RELATIONALL"></a><dl>
     * <dt><b>RelationAll</b></dt>
     * <dt>0xffff</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves information about logical processors for all relationship types (cache, NUMA node, processor core, physical package, and processor group).
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} Buffer A pointer to a buffer that receives  an array of <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-system_logical_processor_information_ex">SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX</a> structures. If the function fails, the contents of this buffer are undefined.
     * @param {Pointer<Integer>} ReturnedLength On input, specifies the length of the buffer pointed to by  <i>Buffer</i>, in bytes. If the buffer is large enough to contain all of the data, this function succeeds and <i>ReturnedLength</i> is set to the number of bytes returned. If the buffer is not large enough to contain all of the data, the function fails, <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, and <i>ReturnedLength</i> is set to the buffer length required to contain all of the data. If the function fails with an error other than ERROR_INSUFFICIENT_BUFFER, the value of <i>ReturnedLength</i> is undefined.
     * @returns {BOOL} If the function succeeds, the return value is TRUE and at least one <a href="/windows/win32/api/winnt/ns-winnt-system_logical_processor_information_ex">SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX</a> structure is written to the output buffer.
     * 
     * If the function fails, the return value is FALSE. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getlogicalprocessorinformationex
     * @since windows6.1
     */
    static GetLogicalProcessorInformationEx(RelationshipType, Buffer, ReturnedLength) {
        ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetLogicalProcessorInformationEx", "int", RelationshipType, "ptr", Buffer, ReturnedLengthMarshal, ReturnedLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the current system to an application running under WOW64.
     * @remarks
     * 
     * To determine whether a Win32-based application is running under WOW64, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wow64apiset/nf-wow64apiset-iswow64process2">IsWow64Process2</a> function.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0501 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * 
     * 
     * @param {Pointer<SYSTEM_INFO>} lpSystemInfo A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/ns-sysinfoapi-system_info">SYSTEM_INFO</a> structure that receives the information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getnativesysteminfo
     * @since windows5.1.2600
     */
    static GetNativeSystemInfo(lpSystemInfo) {
        DllCall("KERNEL32.dll\GetNativeSystemInfo", "ptr", lpSystemInfo)
    }

    /**
     * GetSystemTimePreciseAsFileTime function retrieves the current system date and time with the highest possible level of precision (&lt;1us). The retrieved information is in Coordinated Universal Time (UTC) format.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  This function is best suited for high-resolution time-of-day measurements, or time stamps that are synchronized to UTC. For high-resolution interval measurements, use <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a> or <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntifs/nf-ntifs-kequeryperformancecounter">KeQueryPerformanceCounter</a>. For more info about acquiring high-resolution time stamps, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/acquiring-high-resolution-time-stamps">Acquiring high-resolution time stamps</a>.</div>
     * <div> </div>
     * 
     * @param {Pointer<FILETIME>} lpSystemTimeAsFileTime Type: <b>LPFILETIME</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the 
     *       current system date and time in UTC format.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getsystemtimepreciseasfiletime
     * @since windows8.0
     */
    static GetSystemTimePreciseAsFileTime(lpSystemTimeAsFileTime) {
        DllCall("KERNEL32.dll\GetSystemTimePreciseAsFileTime", "ptr", lpSystemTimeAsFileTime)
    }

    /**
     * Retrieves the product type for the operating system on the local computer, and maps the type to the product types supported by the specified operating system.
     * @param {Integer} dwOSMajorVersion The major version number of the operating system. The minimum value is 6.
     * 
     * The combination of the <i>dwOSMajorVersion</i>, <i>dwOSMinorVersion</i>, <i>dwSpMajorVersion</i>, and <i>dwSpMinorVersion</i> parameters describes the maximum target operating system version for the application. For example, Windows Vista and Windows Server 2008 are version 6.0.0.0 and Windows 7 and Windows Server 2008 R2 are version 6.1.0.0. All Windows 10 based releases will be listed as version 6.3.
     * @param {Integer} dwOSMinorVersion The minor version number of the operating system. The minimum value is 0.
     * @param {Integer} dwSpMajorVersion The major version number of the operating system service pack. The minimum value is 0.
     * @param {Integer} dwSpMinorVersion The minor version number of the operating system service pack. The minimum value is 0.
     * @param {Pointer<Integer>} pdwReturnedProductType The product type. This parameter cannot be <b>NULL</b>. If the specified operating system  is less than the current operating system, this information is mapped to the types supported by the specified operating system. If the specified operating system is greater than the highest supported operating system, this information is mapped to the types supported by the current operating system.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. This function fails if one of the input parameters is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getproductinfo
     * @since windows6.0.6000
     */
    static GetProductInfo(dwOSMajorVersion, dwOSMinorVersion, dwSpMajorVersion, dwSpMinorVersion, pdwReturnedProductType) {
        pdwReturnedProductTypeMarshal := pdwReturnedProductType is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetProductInfo", "uint", dwOSMajorVersion, "uint", dwOSMinorVersion, "uint", dwSpMajorVersion, "uint", dwSpMinorVersion, pdwReturnedProductTypeMarshal, pdwReturnedProductType, "int")
        return result
    }

    /**
     * Sets the bits of a 64-bit value to indicate the comparison operator to use for a specified operating system version attribute. This function is used to build the dwlConditionMask parameter of the VerifyVersionInfo function.
     * @param {Integer} ConditionMask A value to be passed as the <i>dwlConditionMask</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-verifyversioninfoa">VerifyVersionInfo</a> function. The function stores the comparison information in the bits of this variable. 
     * 
     * 
     * 
     * 
     * Before the first call to <b>VerSetCondition</b>, initialize this variable to zero. For subsequent calls, pass in the variable used in the previous call.
     * @param {Integer} TypeMask A mask that indicates the member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-osversioninfoexa">OSVERSIONINFOEX</a> structure whose comparison operator is being set. This value corresponds to one of the bits specified in the <i>dwTypeMask</i> parameter for the
     * @param {Integer} Condition The operator to be used for the comparison. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-verifyversioninfoa">VerifyVersionInfo</a> function uses this operator to compare a specified attribute value to the corresponding value for the currently running system.
     * @returns {Integer} The function returns the condition mask value.
     * @see https://docs.microsoft.com/windows/win32/api//winnt/nf-winnt-versetconditionmask
     * @since windows5.0
     */
    static VerSetConditionMask(ConditionMask, TypeMask, Condition) {
        result := DllCall("KERNEL32.dll\VerSetConditionMask", "uint", ConditionMask, "uint", TypeMask, "char", Condition, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Flags 
     * @returns {BOOL} 
     */
    static GetOsSafeBootMode(Flags) {
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := DllCall("api-ms-win-core-sysinfo-l1-2-0.dll\GetOsSafeBootMode", FlagsMarshal, Flags, "int")
        return result
    }

    /**
     * Enumerates all system firmware tables of the specified type.
     * @param {Integer} FirmwareTableProviderSignature 
     * @param {Pointer} pFirmwareTableEnumBuffer A pointer to a buffer that receives the list of  firmware tables. If this parameter is <b>NULL</b>, the return value is the required buffer size.
     * 
     * For more information on the contents of this buffer, see the Remarks section.
     * @param {Integer} BufferSize The size of the <i>pFirmwareTableBuffer</i> buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is the number of bytes written to the buffer. This value will always be less than or equal to <i>BufferSize</i>.
     * 
     * If the function fails because the buffer is not large enough, the return value is the required buffer size, in bytes. This value is always greater than <i>BufferSize</i>.
     * 
     * If the function fails for any other reason, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-enumsystemfirmwaretables
     * @since windows6.0.6000
     */
    static EnumSystemFirmwareTables(FirmwareTableProviderSignature, pFirmwareTableEnumBuffer, BufferSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\EnumSystemFirmwareTables", "uint", FirmwareTableProviderSignature, "ptr", pFirmwareTableEnumBuffer, "uint", BufferSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the specified firmware table from the firmware table provider.
     * @param {Integer} FirmwareTableProviderSignature 
     * @param {Integer} FirmwareTableID The identifier of the firmware table. This identifier is little endian, you must reverse the characters in the string. 
     * 
     * For example, FACP is an ACPI provider, as described in the Signature field of the DESCRIPTION_HEADER structure in the ACPI specification (see <a href="http://www.acpi.info/">http://www.acpi.info</a>). Therefore, use 'PCAF' to specify the FACP table, as shown in the following example:
     * 
     * <c>retVal = GetSystemFirmwareTable('ACPI', 'PCAF', pBuffer, BUFSIZE);</c>
     * 
     * For more information, see the Remarks section of the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-enumsystemfirmwaretables">EnumSystemFirmwareTables</a> function.
     * @param {Pointer} pFirmwareTableBuffer A pointer to a buffer that receives the requested firmware table. If this parameter is <b>NULL</b>, the return value is the required buffer size. 
     * 
     * For more information on the contents of this buffer, see the Remarks section.
     * @param {Integer} BufferSize The size of the <i>pFirmwareTableBuffer</i> buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is the number of bytes written to the buffer. This value will always be less than or equal to <i>BufferSize</i>.
     * 
     * If the function fails because the buffer is not large enough, the return value is the required buffer size, in bytes. This value is always greater than <i>BufferSize</i>.
     * 
     * If the function fails for any other reason, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getsystemfirmwaretable
     * @since windows6.0.6000
     */
    static GetSystemFirmwareTable(FirmwareTableProviderSignature, FirmwareTableID, pFirmwareTableBuffer, BufferSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetSystemFirmwareTable", "uint", FirmwareTableProviderSignature, "uint", FirmwareTableID, "ptr", pFirmwareTableBuffer, "uint", BufferSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} Hostname 
     * @param {PWSTR} ComputerName 
     * @param {Pointer<Integer>} nSize 
     * @returns {BOOL} 
     */
    static DnsHostnameToComputerNameExW(Hostname, ComputerName, nSize) {
        Hostname := Hostname is String ? StrPtr(Hostname) : Hostname
        ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName

        nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\DnsHostnameToComputerNameExW", "ptr", Hostname, "ptr", ComputerName, nSizeMarshal, nSize, "int")
        return result
    }

    /**
     * Retrieves the amount of RAM that is physically installed on the computer.
     * @param {Pointer<Integer>} TotalMemoryInKilobytes A pointer to a 
     * variable that receives the amount of physically installed RAM, in kilobytes.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b> and sets the 
     *                    <i>TotalMemoryInKilobytes</i> parameter to a nonzero value.
     * 
     * If the function fails, it returns <b>FALSE</b> and does not modify the 
     *                    <i>TotalMemoryInKilobytes</i> parameter. To get extended error information, use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. Common errors are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>TotalMemoryInKilobytes</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The System Management BIOS (SMBIOS) data is malformed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getphysicallyinstalledsystemmemory
     * @since windows6.0.6000
     */
    static GetPhysicallyInstalledSystemMemory(TotalMemoryInKilobytes) {
        TotalMemoryInKilobytesMarshal := TotalMemoryInKilobytes is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetPhysicallyInstalledSystemMemory", TotalMemoryInKilobytesMarshal, TotalMemoryInKilobytes, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} NameType 
     * @param {Integer} Flags 
     * @param {PWSTR} lpBuffer 
     * @returns {BOOL} 
     */
    static SetComputerNameEx2W(NameType, Flags, lpBuffer) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        result := DllCall("KERNEL32.dll\SetComputerNameEx2W", "int", NameType, "uint", Flags, "ptr", lpBuffer, "int")
        return result
    }

    /**
     * Enables or disables periodic time adjustments to the system's time-of-day clock. When enabled, such time adjustments can be used to synchronize the time of day with some other source of time information.
     * @param {Integer} dwTimeAdjustment This value represents the number of 100-nanosecond units added to the system time-of-day  for each <i>lpTimeIncrement</i> period of time that actually passes. Call <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemtimeadjustment">GetSystemTimeAdjustment</a> to obtain the <i>lpTimeIncrement</i> value. See remarks.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">Currently, Windows Vista and Windows 7 machines will lose any time adjustments set less than 16. 
     * 
     * </div>
     * <div> </div>
     * @param {BOOL} bTimeAdjustmentDisabled The time adjustment mode that the system is to use. Periodic system time adjustments can be disabled or enabled. 
     * 
     * 
     * 
     * 
     * A value of <b>TRUE</b> specifies that periodic time adjustment is to be disabled. When disabled, the value of <i>dwTimeAdjustment</i> is ignored, and the system may adjust the time of day using its own internal time synchronization mechanisms. These internal time synchronization mechanisms may cause the time-of-day clock to change during the normal course of the system operation, which can include noticeable jumps in time as deemed necessary by the system.
     * 
     * A value of <b>FALSE</b> specifies that periodic time adjustment is to be enabled, and will be used to adjust the time-of-day clock. The system will not interfere with the time adjustment scheme, and will not attempt to synchronize time of day on its own.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. One way the function can fail is if the caller does not possess the SE_SYSTEMTIME_NAME privilege.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-setsystemtimeadjustment
     * @since windows5.0
     */
    static SetSystemTimeAdjustment(dwTimeAdjustment, bTimeAdjustmentDisabled) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetSystemTimeAdjustment", "uint", dwTimeAdjustment, "int", bTimeAdjustmentDisabled, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables or disables periodic time adjustments to the system's time-of-day clock. When enabled, such time adjustments can be used to synchronize the time of day with some other source of time information.
     * @param {Integer} dwTimeAdjustment Supplies the adjusted clock update frequency.
     * @param {BOOL} bTimeAdjustmentDisabled Supplies a flag which specifies the time adjustment mode that the system is to use.
     * 
     * A value of <b>TRUE</b> indicates that the system should synchronize time-of-day using its own internal mechanisms. In this case, the value of <i>dwTimeAdjustment</i> is ignored.
     * 
     * A value of <b>FALSE</b> indicates that the application is in control, and that the specified value of <i>dwTimeAdjustment</i> is to be added to the time-of-day clock at each clock update interrupt.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. One way the function can fail is if the caller does not possess the SE_SYSTEMTIME_NAME privilege.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-setsystemtimeadjustmentprecise
     * @since windows10.0.10240
     */
    static SetSystemTimeAdjustmentPrecise(dwTimeAdjustment, bTimeAdjustmentDisabled) {
        A_LastError := 0

        result := DllCall("api-ms-win-core-sysinfo-l1-2-4.dll\SetSystemTimeAdjustmentPrecise", "uint", dwTimeAdjustment, "int", bTimeAdjustmentDisabled, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the cycle time each processor in the specified processor group spent executing deferred procedure calls (DPCs) and interrupt service routines (ISRs) since the processor became active.
     * @param {Integer} Group The number of the processor group for which to retrieve the cycle time.
     * @param {Pointer} Buffer A pointer to a buffer to receive a SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION structure for each processor in the group. On output, the DWORD64 <b>CycleTime</b> member of this structure is set to the cycle time for one processor.
     * @param {Pointer<Integer>} ReturnedLength The size of the buffer, in bytes. When the function returns, this parameter contains the number of bytes written to <i>Buffer</i>. If the buffer is too small for the data, the function fails with ERROR_INSUFFICIENT_BUFFER and sets the <i>ReturnedLength</i> parameter to the required buffer size.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, use <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. 
     * 
     * If the error value is ERROR_INSUFFICIENT_BUFFER, the <i>ReturnedLength</i> parameter contains the required buffer size.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getprocessorsystemcycletime
     * @since windows6.1
     */
    static GetProcessorSystemCycleTime(Group, Buffer, ReturnedLength) {
        ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessorSystemCycleTime", "ushort", Group, "ptr", Buffer, ReturnedLengthMarshal, ReturnedLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbEnabled 
     * @returns {BOOL} 
     */
    static GetOsManufacturingMode(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "int*" : "ptr"

        result := DllCall("api-ms-win-core-sysinfo-l1-2-3.dll\GetOsManufacturingMode", pbEnabledMarshal, pbEnabled, "int")
        return result
    }

    /**
     * Retrieves the best estimate of the diagonal size of the built-in screen, in inches.
     * @returns {Float} The best estimate of the diagonal size of the built-in screen, in inches.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getintegrateddisplaysize
     * @since windows10.0.10240
     */
    static GetIntegratedDisplaySize() {
        result := DllCall("api-ms-win-core-sysinfo-l1-2-3.dll\GetIntegratedDisplaySize", "double*", &sizeInInches := 0, "int")
        if(result != 0)
            throw OSError(result)

        return sizeInInches
    }

    /**
     * Sets a new NetBIOS name for the local computer. The name is stored in the registry and the name change takes effect the next time the user restarts the computer.
     * @param {PSTR} lpComputerName The computer name that will take effect the next time the computer is started. The name must not be longer than MAX_COMPUTERNAME_LENGTH characters. 
     * 
     * 
     * 
     * 
     * The standard character set includes letters, numbers, and the following symbols: ! @ # $ % ^ &amp; ' ) ( . - _ { } ~ . If this parameter contains one or more characters that are outside the standard character set, 
     * <b>SetComputerName</b> returns ERROR_INVALID_PARAMETER.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-setcomputernamea
     * @since windows5.0
     */
    static SetComputerNameA(lpComputerName) {
        lpComputerName := lpComputerName is String ? StrPtr(lpComputerName) : lpComputerName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetComputerNameA", "ptr", lpComputerName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets a new NetBIOS name for the local computer. The name is stored in the registry and the name change takes effect the next time the user restarts the computer.
     * @param {PWSTR} lpComputerName The computer name that will take effect the next time the computer is started. The name must not be longer than MAX_COMPUTERNAME_LENGTH characters. 
     * 
     * 
     * 
     * 
     * The standard character set includes letters, numbers, and the following symbols: ! @ # $ % ^ &amp; ' ) ( . - _ { } ~ . If this parameter contains one or more characters that are outside the standard character set, 
     * <b>SetComputerName</b> returns ERROR_INVALID_PARAMETER.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-setcomputernamew
     * @since windows5.0
     */
    static SetComputerNameW(lpComputerName) {
        lpComputerName := lpComputerName is String ? StrPtr(lpComputerName) : lpComputerName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetComputerNameW", "ptr", lpComputerName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets a new NetBIOS or DNS name for the local computer.
     * @param {Integer} NameType 
     * @param {PSTR} lpBuffer The new name. The name cannot include control characters, leading or trailing spaces, or any of the following characters: " / \ [ ] : | &lt; &gt; + = ; , ?
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-setcomputernameexa
     * @since windows5.0
     */
    static SetComputerNameExA(NameType, lpBuffer) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetComputerNameExA", "int", NameType, "ptr", lpBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static GetDeveloperDriveEnablementState() {
        result := DllCall("api-ms-win-core-sysinfo-l1-2-6.dll\GetDeveloperDriveEnablementState", "int")
        return result
    }

    /**
     * Allows an application to query the available CPU Sets on the system, and their current state.
     * @param {Pointer} Information A pointer to a [**SYSTEM\_CPU\_SET\_INFORMATION**](/windows/desktop/api/winnt/ns-winnt-system_cpu_set_information) structure that receives the CPU Set data. Pass NULL with a buffer length of 0 to determine the required buffer size.
     * @param {Integer} BufferLength The length, in bytes, of the output buffer passed as the Information argument.
     * @param {Pointer<Integer>} ReturnedLength The length, in bytes, of the valid data in the output buffer if the buffer is large enough, or the required size of the output buffer. If no CPU Sets exist, this value will be 0.
     * @param {HANDLE} Process An optional handle to a process. This process is used to determine the value of the **AllocatedToTargetProcess** flag in the SYSTEM\_CPU\_SET\_INFORMATION structure. If a CPU Set is allocated to the specified process, the flag is set. Otherwise, it is clear. This handle must have the PROCESS\_QUERY\_LIMITED\_INFORMATION access right. The value returned by [**GetCurrentProcess**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess) may also be specified here.
     * @returns {BOOL} If the API succeeds it returns TRUE. If it fails, the error reason is available through **GetLastError**. If the Information buffer was NULL or not large enough, the error code ERROR\_INSUFFICIENT\_BUFFER is returned. This API cannot fail when passed valid parameters and a buffer that is large enough to hold all of the return data.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getsystemcpusetinformation
     */
    static GetSystemCpuSetInformation(Information, BufferLength, ReturnedLength, Process) {
        static Flags := 0 ;Reserved parameters must always be NULL

        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetSystemCpuSetInformation", "ptr", Information, "uint", BufferLength, ReturnedLengthMarshal, ReturnedLength, "ptr", Process, "uint", Flags, "int")
        return result
    }

    /**
     * Retrieves the path of the system directory used by WOW64.
     * @param {PSTR} lpBuffer A pointer to the buffer to receive the path. This path does not end with a backslash.
     * @param {Integer} uSize The maximum size of the buffer, in <b>TCHARs</b>.
     * @returns {Integer} If the function succeeds, the return value is the length, in <b>TCHARs</b>, of the string copied to the buffer, not including the terminating null character. If the length is greater than the size of the buffer, the return value is the size of the buffer required to hold the path.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * On 32-bit Windows, the function always fails, and the extended error is set to ERROR_CALL_NOT_IMPLEMENTED.
     * @see https://docs.microsoft.com/windows/win32/api//wow64apiset/nf-wow64apiset-getsystemwow64directorya
     * @since windows5.1.2600
     */
    static GetSystemWow64DirectoryA(lpBuffer, uSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetSystemWow64DirectoryA", "ptr", lpBuffer, "uint", uSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the path of the system directory used by WOW64.
     * @param {PWSTR} lpBuffer A pointer to the buffer to receive the path. This path does not end with a backslash.
     * @param {Integer} uSize The maximum size of the buffer, in <b>TCHARs</b>.
     * @returns {Integer} If the function succeeds, the return value is the length, in <b>TCHARs</b>, of the string copied to the buffer, not including the terminating null character. If the length is greater than the size of the buffer, the return value is the size of the buffer required to hold the path.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * On 32-bit Windows, the function always fails, and the extended error is set to ERROR_CALL_NOT_IMPLEMENTED.
     * @see https://docs.microsoft.com/windows/win32/api//wow64apiset/nf-wow64apiset-getsystemwow64directoryw
     * @since windows5.1.2600
     */
    static GetSystemWow64DirectoryW(lpBuffer, uSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetSystemWow64DirectoryW", "ptr", lpBuffer, "uint", uSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the path of the system directory used by WOW64, using the specified image file machine type.
     * @param {PSTR} lpBuffer A pointer to the buffer to receive the path. This path does not end with a backslash.
     * @param {Integer} uSize The maximum size of the buffer, in <b>TCHARs</b>.
     * @param {Integer} ImageFileMachineType An <a href="https://docs.microsoft.com/windows/desktop/SysInfo/image-file-machine-constants">IMAGE_FILE_MACHINE_*</a> value that specifies the machine to test.
     * @returns {Integer} If the function succeeds, the return value is the length, in <b>TCHARs</b>, of the string copied to the buffer, not including the terminating null character. If the length is greater than the size of the buffer, the return value is the size of the buffer required to hold the path.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wow64apiset/nf-wow64apiset-getsystemwow64directory2a
     * @since windows10.0.10586
     */
    static GetSystemWow64Directory2A(lpBuffer, uSize, ImageFileMachineType) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("api-ms-win-core-wow64-l1-1-1.dll\GetSystemWow64Directory2A", "ptr", lpBuffer, "uint", uSize, "ushort", ImageFileMachineType, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the path of the system directory used by WOW64, using the specified image file machine type.
     * @param {PWSTR} lpBuffer A pointer to the buffer to receive the path. This path does not end with a backslash.
     * @param {Integer} uSize The maximum size of the buffer, in <b>TCHARs</b>.
     * @param {Integer} ImageFileMachineType An <a href="https://docs.microsoft.com/windows/desktop/SysInfo/image-file-machine-constants">IMAGE_FILE_MACHINE_*</a> value that specifies the machine to test.
     * @returns {Integer} If the function succeeds, the return value is the length, in <b>TCHARs</b>, of the string copied to the buffer, not including the terminating null character. If the length is greater than the size of the buffer, the return value is the size of the buffer required to hold the path.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wow64apiset/nf-wow64apiset-getsystemwow64directory2w
     * @since windows10.0.10586
     */
    static GetSystemWow64Directory2W(lpBuffer, uSize, ImageFileMachineType) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("api-ms-win-core-wow64-l1-1-1.dll\GetSystemWow64Directory2W", "ptr", lpBuffer, "uint", uSize, "ushort", ImageFileMachineType, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines which architectures are supported (under WOW64) on the given machine architecture.
     * @param {Integer} WowGuestMachine An <a href="https://docs.microsoft.com/windows/desktop/SysInfo/image-file-machine-constants">IMAGE_FILE_MACHINE_*</a> value that specifies the machine to test.
     * @returns {BOOL} On success, returns a pointer to a boolean: <b>true</b> if the machine supports WOW64, or <b>false</b> if it does not.
     * @see https://docs.microsoft.com/windows/win32/api//wow64apiset/nf-wow64apiset-iswow64guestmachinesupported
     * @since windows10.0.16299
     */
    static IsWow64GuestMachineSupported(WowGuestMachine) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\IsWow64GuestMachineSupported", "ushort", WowGuestMachine, "int*", &MachineIsSupported := 0, "int")
        if(A_LastError)
            throw OSError()

        if(result != 0)
            throw OSError(result)

        return MachineIsSupported
    }

    /**
     * 
     * @param {Integer} OSMajorVersion 
     * @param {Integer} OSMinorVersion 
     * @param {Integer} SpMajorVersion 
     * @param {Integer} SpMinorVersion 
     * @param {Pointer<Integer>} ReturnedProductType 
     * @returns {BOOLEAN} 
     */
    static RtlGetProductInfo(OSMajorVersion, OSMinorVersion, SpMajorVersion, SpMinorVersion, ReturnedProductType) {
        ReturnedProductTypeMarshal := ReturnedProductType is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlGetProductInfo", "uint", OSMajorVersion, "uint", OSMinorVersion, "uint", SpMajorVersion, "uint", SpMinorVersion, ReturnedProductTypeMarshal, ReturnedProductType, "char")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static RtlOsDeploymentState(Flags) {
        result := DllCall("ntdll.dll\RtlOsDeploymentState", "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Integer} DataId 
     * @param {Pointer<Void>} Buffer 
     * @param {Integer} Size 
     * @returns {Integer} 
     */
    static RtlGetSystemGlobalData(DataId, Buffer, Size) {
        BufferMarshal := Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdllk.dll\RtlGetSystemGlobalData", "int", DataId, BufferMarshal, Buffer, "uint", Size, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pullUAPInfo 
     * @param {Pointer<Integer>} pulDeviceFamily 
     * @param {Pointer<Integer>} pulDeviceForm 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/DevNotes/rtlgetdevicefamilyinfoenum
     */
    static RtlGetDeviceFamilyInfoEnum(pullUAPInfo, pulDeviceFamily, pulDeviceForm) {
        pullUAPInfoMarshal := pullUAPInfo is VarRef ? "uint*" : "ptr"
        pulDeviceFamilyMarshal := pulDeviceFamily is VarRef ? "uint*" : "ptr"
        pulDeviceFormMarshal := pulDeviceForm is VarRef ? "uint*" : "ptr"

        DllCall("ntdll.dll\RtlGetDeviceFamilyInfoEnum", pullUAPInfoMarshal, pullUAPInfo, pulDeviceFamilyMarshal, pulDeviceFamily, pulDeviceFormMarshal, pulDeviceForm)
    }

    /**
     * 
     * @param {Pointer<Integer>} pulDeviceFamilyBufferSize 
     * @param {Pointer<Integer>} pulDeviceFormBufferSize 
     * @param {Pointer} DeviceFamily 
     * @param {Pointer} DeviceForm 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlconvertdevicefamilyinfotostring
     */
    static RtlConvertDeviceFamilyInfoToString(pulDeviceFamilyBufferSize, pulDeviceFormBufferSize, DeviceFamily, DeviceForm) {
        pulDeviceFamilyBufferSizeMarshal := pulDeviceFamilyBufferSize is VarRef ? "uint*" : "ptr"
        pulDeviceFormBufferSizeMarshal := pulDeviceFormBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlConvertDeviceFamilyInfoToString", pulDeviceFamilyBufferSizeMarshal, pulDeviceFamilyBufferSize, pulDeviceFormBufferSizeMarshal, pulDeviceFormBufferSize, "ptr", DeviceFamily, "ptr", DeviceForm, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<OSVERSIONINFOEXW>} VersionInfo 
     * @param {Integer} TypeMask 
     * @param {Integer} ConditionMask 
     * @returns {Integer} 
     */
    static RtlSwitchedVVI(VersionInfo, TypeMask, ConditionMask) {
        result := DllCall("ntdll.dll\RtlSwitchedVVI", "ptr", VersionInfo, "uint", TypeMask, "uint", ConditionMask, "uint")
        return result
    }

    /**
     * Retrieves information about the system's current usage of both physical and virtual memory.
     * @remarks
     * 
     * On computers with more than 4 GB of memory, the 
     * <b>GlobalMemoryStatus</b> function can return incorrect information, reporting a value of –1 to indicate an overflow. For this reason, applications should use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-globalmemorystatusex">GlobalMemoryStatusEx</a> function instead.
     * 
     * On Intel x86 computers with more than 2 GB and less than 4 GB of memory, the 
     * <b>GlobalMemoryStatus</b> function will always return 2 GB in the <b>dwTotalPhys</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-memorystatus">MEMORYSTATUS</a> structure. Similarly, if the total available memory is between 2 and 4 GB, the <b>dwAvailPhys</b> member of the 
     * <b>MEMORYSTATUS</b> structure will be rounded down to 2 GB. If the executable is linked using the <b>/LARGEADDRESSAWARE</b> linker option, then the 
     * <b>GlobalMemoryStatus</b> function will return the correct amount of physical memory in both members.
     * 
     * The information returned by the 
     * <b>GlobalMemoryStatus</b> function is volatile. There is no guarantee that two sequential calls to this function will return the same information.
     * 
     * 
     * @param {Pointer<MEMORYSTATUS>} lpBuffer A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-memorystatus">MEMORYSTATUS</a> structure. The 
     * <b>GlobalMemoryStatus</b> function stores information about current memory availability into this structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globalmemorystatus
     * @since windows5.1.2600
     */
    static GlobalMemoryStatus(lpBuffer) {
        DllCall("KERNEL32.dll\GlobalMemoryStatus", "ptr", lpBuffer)
    }

    /**
     * Gets the data execution prevention (DEP) policy setting for the system.
     * @returns {Integer} This function returns a value of type <b>DEP_SYSTEM_POLICY_TYPE</b>, which can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AlwaysOff</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DEP is disabled for all parts of the system, regardless of hardware support for DEP. The processor runs in PAE mode with 32-bit versions of Windows unless PAE is disabled in the boot configuration data. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AlwaysOn</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DEP is enabled for all parts of the system. All processes always run with DEP enabled. DEP cannot be explicitly disabled for selected applications. System compatibility fixes are ignored. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OptIn</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * On systems with processors that are capable of hardware-enforced DEP, DEP is automatically enabled only for operating system components. This is the default setting for client versions of Windows. DEP can be explicitly enabled for selected applications or the current process. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OptOut</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DEP is automatically enabled for operating system components and all processes. This is the default setting for Windows Server versions. DEP can be explicitly disabled for selected applications or the current process. System compatibility fixes for DEP are in effect. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getsystemdeppolicy
     * @since windows6.0.6000
     */
    static GetSystemDEPPolicy() {
        result := DllCall("KERNEL32.dll\GetSystemDEPPolicy", "int")
        return result
    }

    /**
     * Retrieves the firmware type of the local computer.
     * @param {Pointer<Integer>} FirmwareType A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-firmware_type">FIRMWARE_TYPE</a> enumeration.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getfirmwaretype
     * @since windows8.0
     */
    static GetFirmwareType(FirmwareType) {
        FirmwareTypeMarshal := FirmwareType is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetFirmwareType", FirmwareTypeMarshal, FirmwareType, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Compares a set of operating system version requirements to the corresponding values for the currently running version of the system.
     * @param {Pointer<OSVERSIONINFOEXA>} lpVersionInformation A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-osversioninfoexa">OSVERSIONINFOEX</a> structure containing the operating system version requirements to compare. The <i>dwTypeMask</i> parameter indicates the members of this structure that contain information to compare. 
     * 
     * 
     * 
     * 
     * You must set the <b>dwOSVersionInfoSize</b> member of this structure to <c>sizeof(OSVERSIONINFOEX)</c>. You must also specify valid data for the members indicated by <i>dwTypeMask</i>. The function ignores structure members for which the corresponding <i>dwTypeMask</i> bit is not set.
     * @param {Integer} dwTypeMask A mask that indicates the members of the
     * @param {Integer} dwlConditionMask The type of comparison to be used for each <b>lpVersionInfo</b> member being compared. To build this value, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-versetconditionmask">VerSetConditionMask</a> function or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-ver_set_condition">VER_SET_CONDITION</a> macro once for each 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-osversioninfoexa">OSVERSIONINFOEX</a> member being compared.
     * @returns {BOOL} If the currently running operating system satisfies the specified requirements, the return value is a nonzero value.
     * 
     * If the current system does not satisfy the requirements, the return value is zero and 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_OLD_WIN_VERSION.
     * 
     * If the function fails, the return value is zero and <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns an error code other than ERROR_OLD_WIN_VERSION.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-verifyversioninfoa
     * @since windows5.0
     */
    static VerifyVersionInfoA(lpVersionInformation, dwTypeMask, dwlConditionMask) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VerifyVersionInfoA", "ptr", lpVersionInformation, "uint", dwTypeMask, "uint", dwlConditionMask, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Compares a set of operating system version requirements to the corresponding values for the currently running version of the system.
     * @param {Pointer<OSVERSIONINFOEXW>} lpVersionInformation A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-osversioninfoexa">OSVERSIONINFOEX</a> structure containing the operating system version requirements to compare. The <i>dwTypeMask</i> parameter indicates the members of this structure that contain information to compare. 
     * 
     * 
     * 
     * 
     * You must set the <b>dwOSVersionInfoSize</b> member of this structure to <c>sizeof(OSVERSIONINFOEX)</c>. You must also specify valid data for the members indicated by <i>dwTypeMask</i>. The function ignores structure members for which the corresponding <i>dwTypeMask</i> bit is not set.
     * @param {Integer} dwTypeMask A mask that indicates the members of the
     * @param {Integer} dwlConditionMask The type of comparison to be used for each <b>lpVersionInfo</b> member being compared. To build this value, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-versetconditionmask">VerSetConditionMask</a> function or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-ver_set_condition">VER_SET_CONDITION</a> macro once for each 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-osversioninfoexa">OSVERSIONINFOEX</a> member being compared.
     * @returns {BOOL} If the currently running operating system satisfies the specified requirements, the return value is a nonzero value.
     * 
     * If the current system does not satisfy the requirements, the return value is zero and 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_OLD_WIN_VERSION.
     * 
     * If the function fails, the return value is zero and <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns an error code other than ERROR_OLD_WIN_VERSION.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-verifyversioninfow
     * @since windows5.0
     */
    static VerifyVersionInfoW(lpVersionInformation, dwTypeMask, dwlConditionMask) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\VerifyVersionInfoW", "ptr", lpVersionInformation, "uint", dwTypeMask, "uint", dwlConditionMask, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
