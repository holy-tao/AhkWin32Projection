#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MFCLOCK_PROPERTIES.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides timing information from a clock in Microsoft Media Foundation.
 * @remarks
 * The <b>IMFClock</b> interface applies to any kind of clock. The presentation clock exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationclock">IMFPresentationClock</a> interface in addition to <b>IMFClock</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfclock
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFClock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFClock
     * @type {Guid}
     */
    static IID => Guid("{2eb1e945-18b8-4139-9b1a-d5d584818530}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClockCharacteristics", "GetCorrelatedTime", "GetContinuityKey", "GetState", "GetProperties"]

    /**
     * Retrieves the characteristics of the clock.
     * @returns {Integer} Receives a bitwise OR of values from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfclock_characteristics_flags">MFCLOCK_CHARACTERISTICS_FLAGS</a> enumeration indicating the characteristics of the clock.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfclock-getclockcharacteristics
     */
    GetClockCharacteristics() {
        result := ComCall(3, this, "uint*", &pdwCharacteristics := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCharacteristics
    }

    /**
     * Retrieves the last clock time that was correlated with system time.
     * @remarks
     * At some fixed interval, a clock correlates its internal clock ticks with the system time. (The system time is the time returned by the high-resolution performance counter.) This method returns:
     * 
     * <ul>
     * <li>The most recent clock time that was correlated with system time.
     *           </li>
     * <li>The system time when the correlation was performed.
     *           </li>
     * </ul>
     * The clock time is returned in the <i>pllClockTime</i> parameter and is expressed in units of the clock's frequency. If the clock's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclock-getclockcharacteristics">IMFClock::GetClockCharacteristics</a> method returns the <b>MFCLOCK_CHARACTERISTICS_FLAG_FREQUENCY_10MHZ</b> flag, the clock's frequency is 10 MHz (each clock tick is 100 nanoseconds). Otherwise, you can get the clock's frequency by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclock-getproperties">IMFClock::GetProperties</a>. The frequency is given in the <b>qwClockFrequency</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mfclock_properties">MFCLOCK_PROPERTIES</a> structure returned by that method.
     *       
     * 
     * The system time is returned in the <i>phnsSystemTime</i> parameter, and is always expressed in 100-nanosecond units.
     *       
     * 
     * To find out how often the clock correlates its clock time with the system time, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclock-getproperties">GetProperties</a>. The correlation interval is given in the <b>qwCorrelationRate</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mfclock_properties">MFCLOCK_PROPERTIES</a> structure. If <b>qwCorrelationRate</b> is zero, it means the clock performs the correlation whenever <b>GetCorrelatedTime</b> is called. Otherwise, you can calculate the current clock time by extrapolating from the last correlated time.
     *       
     * 
     * Some clocks support rate changes through the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfratecontrol">IMFRateControl</a> interface. If so, the clock time advances at a speed of frequency × current rate. If a clock does not expose the <b>IMFRateControl</b> interface, the rate is always 1.0.
     *       
     * 
     * For the presentation clock, the clock time is the presentation time, and is always relative to the starting time specified in <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-start">IMFPresentationClock::Start</a>. You can also get the presentation time by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-gettime">IMFPresentationClock::GetTime</a>.
     * @param {Integer} dwReserved Reserved, must be zero.
     * @param {Pointer<Integer>} pllClockTime Receives the last known clock time, in units of the clock's frequency.
     * @param {Pointer<Integer>} phnsSystemTime Receives the system time that corresponds to the clock time returned in <i>pllClockTime</i>, in 100-nanosecond units.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_CLOCK_NO_TIME_SOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The clock does not have a time source.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfclock-getcorrelatedtime
     */
    GetCorrelatedTime(dwReserved, pllClockTime, phnsSystemTime) {
        pllClockTimeMarshal := pllClockTime is VarRef ? "int64*" : "ptr"
        phnsSystemTimeMarshal := phnsSystemTime is VarRef ? "int64*" : "ptr"

        result := ComCall(4, this, "uint", dwReserved, pllClockTimeMarshal, pllClockTime, phnsSystemTimeMarshal, phnsSystemTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the clock's continuity key. (Not supported.).
     * @remarks
     * Continuity keys are currently not supported in Media Foundation. Clocks must return the value zero in the <i>pdwContinuityKey</i> parameter.
     * @returns {Integer} Receives the continuity key.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfclock-getcontinuitykey
     */
    GetContinuityKey() {
        result := ComCall(5, this, "uint*", &pdwContinuityKey := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwContinuityKey
    }

    /**
     * Retrieves the current state of the clock.
     * @param {Integer} dwReserved Reserved, must be zero.
     * @returns {Integer} Receives the clock state, as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfclock_state">MFCLOCK_STATE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfclock-getstate
     */
    GetState(dwReserved) {
        result := ComCall(6, this, "uint", dwReserved, "int*", &peClockState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return peClockState
    }

    /**
     * Retrieves the properties of the clock.
     * @returns {MFCLOCK_PROPERTIES} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mfclock_properties">MFCLOCK_PROPERTIES</a> structure that receives the properties.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfclock-getproperties
     */
    GetProperties() {
        pClockProperties := MFCLOCK_PROPERTIES()
        result := ComCall(7, this, "ptr", pClockProperties, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pClockProperties
    }
}
