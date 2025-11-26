#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataHandlerInfo.ahk
#Include .\IWICEnumMetadataItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide access to underlining metadata content. This interface is implemented by independent software vendors (ISVs) to create new metadata readers.
 * @remarks
 * 
 * A metadata reader can be used to access metadata blocks and items within a metadata block instead of using a query reader. To directly access the metadata reader, query a decoder or its frames for the <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockreader">IWICMetadataBlockReader</a> interface to enumerate each metadata reader.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nn-wincodecsdk-iwicmetadatareader
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICMetadataReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICMetadataReader
     * @type {Guid}
     */
    static IID => Guid("{9204fe99-d8fc-4fd5-a001-9536b067a899}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetadataFormat", "GetMetadataHandlerInfo", "GetCount", "GetValueByIndex", "GetValue", "GetEnumerator"]

    /**
     * Gets the metadata format associated with the reader.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * Pointer that receives the metadata format GUID.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getmetadataformat
     */
    GetMetadataFormat() {
        pguidMetadataFormat := Guid()
        result := ComCall(3, this, "ptr", pguidMetadataFormat, "HRESULT")
        return pguidMetadataFormat
    }

    /**
     * Gets the metadata handler info associated with the reader.
     * @returns {IWICMetadataHandlerInfo} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatahandlerinfo">IWICMetadataHandlerInfo</a>**</b>
     * 
     * Pointer that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatahandlerinfo">IWICMetadataHandlerInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getmetadatahandlerinfo
     */
    GetMetadataHandlerInfo() {
        result := ComCall(4, this, "ptr*", &ppIHandler := 0, "HRESULT")
        return IWICMetadataHandlerInfo(ppIHandler)
    }

    /**
     * Gets the number of metadata items within the reader.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * Pointer that receives the number of metadata items within the reader.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getcount
     */
    GetCount() {
        result := ComCall(5, this, "uint*", &pcCount := 0, "HRESULT")
        return pcCount
    }

    /**
     * Gets the metadata item at the given index.
     * @param {Integer} nIndex Type: <b>UINT</b>
     * 
     * The index of the metadata item to retrieve.
     * @param {Pointer<PROPVARIANT>} pvarSchema Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer that receives the schema property.
     * @param {Pointer<PROPVARIANT>} pvarId Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer that receives the id property.
     * @param {Pointer<PROPVARIANT>} pvarValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer that receives the metadata value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getvaluebyindex
     */
    GetValueByIndex(nIndex, pvarSchema, pvarId, pvarValue) {
        result := ComCall(6, this, "uint", nIndex, "ptr", pvarSchema, "ptr", pvarId, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * Gets the metadata item value.
     * @param {Pointer<PROPVARIANT>} pvarSchema Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to the metadata item's schema property.
     * @param {Pointer<PROPVARIANT>} pvarId Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to the metadata item's id.
     * @param {Pointer<PROPVARIANT>} pvarValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer that receives the metadata value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getvalue
     */
    GetValue(pvarSchema, pvarId, pvarValue) {
        result := ComCall(7, this, "ptr", pvarSchema, "ptr", pvarId, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator of all the metadata items.
     * @returns {IWICEnumMetadataItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicenummetadataitem">IWICEnumMetadataItem</a>**</b>
     * 
     * Pointer that receives a pointer to the metadata enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getenumerator
     */
    GetEnumerator() {
        result := ComCall(8, this, "ptr*", &ppIEnumMetadata := 0, "HRESULT")
        return IWICEnumMetadataItem(ppIEnumMetadata)
    }
}
