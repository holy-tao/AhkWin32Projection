#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IExtendPropertySheet.ahk

/**
 * The IExtendPropertySheet2 interface is introduced in MMC 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iextendpropertysheet2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IExtendPropertySheet2 extends IExtendPropertySheet{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExtendPropertySheet2
     * @type {Guid}
     */
    static IID => Guid("{b7a87232-4a51-11d1-a7ea-00c04fd909dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWatermarks"]

    /**
     * 
     * @param {IDataObject} lpIDataObject 
     * @param {Pointer<HBITMAP>} lphWatermark 
     * @param {Pointer<HBITMAP>} lphHeader 
     * @param {Pointer<HPALETTE>} lphPalette 
     * @param {Pointer<BOOL>} bStretch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendpropertysheet2-getwatermarks
     */
    GetWatermarks(lpIDataObject, lphWatermark, lphHeader, lphPalette, bStretch) {
        bStretchMarshal := bStretch is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", lpIDataObject, "ptr", lphWatermark, "ptr", lphHeader, "ptr", lphPalette, bStretchMarshal, bStretch, "HRESULT")
        return result
    }
}
