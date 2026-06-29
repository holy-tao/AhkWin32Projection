#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICEnumMetadataItem.ahk" { IWICEnumMetadataItem }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import ".\IWICMetadataHandlerInfo.ahk" { IWICMetadataHandlerInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that provide access to underlining metadata content. This interface is implemented by independent software vendors (ISVs) to create new metadata readers.
 * @remarks
 * A metadata reader can be used to access metadata blocks and items within a metadata block instead of using a query reader. To directly access the metadata reader, query a decoder or its frames for the <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockreader">IWICMetadataBlockReader</a> interface to enumerate each metadata reader.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nn-wincodecsdk-iwicmetadatareader
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICMetadataReader extends IUnknown {
    /**
     * The interface identifier for IWICMetadataReader
     * @type {Guid}
     */
    static IID := Guid("{9204fe99-d8fc-4fd5-a001-9536b067a899}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICMetadataReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMetadataFormat      : IntPtr
        GetMetadataHandlerInfo : IntPtr
        GetCount               : IntPtr
        GetValueByIndex        : IntPtr
        GetValue               : IntPtr
        GetEnumerator          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICMetadataReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the metadata format associated with the reader.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * Pointer that receives the metadata format GUID.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getmetadataformat
     */
    GetMetadataFormat() {
        pguidMetadataFormat := Guid()
        result := ComCall(3, this, Guid.Ptr, pguidMetadataFormat, "HRESULT")
        return pguidMetadataFormat
    }

    /**
     * Gets the metadata handler info associated with the reader.
     * @returns {IWICMetadataHandlerInfo} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatahandlerinfo">IWICMetadataHandlerInfo</a>**</b>
     * 
     * Pointer that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatahandlerinfo">IWICMetadataHandlerInfo</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getmetadatahandlerinfo
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getcount
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getvaluebyindex
     */
    GetValueByIndex(nIndex, pvarSchema, pvarId, pvarValue) {
        result := ComCall(6, this, "uint", nIndex, PROPVARIANT.Ptr, pvarSchema, PROPVARIANT.Ptr, pvarId, PROPVARIANT.Ptr, pvarValue, "HRESULT")
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getvalue
     */
    GetValue(pvarSchema, pvarId, pvarValue) {
        result := ComCall(7, this, PROPVARIANT.Ptr, pvarSchema, PROPVARIANT.Ptr, pvarId, PROPVARIANT.Ptr, pvarValue, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator of all the metadata items.
     * @returns {IWICEnumMetadataItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicenummetadataitem">IWICEnumMetadataItem</a>**</b>
     * 
     * Pointer that receives a pointer to the metadata enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getenumerator
     */
    GetEnumerator() {
        result := ComCall(8, this, "ptr*", &ppIEnumMetadata := 0, "HRESULT")
        return IWICEnumMetadataItem(ppIEnumMetadata)
    }

    Query(iid) {
        if (IWICMetadataReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMetadataFormat := CallbackCreate(GetMethod(implObj, "GetMetadataFormat"), flags, 2)
        this.vtbl.GetMetadataHandlerInfo := CallbackCreate(GetMethod(implObj, "GetMetadataHandlerInfo"), flags, 2)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetValueByIndex := CallbackCreate(GetMethod(implObj, "GetValueByIndex"), flags, 5)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 4)
        this.vtbl.GetEnumerator := CallbackCreate(GetMethod(implObj, "GetEnumerator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMetadataFormat)
        CallbackFree(this.vtbl.GetMetadataHandlerInfo)
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetValueByIndex)
        CallbackFree(this.vtbl.GetValue)
        CallbackFree(this.vtbl.GetEnumerator)
    }
}
