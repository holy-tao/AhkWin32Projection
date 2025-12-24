#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMbnPin.ahk
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
     * Gets a list of different PIN types supported by the device.
     * @returns {Pointer<SAFEARRAY>} A pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_pin_type">MBN_PIN_TYPE</a> values that represent the PIN types supported by the device.  When <b>GetPinList</b> returns anything other than <b>S_OK</b>, <i>pinList</i> is <b>NULL</b>, otherwise the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnpinmanager-getpinlist
     */
    GetPinList() {
        result := ComCall(3, this, "ptr*", &pinList := 0, "HRESULT")
        return pinList
    }

    /**
     * Gets a specific type of PIN.
     * @param {Integer} pinType An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_pin_type">MBN_PIN_TYPE</a> value that represents the requested PIN type.
     * @returns {IMbnPin} Pointer to the address of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> for the requested PIN type.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.  Otherwise, the calling application must release this interface when it is done using it.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnpinmanager-getpin
     */
    GetPin(pinType) {
        result := ComCall(4, this, "int", pinType, "ptr*", &pin := 0, "HRESULT")
        return IMbnPin(pin)
    }

    /**
     * Gets the current PIN state of the device.
     * @returns {Integer} A pointer to the  request ID set by the Mobile Broadband service for this asynchronous request.  The response will contain the same request ID.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnpinmanager-getpinstate
     */
    GetPinState() {
        result := ComCall(5, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }
}
