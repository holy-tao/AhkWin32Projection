#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaerrorhandler
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaErrorHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaErrorHandler
     * @type {Guid}
     */
    static IID => Guid("{0e4a51b1-bc1f-443d-a835-72e890759ef3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportStatus", "GetStatusDescription"]

    /**
     * 
     * @param {Integer} lFlags 
     * @param {HWND} hwndParent 
     * @param {IWiaItem2} pWiaItem2 
     * @param {HRESULT} hrStatus 
     * @param {Integer} lPercentComplete 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaerrorhandler-reportstatus
     */
    ReportStatus(lFlags, hwndParent, pWiaItem2, hrStatus, lPercentComplete) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "int", lFlags, "ptr", hwndParent, "ptr", pWiaItem2, "int", hrStatus, "int", lPercentComplete, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {IWiaItem2} pWiaItem2 
     * @param {HRESULT} hrStatus 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaerrorhandler-getstatusdescription
     */
    GetStatusDescription(lFlags, pWiaItem2, hrStatus, pbstrDescription) {
        result := ComCall(4, this, "int", lFlags, "ptr", pWiaItem2, "int", hrStatus, "ptr", pbstrDescription, "HRESULT")
        return result
    }
}
