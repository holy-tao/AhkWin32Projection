#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides important details about the device PIN.
 * @remarks
 * 
  * An application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnpinmanager
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnPinManager extends IUnknown{
    /**
     * The interface identifier for IMbnPinManager
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2005-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pinList 
     * @returns {HRESULT} 
     */
    GetPinList(pinList) {
        result := ComCall(3, this, "ptr", pinList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pinType 
     * @param {Pointer<IMbnPin>} pin 
     * @returns {HRESULT} 
     */
    GetPin(pinType, pin) {
        result := ComCall(4, this, "int", pinType, "ptr", pin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    GetPinState(requestID) {
        result := ComCall(5, this, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
