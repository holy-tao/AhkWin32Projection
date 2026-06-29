#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\BitmapDescription.ahk" { BitmapDescription }

/**
 * Represents an image associated with a node in the visual tree.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/nn-xamlom-ibitmapdata
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct IBitmapData extends IUnknown {
    /**
     * The interface identifier for IBitmapData
     * @type {Guid}
     */
    static IID := Guid("{d1a34ef2-cad8-4635-a3d2-fcda8d3f3caf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBitmapData interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CopyBytesTo                : IntPtr
        GetStride                  : IntPtr
        GetBitmapDescription       : IntPtr
        GetSourceBitmapDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBitmapData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Copies up to the specified maximum number of bytes from the given offset in the bitmap data into the caller’s buffer (pvBytes), and returns the number of bytes copied.
     * @param {Integer} sourceOffsetInBytes The place in the bitmap data to start copying from, in bytes.
     * @param {Integer} maxBytesToCopy The maximum number of bytes to copy.
     * @param {Pointer<Integer>} pvBytes The buffer into which the bytes are copied.
     * @param {Pointer<Integer>} numberOfBytesCopied The number of bytes copied.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ibitmapdata-copybytesto
     */
    CopyBytesTo(sourceOffsetInBytes, maxBytesToCopy, pvBytes, numberOfBytesCopied) {
        pvBytesMarshal := pvBytes is VarRef ? "char*" : "ptr"
        numberOfBytesCopiedMarshal := numberOfBytesCopied is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", sourceOffsetInBytes, "uint", maxBytesToCopy, pvBytesMarshal, pvBytes, numberOfBytesCopiedMarshal, numberOfBytesCopied, "HRESULT")
        return result
    }

    /**
     * Gets the stride of the data. This is the length in bytes of each row of the bitmap.
     * @returns {Integer} The length in bytes of each row of the bitmap.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ibitmapdata-getstride
     */
    GetStride() {
        result := ComCall(4, this, "uint*", &pStride := 0, "HRESULT")
        return pStride
    }

    /**
     * Gets a BitmapDescription that describes the bitmap data stored in the IBitmapData.
     * @returns {BitmapDescription} Information about the bitmap stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nn-xamlom-ibitmapdata">IBitmapData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ibitmapdata-getbitmapdescription
     */
    GetBitmapDescription() {
        pBitmapDescription := BitmapDescription()
        result := ComCall(5, this, BitmapDescription.Ptr, pBitmapDescription, "HRESULT")
        return pBitmapDescription
    }

    /**
     * Gets a BitmapDescription that describes the original format of the bitmap data stored in the IBitmapData.
     * @remarks
     * This will have the same value as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/ns-xamlom-bitmapdescription">BitmapDescription</a> returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nf-xamlom-ibitmapdata-getbitmapdescription">GetBitmapDescription</a> unless the bitmap data was format converted or scaled. Format conversion and scaling will occur as necessary to meet the contract of the method that returned the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nn-xamlom-ibitmapdata">IBitmapData</a>.
     * @returns {BitmapDescription} Information about the original format of the  bitmap stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nn-xamlom-ibitmapdata">IBitmapData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ibitmapdata-getsourcebitmapdescription
     */
    GetSourceBitmapDescription() {
        pBitmapDescription := BitmapDescription()
        result := ComCall(6, this, BitmapDescription.Ptr, pBitmapDescription, "HRESULT")
        return pBitmapDescription
    }

    Query(iid) {
        if (IBitmapData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CopyBytesTo := CallbackCreate(GetMethod(implObj, "CopyBytesTo"), flags, 5)
        this.vtbl.GetStride := CallbackCreate(GetMethod(implObj, "GetStride"), flags, 2)
        this.vtbl.GetBitmapDescription := CallbackCreate(GetMethod(implObj, "GetBitmapDescription"), flags, 2)
        this.vtbl.GetSourceBitmapDescription := CallbackCreate(GetMethod(implObj, "GetSourceBitmapDescription"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CopyBytesTo)
        CallbackFree(this.vtbl.GetStride)
        CallbackFree(this.vtbl.GetBitmapDescription)
        CallbackFree(this.vtbl.GetSourceBitmapDescription)
    }
}
