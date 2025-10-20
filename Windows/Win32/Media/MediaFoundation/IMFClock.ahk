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
     * 
     * @param {Pointer<UInt32>} pdwCharacteristics 
     * @returns {HRESULT} 
     */
    GetClockCharacteristics(pdwCharacteristics) {
        result := ComCall(3, this, "uint*", pdwCharacteristics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {Pointer<Int64>} pllClockTime 
     * @param {Pointer<Int64>} phnsSystemTime 
     * @returns {HRESULT} 
     */
    GetCorrelatedTime(dwReserved, pllClockTime, phnsSystemTime) {
        result := ComCall(4, this, "uint", dwReserved, "int64*", pllClockTime, "int64*", phnsSystemTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwContinuityKey 
     * @returns {HRESULT} 
     */
    GetContinuityKey(pdwContinuityKey) {
        result := ComCall(5, this, "uint*", pdwContinuityKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {Pointer<Int32>} peClockState 
     * @returns {HRESULT} 
     */
    GetState(dwReserved, peClockState) {
        result := ComCall(6, this, "uint", dwReserved, "int*", peClockState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFCLOCK_PROPERTIES>} pClockProperties 
     * @returns {HRESULT} 
     */
    GetProperties(pClockProperties) {
        result := ComCall(7, this, "ptr", pClockProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
