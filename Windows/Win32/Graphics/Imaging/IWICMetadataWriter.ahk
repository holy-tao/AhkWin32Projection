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
     * Sets the given metadata item.
     * @param {Pointer<PROPVARIANT>} pvarSchema Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to the schema property of the metadata item.
     * @param {Pointer<PROPVARIANT>} pvarId Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to the id property of the metadata item.
     * @param {Pointer<PROPVARIANT>} pvarValue Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to the metadata value to set
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatawriter-setvalue
     */
    SetValue(pvarSchema, pvarId, pvarValue) {
        result := ComCall(9, this, "ptr", pvarSchema, "ptr", pvarId, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * Sets the metadata item to the specified index.
     * @param {Integer} nIndex Type: <b>UINT</b>
     * 
     * The index to place the metadata item.
     * @param {Pointer<PROPVARIANT>} pvarSchema Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to the schema property of the metadata item.
     * @param {Pointer<PROPVARIANT>} pvarId Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to the id property of the metadata item.
     * @param {Pointer<PROPVARIANT>} pvarValue Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to the metadata value to set at the given index.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatawriter-setvaluebyindex
     */
    SetValueByIndex(nIndex, pvarSchema, pvarId, pvarValue) {
        result := ComCall(10, this, "uint", nIndex, "ptr", pvarSchema, "ptr", pvarId, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * Removes the metadata item that matches the given parameters.
     * @param {Pointer<PROPVARIANT>} pvarSchema Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to the metadata schema property.
     * @param {Pointer<PROPVARIANT>} pvarId Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to the metadata id property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatawriter-removevalue
     */
    RemoveValue(pvarSchema, pvarId) {
        result := ComCall(11, this, "ptr", pvarSchema, "ptr", pvarId, "HRESULT")
        return result
    }

    /**
     * Removes the metadata item at the specified index.
     * @param {Integer} nIndex Type: <b>UINT</b>
     * 
     * The index of the metadata item to remove.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatawriter-removevaluebyindex
     */
    RemoveValueByIndex(nIndex) {
        result := ComCall(12, this, "uint", nIndex, "HRESULT")
        return result
    }
}
