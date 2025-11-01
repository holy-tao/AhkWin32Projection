#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPStringCollection.ahk

/**
 * The IWMPStringCollection2 interface provides methods that supplement the IWMPStringCollection interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpstringcollection2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPStringCollection2 extends IWMPStringCollection{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPStringCollection2
     * @type {Guid}
     */
    static IID => Guid("{46ad648d-53f1-4a74-92e2-2a1b68d63fd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["isIdentical", "getItemInfo", "getAttributeCountByType", "getItemInfoByType"]

    /**
     * 
     * @param {IWMPStringCollection2} pIWMPStringCollection2 
     * @param {Pointer<VARIANT_BOOL>} pvbool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection2-isidentical
     */
    isIdentical(pIWMPStringCollection2, pvbool) {
        result := ComCall(9, this, "ptr", pIWMPStringCollection2, "ptr", pvbool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lCollectionIndex 
     * @param {BSTR} bstrItemName 
     * @param {Pointer<BSTR>} pbstrValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection2-getiteminfo
     */
    getItemInfo(lCollectionIndex, bstrItemName, pbstrValue) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(10, this, "int", lCollectionIndex, "ptr", bstrItemName, "ptr", pbstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lCollectionIndex 
     * @param {BSTR} bstrType 
     * @param {BSTR} bstrLanguage 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection2-getattributecountbytype
     */
    getAttributeCountByType(lCollectionIndex, bstrType, bstrLanguage, plCount) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(11, this, "int", lCollectionIndex, "ptr", bstrType, "ptr", bstrLanguage, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lCollectionIndex 
     * @param {BSTR} bstrType 
     * @param {BSTR} bstrLanguage 
     * @param {Integer} lAttributeIndex 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection2-getiteminfobytype
     */
    getItemInfoByType(lCollectionIndex, bstrType, bstrLanguage, lAttributeIndex, pvarValue) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(12, this, "int", lCollectionIndex, "ptr", bstrType, "ptr", bstrLanguage, "int", lAttributeIndex, "ptr", pvarValue, "HRESULT")
        return result
    }
}
