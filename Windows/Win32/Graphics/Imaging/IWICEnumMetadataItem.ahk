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
     * Advanced the current position in the enumeration.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of items to be retrieved.
     * @param {Pointer<PROPVARIANT>} rgeltSchema Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * An array of enumerated items. This parameter is optional.
     * @param {Pointer<PROPVARIANT>} rgeltId Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * An array of enumerated items.
     * @param {Pointer<PROPVARIANT>} rgeltValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * An array of enumerated items. This parameter is optional.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * The number of items that were retrieved. This value is always less than or equal to the number of items requested.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicenummetadataitem-next
     */
    Next(celt, rgeltSchema, rgeltId, rgeltValue) {
        result := ComCall(3, this, "uint", celt, "ptr", rgeltSchema, "ptr", rgeltId, "ptr", rgeltValue, "uint*", &pceltFetched := 0, "HRESULT")
        return pceltFetched
    }

    /**
     * Skips to given number of objects.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of objects to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicenummetadataitem-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the current position to the beginning of the enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicenummetadataitem-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the current IWICEnumMetadataItem.
     * @returns {IWICEnumMetadataItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicenummetadataitem">IWICEnumMetadataItem</a>**</b>
     * 
     * A pointer that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicenummetadataitem">IWICEnumMetadataItem</a> copy.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicenummetadataitem-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnumMetadataItem := 0, "HRESULT")
        return IWICEnumMetadataItem(ppIEnumMetadataItem)
    }
}
