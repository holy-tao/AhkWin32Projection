#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintOemDriverUI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintOemDriverUI
     * @type {Guid}
     */
    static IID => Guid("{92b05d50-78bc-11d1-9480-00a0c90640b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DrvGetDriverSetting", "DrvUpgradeRegistrySetting", "DrvUpdateUISetting"]

    /**
     * 
     * @param {Pointer<Void>} pci 
     * @param {PSTR} Feature 
     * @param {Pointer<Void>} pOutput 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pdwOptionsReturned 
     * @returns {HRESULT} 
     */
    DrvGetDriverSetting(pci, Feature, pOutput, cbSize, pcbNeeded, pdwOptionsReturned) {
        result := ComCall(3, this, "ptr", pci, "ptr", Feature, "ptr", pOutput, "uint", cbSize, "uint*", pcbNeeded, "uint*", pdwOptionsReturned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hPrinter 
     * @param {PSTR} pFeature 
     * @param {PSTR} pOption 
     * @returns {HRESULT} 
     */
    DrvUpgradeRegistrySetting(hPrinter, pFeature, pOption) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := ComCall(4, this, "ptr", hPrinter, "ptr", pFeature, "ptr", pOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pci 
     * @param {Pointer<Void>} pOptItem 
     * @param {Integer} dwPreviousSelection 
     * @param {Integer} dwMode 
     * @returns {HRESULT} 
     */
    DrvUpdateUISetting(pci, pOptItem, dwPreviousSelection, dwMode) {
        result := ComCall(5, this, "ptr", pci, "ptr", pOptItem, "uint", dwPreviousSelection, "uint", dwMode, "HRESULT")
        return result
    }
}
