#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide enumeration services for individual metadata items.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicenummetadataitem
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICEnumMetadataItem extends IUnknown{
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
     * 
     * @param {Integer} celt 
     * @param {Pointer<PROPVARIANT>} rgeltSchema 
     * @param {Pointer<PROPVARIANT>} rgeltId 
     * @param {Pointer<PROPVARIANT>} rgeltValue 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, rgeltSchema, rgeltId, rgeltValue, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", rgeltSchema, "ptr", rgeltId, "ptr", rgeltValue, "uint*", pceltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICEnumMetadataItem>} ppIEnumMetadataItem 
     * @returns {HRESULT} 
     */
    Clone(ppIEnumMetadataItem) {
        result := ComCall(6, this, "ptr", ppIEnumMetadataItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
