#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IWICMetadataQueryReader.ahk" { IWICMetadataQueryReader }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Exposes methods for setting or removing metadata blocks and items to an encoder or its image frames using a metadata query expression.
 * @remarks
 * A metadata query writer uses metadata query expressions to set or remove metadata. For more information on the metadata query language, see the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-metadataquerylanguage">Metadata Query Language Overview</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicmetadataquerywriter
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICMetadataQueryWriter extends IWICMetadataQueryReader {
    /**
     * The interface identifier for IWICMetadataQueryWriter
     * @type {Guid}
     */
    static IID := Guid("{a721791a-0def-4d06-bd91-2118bf1db10b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICMetadataQueryWriter interfaces
    */
    struct Vtbl extends IWICMetadataQueryReader.Vtbl {
        SetMetadataByName    : IntPtr
        RemoveMetadataByName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICMetadataQueryWriter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a metadata item to a specific location.
     * @remarks
     * <b>SetMetadataByName</b> uses metadata query expressions to remove metadata. For more information on the metadata query language, see the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-metadataquerylanguage">Metadata Query Language Overview</a>.
     * 
     * If the value set is a nested metadata block then use variant type <c>VT_UNKNOWN</c> and <i>pvarValue</i> pointing to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataquerywriter">IWICMetadataQueryWriter</a> of the new metadata block.  
     *                 The ordering of metadata items is at the discretion of the query writer since relative locations are not specified.
     * @param {PWSTR} wzName Type: <b>LPCWSTR</b>
     * 
     * The name of the metadata item.
     * @param {Pointer<PROPVARIANT>} pvarValue Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * The metadata to set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicmetadataquerywriter-setmetadatabyname
     */
    SetMetadataByName(wzName, pvarValue) {
        wzName := wzName is String ? StrPtr(wzName) : wzName

        result := ComCall(7, this, "ptr", wzName, PROPVARIANT.Ptr, pvarValue, "HRESULT")
        return result
    }

    /**
     * Removes a metadata item from a specific location using a metadata query expression.
     * @remarks
     * <b>RemoveMetadataByName</b> uses metadata query expressions to remove metadata. For more information on the metadata query language, see the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-metadataquerylanguage">Metadata Query Language Overview</a>.
     * 
     * If the metadata item is a metadata block, it is removed from the metadata hierarchy.
     * @param {PWSTR} wzName Type: <b>LPCWSTR</b>
     * 
     * The name of the metadata item to remove.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicmetadataquerywriter-removemetadatabyname
     */
    RemoveMetadataByName(wzName) {
        wzName := wzName is String ? StrPtr(wzName) : wzName

        result := ComCall(8, this, "ptr", wzName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICMetadataQueryWriter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMetadataByName := CallbackCreate(GetMethod(implObj, "SetMetadataByName"), flags, 3)
        this.vtbl.RemoveMetadataByName := CallbackCreate(GetMethod(implObj, "RemoveMetadataByName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMetadataByName)
        CallbackFree(this.vtbl.RemoveMetadataByName)
    }
}
