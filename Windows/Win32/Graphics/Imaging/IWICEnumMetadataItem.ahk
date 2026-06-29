#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that provide enumeration services for individual metadata items.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicenummetadataitem
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICEnumMetadataItem extends IUnknown {
    /**
     * The interface identifier for IWICEnumMetadataItem
     * @type {Guid}
     */
    static IID := Guid("{dc2bb46d-3f07-481e-8625-220c4aedbb33}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICEnumMetadataItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICEnumMetadataItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicenummetadataitem-next
     */
    Next(celt, rgeltSchema, rgeltId, rgeltValue) {
        result := ComCall(3, this, "uint", celt, PROPVARIANT.Ptr, rgeltSchema, PROPVARIANT.Ptr, rgeltId, PROPVARIANT.Ptr, rgeltValue, "uint*", &pceltFetched := 0, "HRESULT")
        return pceltFetched
    }

    /**
     * Skips to given number of objects.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of objects to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicenummetadataitem-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the current position to the beginning of the enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicenummetadataitem-reset
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicenummetadataitem-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnumMetadataItem := 0, "HRESULT")
        return IWICEnumMetadataItem(ppIEnumMetadataItem)
    }

    Query(iid) {
        if (IWICEnumMetadataItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 6)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
