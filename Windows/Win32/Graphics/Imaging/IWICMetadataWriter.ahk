#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWICMetadataReader.ahk" { IWICMetadataReader }

/**
 * Exposes methods that provide access to writing metadata content. This is implemented by independent software vendors (ISVs) to create new metadata writers.
 * @remarks
 * A metadata writer can be used to write metadata blocks and items within a metadata block instead of using a query writer. To directly access the metadata writer, query an encoder or its frames for the <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockwriter">IWICMetadataBlockWriter</a> interface to enumerate each metadata writer.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICMetadataWriter extends IWICMetadataReader {
    /**
     * The interface identifier for IWICMetadataWriter
     * @type {Guid}
     */
    static IID := Guid("{f7836e16-3be0-470b-86bb-160d0aecd7de}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICMetadataWriter interfaces
    */
    struct Vtbl extends IWICMetadataReader.Vtbl {
        SetValue           : IntPtr
        SetValueByIndex    : IntPtr
        RemoveValue        : IntPtr
        RemoveValueByIndex : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICMetadataWriter.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatawriter-setvalue
     */
    SetValue(pvarSchema, pvarId, pvarValue) {
        result := ComCall(9, this, PROPVARIANT.Ptr, pvarSchema, PROPVARIANT.Ptr, pvarId, PROPVARIANT.Ptr, pvarValue, "HRESULT")
        return result
    }

    /**
     * Sets the metadata item to the specified index.
     * @remarks
     * After removing an item, expect the remaining metadata items to move up to occupy the vacated metadata item location.  Therefore indices for remaining metadata items as well as the count will change.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatawriter-setvaluebyindex
     */
    SetValueByIndex(nIndex, pvarSchema, pvarId, pvarValue) {
        result := ComCall(10, this, "uint", nIndex, PROPVARIANT.Ptr, pvarSchema, PROPVARIANT.Ptr, pvarId, PROPVARIANT.Ptr, pvarValue, "HRESULT")
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatawriter-removevalue
     */
    RemoveValue(pvarSchema, pvarId) {
        result := ComCall(11, this, PROPVARIANT.Ptr, pvarSchema, PROPVARIANT.Ptr, pvarId, "HRESULT")
        return result
    }

    /**
     * Removes the metadata item at the specified index.
     * @remarks
     * After removing an item, expect the remaining metadata items to move up to occupy the vacated metadata item location.  Therefore indices for remaining metadata items as well as the count will change.
     * @param {Integer} nIndex Type: <b>UINT</b>
     * 
     * The index of the metadata item to remove.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatawriter-removevaluebyindex
     */
    RemoveValueByIndex(nIndex) {
        result := ComCall(12, this, "uint", nIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICMetadataWriter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 4)
        this.vtbl.SetValueByIndex := CallbackCreate(GetMethod(implObj, "SetValueByIndex"), flags, 5)
        this.vtbl.RemoveValue := CallbackCreate(GetMethod(implObj, "RemoveValue"), flags, 3)
        this.vtbl.RemoveValueByIndex := CallbackCreate(GetMethod(implObj, "RemoveValueByIndex"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetValue)
        CallbackFree(this.vtbl.SetValueByIndex)
        CallbackFree(this.vtbl.RemoveValue)
        CallbackFree(this.vtbl.RemoveValueByIndex)
    }
}
