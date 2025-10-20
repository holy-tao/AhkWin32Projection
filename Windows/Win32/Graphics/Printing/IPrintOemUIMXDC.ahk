#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintOemUIMXDC extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintOemUIMXDC
     * @type {Guid}
     */
    static IID => Guid("{7349d725-e2c1-4dca-afb5-c13e91bc9306}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdjustImageableArea", "AdjustImageCompression", "AdjustDPI"]

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} cbDevMode 
     * @param {Pointer<DEVMODEA>} pDevMode 
     * @param {Integer} cbOEMDM 
     * @param {Pointer<Void>} pOEMDM 
     * @param {Pointer<RECTL>} prclImageableArea 
     * @returns {HRESULT} 
     */
    AdjustImageableArea(hPrinter, cbDevMode, pDevMode, cbOEMDM, pOEMDM, prclImageableArea) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := ComCall(3, this, "ptr", hPrinter, "uint", cbDevMode, "ptr", pDevMode, "uint", cbOEMDM, "ptr", pOEMDM, "ptr", prclImageableArea, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} cbDevMode 
     * @param {Pointer<DEVMODEA>} pDevMode 
     * @param {Integer} cbOEMDM 
     * @param {Pointer<Void>} pOEMDM 
     * @param {Pointer<Integer>} pCompressionMode 
     * @returns {HRESULT} 
     */
    AdjustImageCompression(hPrinter, cbDevMode, pDevMode, cbOEMDM, pOEMDM, pCompressionMode) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := ComCall(4, this, "ptr", hPrinter, "uint", cbDevMode, "ptr", pDevMode, "uint", cbOEMDM, "ptr", pOEMDM, "int*", pCompressionMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} cbDevMode 
     * @param {Pointer<DEVMODEA>} pDevMode 
     * @param {Integer} cbOEMDM 
     * @param {Pointer<Void>} pOEMDM 
     * @param {Pointer<Integer>} pDPI 
     * @returns {HRESULT} 
     */
    AdjustDPI(hPrinter, cbDevMode, pDevMode, cbOEMDM, pOEMDM, pDPI) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := ComCall(5, this, "ptr", hPrinter, "uint", cbDevMode, "ptr", pDevMode, "uint", cbOEMDM, "ptr", pOEMDM, "int*", pDPI, "HRESULT")
        return result
    }
}
