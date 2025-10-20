#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataReader.ahk

/**
 * Exposes methods that provide access to writing metadata content. This is implemented by independent software vendors (ISVs) to create new metadata writers.
 * @remarks
 * 
  * A metadata writer can be used to write metadata blocks and items within a metadata block instead of using a query writer. To directly access the metadata writer, query an encoder or its frames for the <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockwriter">IWICMetadataBlockWriter</a> interface to enumerate each metadata writer.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nn-wincodecsdk-iwicmetadatawriter
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICMetadataWriter extends IWICMetadataReader{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICMetadataWriter
     * @type {Guid}
     */
    static IID => Guid("{f7836e16-3be0-470b-86bb-160d0aecd7de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetValue", "SetValueByIndex", "RemoveValue", "RemoveValueByIndex"]

    /**
     * 
     * @param {Pointer<PROPVARIANT>} pvarSchema 
     * @param {Pointer<PROPVARIANT>} pvarId 
     * @param {Pointer<PROPVARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatawriter-setvalue
     */
    SetValue(pvarSchema, pvarId, pvarValue) {
        result := ComCall(9, this, "ptr", pvarSchema, "ptr", pvarId, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<PROPVARIANT>} pvarSchema 
     * @param {Pointer<PROPVARIANT>} pvarId 
     * @param {Pointer<PROPVARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatawriter-setvaluebyindex
     */
    SetValueByIndex(nIndex, pvarSchema, pvarId, pvarValue) {
        result := ComCall(10, this, "uint", nIndex, "ptr", pvarSchema, "ptr", pvarId, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} pvarSchema 
     * @param {Pointer<PROPVARIANT>} pvarId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatawriter-removevalue
     */
    RemoveValue(pvarSchema, pvarId) {
        result := ComCall(11, this, "ptr", pvarSchema, "ptr", pvarId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatawriter-removevaluebyindex
     */
    RemoveValueByIndex(nIndex) {
        result := ComCall(12, this, "uint", nIndex, "HRESULT")
        return result
    }
}
