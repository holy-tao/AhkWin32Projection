#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICEnumMetadataItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide enumeration services for individual metadata items.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicenummetadataitem
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICEnumMetadataItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICEnumMetadataItem
     * @type {Guid}
     */
    static IID => Guid("{dc2bb46d-3f07-481e-8625-220c4aedbb33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<PROPVARIANT>} rgeltSchema 
     * @param {Pointer<PROPVARIANT>} rgeltId 
     * @param {Pointer<PROPVARIANT>} rgeltValue 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicenummetadataitem-next
     */
    Next(celt, rgeltSchema, rgeltId, rgeltValue) {
        result := ComCall(3, this, "uint", celt, "ptr", rgeltSchema, "ptr", rgeltId, "ptr", rgeltValue, "uint*", &pceltFetched := 0, "HRESULT")
        return pceltFetched
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicenummetadataitem-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicenummetadataitem-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWICEnumMetadataItem} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicenummetadataitem-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnumMetadataItem := 0, "HRESULT")
        return IWICEnumMetadataItem(ppIEnumMetadataItem)
    }
}
