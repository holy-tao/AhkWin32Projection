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
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getmetadataformat
     */
    GetMetadataFormat() {
        pguidMetadataFormat := Guid()
        result := ComCall(3, this, "ptr", pguidMetadataFormat, "HRESULT")
        return pguidMetadataFormat
    }

    /**
     * 
     * @returns {IWICMetadataHandlerInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getmetadatahandlerinfo
     */
    GetMetadataHandlerInfo() {
        result := ComCall(4, this, "ptr*", &ppIHandler := 0, "HRESULT")
        return IWICMetadataHandlerInfo(ppIHandler)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getcount
     */
    GetCount() {
        result := ComCall(5, this, "uint*", &pcCount := 0, "HRESULT")
        return pcCount
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<PROPVARIANT>} pvarSchema 
     * @param {Pointer<PROPVARIANT>} pvarId 
     * @param {Pointer<PROPVARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getvaluebyindex
     */
    GetValueByIndex(nIndex, pvarSchema, pvarId, pvarValue) {
        result := ComCall(6, this, "uint", nIndex, "ptr", pvarSchema, "ptr", pvarId, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} pvarSchema 
     * @param {Pointer<PROPVARIANT>} pvarId 
     * @param {Pointer<PROPVARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getvalue
     */
    GetValue(pvarSchema, pvarId, pvarValue) {
        result := ComCall(7, this, "ptr", pvarSchema, "ptr", pvarId, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWICEnumMetadataItem} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getenumerator
     */
    GetEnumerator() {
        result := ComCall(8, this, "ptr*", &ppIEnumMetadata := 0, "HRESULT")
        return IWICEnumMetadataItem(ppIEnumMetadata)
    }
}
