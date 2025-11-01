#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} pdwCharacteristics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfclock-getclockcharacteristics
     */
    GetClockCharacteristics(pdwCharacteristics) {
        pdwCharacteristicsMarshal := pdwCharacteristics is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwCharacteristicsMarshal, pdwCharacteristics, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {Pointer<Integer>} pllClockTime 
     * @param {Pointer<Integer>} phnsSystemTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfclock-getcorrelatedtime
     */
    GetCorrelatedTime(dwReserved, pllClockTime, phnsSystemTime) {
        pllClockTimeMarshal := pllClockTime is VarRef ? "int64*" : "ptr"
        phnsSystemTimeMarshal := phnsSystemTime is VarRef ? "int64*" : "ptr"

        result := ComCall(4, this, "uint", dwReserved, pllClockTimeMarshal, pllClockTime, phnsSystemTimeMarshal, phnsSystemTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwContinuityKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfclock-getcontinuitykey
     */
    GetContinuityKey(pdwContinuityKey) {
        pdwContinuityKeyMarshal := pdwContinuityKey is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwContinuityKeyMarshal, pdwContinuityKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {Pointer<Integer>} peClockState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfclock-getstate
     */
    GetState(dwReserved, peClockState) {
        peClockStateMarshal := peClockState is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "uint", dwReserved, peClockStateMarshal, peClockState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFCLOCK_PROPERTIES>} pClockProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfclock-getproperties
     */
    GetProperties(pClockProperties) {
        result := ComCall(7, this, "ptr", pClockProperties, "HRESULT")
        return result
    }
}
