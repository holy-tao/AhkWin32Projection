#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MFCLOCK_PROPERTIES.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides timing information from a clock in Microsoft Media Foundation.
 * @remarks
 * 
 * The <b>IMFClock</b> interface applies to any kind of clock. The presentation clock exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationclock">IMFPresentationClock</a> interface in addition to <b>IMFClock</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfclock
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfclock-getclockcharacteristics
     */
    GetClockCharacteristics() {
        result := ComCall(3, this, "uint*", &pdwCharacteristics := 0, "HRESULT")
        return pdwCharacteristics
    }

    /**
     * Retrieves the last clock time that was correlated with system time.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfclock-getcorrelatedtime
     */
    GetCorrelatedTime(dwReserved, pllClockTime, phnsSystemTime) {
        pllClockTimeMarshal := pllClockTime is VarRef ? "int64*" : "ptr"
        phnsSystemTimeMarshal := phnsSystemTime is VarRef ? "int64*" : "ptr"

        result := ComCall(4, this, "uint", dwReserved, pllClockTimeMarshal, pllClockTime, phnsSystemTimeMarshal, phnsSystemTime, "HRESULT")
        return result
    }

    /**
     * Retrieves the clock's continuity key. (Not supported.).
     * @returns {Integer} Receives the continuity key.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfclock-getcontinuitykey
     */
    GetContinuityKey() {
        result := ComCall(5, this, "uint*", &pdwContinuityKey := 0, "HRESULT")
        return pdwContinuityKey
    }

    /**
     * Retrieves the current state of the clock.
     * @param {Integer} dwReserved Reserved, must be zero.
     * @returns {Integer} Receives the clock state, as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfclock_state">MFCLOCK_STATE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfclock-getstate
     */
    GetState(dwReserved) {
        result := ComCall(6, this, "uint", dwReserved, "int*", &peClockState := 0, "HRESULT")
        return peClockState
    }

    /**
     * Retrieves the properties of the clock.
     * @returns {MFCLOCK_PROPERTIES} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mfclock_properties">MFCLOCK_PROPERTIES</a> structure that receives the properties.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfclock-getproperties
     */
    GetProperties() {
        pClockProperties := MFCLOCK_PROPERTIES()
        result := ComCall(7, this, "ptr", pClockProperties, "HRESULT")
        return pClockProperties
    }
}
