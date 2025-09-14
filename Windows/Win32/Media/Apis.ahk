#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media
 * @version v4.0.30319
 */
class Media {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static TIMERR_NOERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TIMERR_NOCANDO => 97

    /**
     * @type {Integer (UInt32)}
     */
    static TIMERR_STRUCT => 129

    /**
     * @type {Integer (UInt32)}
     */
    static MAXPNAMELEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAXERRORLENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MICROSOFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIDI_MAPPER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WAVE_MAPPER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SNDBLST_MIDIOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SNDBLST_MIDIIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SNDBLST_SYNTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SNDBLST_WAVEOUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SNDBLST_WAVEIN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADLIB => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MPU401_MIDIOUT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MPU401_MIDIIN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PC_JOYSTICK => 12

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_MS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_SAMPLES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_BYTES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_SMPTE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_MIDI => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_TICKS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MM_JOY1MOVE => 928

    /**
     * @type {Integer (UInt32)}
     */
    static MM_JOY2MOVE => 929

    /**
     * @type {Integer (UInt32)}
     */
    static MM_JOY1ZMOVE => 930

    /**
     * @type {Integer (UInt32)}
     */
    static MM_JOY2ZMOVE => 931

    /**
     * @type {Integer (UInt32)}
     */
    static MM_JOY1BUTTONDOWN => 949

    /**
     * @type {Integer (UInt32)}
     */
    static MM_JOY2BUTTONDOWN => 950

    /**
     * @type {Integer (UInt32)}
     */
    static MM_JOY1BUTTONUP => 951

    /**
     * @type {Integer (UInt32)}
     */
    static MM_JOY2BUTTONUP => 952

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MCINOTIFY => 953

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WOM_OPEN => 955

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WOM_CLOSE => 956

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WOM_DONE => 957

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WIM_OPEN => 958

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WIM_CLOSE => 959

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WIM_DATA => 960

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIM_OPEN => 961

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIM_CLOSE => 962

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIM_DATA => 963

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIM_LONGDATA => 964

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIM_ERROR => 965

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIM_LONGERROR => 966

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOM_OPEN => 967

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOM_CLOSE => 968

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOM_DONE => 969

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DRVM_OPEN => 976

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DRVM_CLOSE => 977

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DRVM_DATA => 978

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DRVM_ERROR => 979

    /**
     * @type {Integer (UInt32)}
     */
    static MM_STREAM_OPEN => 980

    /**
     * @type {Integer (UInt32)}
     */
    static MM_STREAM_CLOSE => 981

    /**
     * @type {Integer (UInt32)}
     */
    static MM_STREAM_DONE => 982

    /**
     * @type {Integer (UInt32)}
     */
    static MM_STREAM_ERROR => 983

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOM_POSITIONCB => 970

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MCISIGNAL => 971

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIM_MOREDATA => 972

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIXM_LINE_CHANGE => 976

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIXM_CONTROL_CHANGE => 977

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WAVERR_BASE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MIDIERR_BASE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TIMERR_BASE => 96

    /**
     * @type {Integer (UInt32)}
     */
    static JOYERR_BASE => 160

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_BASE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERR_BASE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_STRING_OFFSET => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_VD_OFFSET => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_CD_OFFSET => 1088

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_WAVE_OFFSET => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEQ_OFFSET => 1216

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_NOERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_BADDEVICEID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_NOTENABLED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_ALLOCATED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_INVALHANDLE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_NODRIVER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_NOMEM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_NOTSUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_BADERRNUM => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_INVALFLAG => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_INVALPARAM => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_HANDLEBUSY => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_INVALIDALIAS => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_BADDB => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_KEYNOTFOUND => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_READERROR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_WRITEERROR => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_DELETEERROR => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_VALNOTFOUND => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_NODRIVERCB => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_MOREDATA => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MMSYSERR_LASTERROR => 21

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_ONESHOT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_PERIODIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_CALLBACK_FUNCTION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_CALLBACK_EVENT_SET => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_CALLBACK_EVENT_PULSE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_KILL_SYNCHRONOUS => 256
;@endregion Constants

;@region Methods
    /**
     * The timeGetSystemTime function retrieves the system time, in milliseconds.
     * @remarks
     * The system time is returned in the <b>ms</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757347(v=vs.85)">MMTIME</a> structure.
     * @param {Pointer<MMTIME>} pmmt Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757347(v=vs.85)">MMTIME</a> structure.
     * @param {Integer} cbmmt Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd757347(v=vs.85)">MMTIME</a> structure.
     * @returns {Integer} If successful, returns <b>TIMERR_NOERROR</b>. Otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/timeapi/nf-timeapi-timegetsystemtime
     * @since windows5.0
     */
    static timeGetSystemTime(pmmt, cbmmt) {
        result := DllCall("WINMM.dll\timeGetSystemTime", "ptr", pmmt, "uint", cbmmt, "uint")
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
    static timeGetTime() {
        result := DllCall("WINMM.dll\timeGetTime", "uint")
        return result
    }

    /**
     * The timeGetDevCaps function queries the timer device to determine its resolution.
     * @param {Pointer<TIMECAPS>} ptc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/ns-timeapi-timecaps">TIMECAPS</a> structure. This structure is filled with information about the resolution of the timer device.
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
    static timeGetDevCaps(ptc, cbtc) {
        result := DllCall("WINMM.dll\timeGetDevCaps", "ptr", ptc, "uint", cbtc, "uint")
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
    static timeBeginPeriod(uPeriod) {
        result := DllCall("WINMM.dll\timeBeginPeriod", "uint", uPeriod, "uint")
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
    static timeEndPeriod(uPeriod) {
        result := DllCall("WINMM.dll\timeEndPeriod", "uint", uPeriod, "uint")
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
    static timeSetEvent(uDelay, uResolution, fptc, dwUser, fuEvent) {
        result := DllCall("WINMM.dll\timeSetEvent", "uint", uDelay, "uint", uResolution, "ptr", fptc, "ptr", dwUser, "uint", fuEvent, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} uTimerID 
     * @returns {Integer} 
     */
    static timeKillEvent(uTimerID) {
        result := DllCall("WINMM.dll\timeKillEvent", "uint", uTimerID, "uint")
        return result
    }

;@endregion Methods
}
