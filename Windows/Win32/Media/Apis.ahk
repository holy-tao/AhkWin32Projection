#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit


/**
 * @namespace Windows.Win32.Media
 */

;@region Functions
/**
 * The timeGetSystemTime function retrieves the system time, in milliseconds.
 * @remarks
 * The system time is returned in the <b>ms</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757347(v=vs.85)">MMTIME</a> structure.
 * @param {Integer} pmmt Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757347(v=vs.85)">MMTIME</a> structure.
 * @param {Integer} cbmmt Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd757347(v=vs.85)">MMTIME</a> structure.
 * @returns {Integer} If successful, returns <b>TIMERR_NOERROR</b>. Otherwise, returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/timeapi/nf-timeapi-timegetsystemtime
 * @since windows5.0
 */
export timeGetSystemTime(pmmt, cbmmt) {
    result := DllCall("WINMM.dll\timeGetSystemTime", "ptr", pmmt, "uint", cbmmt, UInt32)
    return result
}

/**
 * The timeGetTime function retrieves the system time, in milliseconds. The system time is the time elapsed since Windows was started.
 * @remarks
 * The only difference between this function and the <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timegetsystemtime">timeGetSystemTime</a> function is that <b>timeGetSystemTime</b> uses the <a href="https://docs.microsoft.com/previous-versions/dd757347(v=vs.85)">MMTIME</a> structure to return the system time. The <b>timeGetTime</b> function has less overhead than <b>timeGetSystemTime</b>.
 * 
 * Note that the value returned by the <b>timeGetTime</b> function is a <b>DWORD</b> value. The return value wraps around to 0 every 2^32 milliseconds, which is about 49.71 days. This can cause problems in code that directly uses the <b>timeGetTime</b> return value in computations, particularly where the value is used to control code execution. You should always use the difference between two <b>timeGetTime</b> return values in computations.
 * 
 * The default precision of the <b>timeGetTime</b> function can be five milliseconds or more, depending on the machine. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timebeginperiod">timeBeginPeriod</a> and <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timeendperiod">timeEndPeriod</a> functions to increase the precision of <b>timeGetTime</b>. If you do so, the minimum difference between successive values returned by <b>timeGetTime</b> can be as large as the minimum period value set using <b>timeBeginPeriod</b> and <b>timeEndPeriod</b>. Use the <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a> and <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancefrequency">QueryPerformanceFrequency</a> functions to measure short time intervals at a high resolution.
 * @returns {Integer} Returns the system time, in milliseconds.
 * @see https://learn.microsoft.com/windows/win32/api/timeapi/nf-timeapi-timegettime
 * @since windows5.0
 */
export timeGetTime() {
    result := DllCall("WINMM.dll\timeGetTime", UInt32)
    return result
}

/**
 * The timeGetDevCaps function queries the timer device to determine its resolution.
 * @param {Integer} ptc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/ns-timeapi-timecaps">TIMECAPS</a> structure. This structure is filled with information about the resolution of the timer device.
 * @param {Integer} cbtc The size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/ns-timeapi-timecaps">TIMECAPS</a> structure.
 * @returns {Integer} Returns <b>MMSYSERR_NOERROR</b> if successful or an error code otherwise. Possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MMSYSERR_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * General error code.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TIMERR_NOCANDO</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>ptc</i> parameter is <b>NULL</b>, or the <i>cbtc</i> parameter is invalid, or some other error occurred.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/timeapi/nf-timeapi-timegetdevcaps
 * @since windows5.0
 */
export timeGetDevCaps(ptc, cbtc) {
    result := DllCall("WINMM.dll\timeGetDevCaps", "ptr", ptc, "uint", cbtc, UInt32)
    return result
}

/**
 * The timeBeginPeriod function requests a minimum resolution for periodic timers.
 * @remarks
 * Call this function immediately before using timer services, and call the <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timeendperiod">timeEndPeriod</a> function immediately after you are finished using the timer services.
 * 
 * You must match each call to <b>timeBeginPeriod</b> with a call to <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timeendperiod">timeEndPeriod</a>, specifying the same minimum resolution in both calls. An application can make multiple <b>timeBeginPeriod</b> calls as long as each call is matched with a call to <b>timeEndPeriod</b>.
 * 
 * Prior to Windows 10, version 2004, this function affects a global Windows setting. For all processes Windows uses the lowest value (that is, highest resolution) requested by any process. Starting with Windows 10, version 2004, this function no longer affects global timer resolution. For processes which call this function, Windows uses the lowest value (that is, highest resolution) requested by any process. For processes which have not called this function, Windows does not guarantee a higher resolution than the default system resolution.
 * 
 * Starting with Windows 11, if a window-owning process becomes fully occluded, minimized, or otherwise invisible or inaudible to the end user, Windows does not guarantee a higher resolution than the default system resolution. See <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setprocessinformation">SetProcessInformation</a> for more information on this behavior.
 * 
 * Setting a higher resolution can improve the accuracy of time-out intervals in wait functions. However, it can also reduce overall system performance, because the thread scheduler switches tasks more often. High resolutions can also prevent the CPU power management system from entering power-saving modes. Setting a higher resolution does not improve the accuracy of the high-resolution performance counter.
 * @param {Integer} uPeriod Minimum timer resolution, in milliseconds, for the application or device driver. A lower value specifies a higher (more accurate) resolution.
 * @returns {Integer} Returns <b>TIMERR_NOERROR</b> if successful or <b>TIMERR_NOCANDO</b> if the resolution specified in <i>uPeriod</i> is out of range.
 * @see https://learn.microsoft.com/windows/win32/api/timeapi/nf-timeapi-timebeginperiod
 * @since windows5.0
 */
export timeBeginPeriod(uPeriod) {
    result := DllCall("WINMM.dll\timeBeginPeriod", "uint", uPeriod, UInt32)
    return result
}

/**
 * The timeEndPeriod function clears a previously set minimum timer resolution.
 * @remarks
 * Call this function immediately after you are finished using timer services.
 * 
 * You must match each call to <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timebeginperiod">timeBeginPeriod</a> with a call to <b>timeEndPeriod</b>, specifying the same minimum resolution in both calls. An application can make multiple <b>timeBeginPeriod</b> calls as long as each call is matched with a call to <b>timeEndPeriod</b>.
 * @param {Integer} uPeriod Minimum timer resolution specified in the previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timebeginperiod">timeBeginPeriod</a> function.
 * @returns {Integer} Returns <b>TIMERR_NOERROR</b> if successful or <b>TIMERR_NOCANDO</b> if the resolution specified in uPeriod is out of range.
 * @see https://learn.microsoft.com/windows/win32/api/timeapi/nf-timeapi-timeendperiod
 * @since windows5.0
 */
export timeEndPeriod(uPeriod) {
    result := DllCall("WINMM.dll\timeEndPeriod", "uint", uPeriod, UInt32)
    return result
}

/**
 * 
 * @param {Integer} uDelay 
 * @param {Integer} uResolution 
 * @param {Pointer<LPTIMECALLBACK>} fptc 
 * @param {Pointer} dwUser 
 * @param {Integer} fuEvent 
 * @returns {Integer} 
 */
export timeSetEvent(uDelay, uResolution, fptc, dwUser, fuEvent) {
    result := DllCall("WINMM.dll\timeSetEvent", "uint", uDelay, "uint", uResolution, "ptr", fptc, "ptr", dwUser, "uint", fuEvent, UInt32)
    return result
}

/**
 * 
 * @param {Integer} uTimerID 
 * @returns {Integer} 
 */
export timeKillEvent(uTimerID) {
    result := DllCall("WINMM.dll\timeKillEvent", "uint", uTimerID, UInt32)
    return result
}

;@endregion Functions
