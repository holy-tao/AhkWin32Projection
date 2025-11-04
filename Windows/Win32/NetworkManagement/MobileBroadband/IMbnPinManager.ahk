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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPinList", "GetPin", "GetPinState"]

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pinList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinlist
     */
    GetPinList(pinList) {
        pinListMarshal := pinList is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pinListMarshal, pinList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pinType 
     * @param {Pointer<IMbnPin>} pin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpinmanager-getpin
     */
    GetPin(pinType, pin) {
        result := ComCall(4, this, "int", pinType, "ptr*", pin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinstate
     */
    GetPinState(requestID) {
        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, requestIDMarshal, requestID, "HRESULT")
        return result
    }
}
