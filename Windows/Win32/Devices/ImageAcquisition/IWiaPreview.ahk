#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiapreview
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaPreview extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaPreview
     * @type {Guid}
     */
    static IID => Guid("{95c2b4fd-33f2-4d86-ad40-9431f0df08f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNewPreview", "UpdatePreview", "DetectRegions", "Clear"]

    /**
     * 
     * @param {Integer} lFlags 
     * @param {IWiaItem2} pWiaItem2 
     * @param {IWiaTransferCallback} pWiaTransferCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiapreview-getnewpreview
     */
    GetNewPreview(lFlags, pWiaItem2, pWiaTransferCallback) {
        result := ComCall(3, this, "int", lFlags, "ptr", pWiaItem2, "ptr", pWiaTransferCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {IWiaItem2} pChildWiaItem2 
     * @param {IWiaTransferCallback} pWiaTransferCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiapreview-updatepreview
     */
    UpdatePreview(lFlags, pChildWiaItem2, pWiaTransferCallback) {
        result := ComCall(4, this, "int", lFlags, "ptr", pChildWiaItem2, "ptr", pWiaTransferCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiapreview-detectregions
     */
    DetectRegions(lFlags) {
        result := ComCall(5, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiapreview-clear
     */
    Clear() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
