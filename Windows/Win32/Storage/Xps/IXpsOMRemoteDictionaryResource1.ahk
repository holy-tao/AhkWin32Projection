#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\ISequentialStream.ahk" { ISequentialStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsOMRemoteDictionaryResource.ahk" { IXpsOMRemoteDictionaryResource }
#Import ".\XPS_DOCUMENT_TYPE.ahk" { XPS_DOCUMENT_TYPE }

/**
 * Extends IXpsOMRemoteDictionaryResource to provide methods that support OpenXPS documents.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsomremotedictionaryresource1
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMRemoteDictionaryResource1 extends IXpsOMRemoteDictionaryResource {
    /**
     * The interface identifier for IXpsOMRemoteDictionaryResource1
     * @type {Guid}
     */
    static IID := Guid("{bf8fc1d4-9d46-4141-ba5f-94bb9250d041}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMRemoteDictionaryResource1 interfaces
    */
    struct Vtbl extends IXpsOMRemoteDictionaryResource.Vtbl {
        GetDocumentType : IntPtr
        Write1          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMRemoteDictionaryResource1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the XPS_DOCUMENT_TYPE of the resource.
     * @returns {XPS_DOCUMENT_TYPE} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel_1/ne-xpsobjectmodel_1-xps_document_type">XPS_DOCUMENT_TYPE</a> document type of the resource.
     * 
     * Returns <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel_1/ne-xpsobjectmodel_1-xps_document_type">XPS_DOCUMENT_TYPE_UNSPECIFIED</a> unless the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomremotedictionaryresource">IXpsOMRemoteDictionaryResource</a> interface was created by loading a previously serialized remote dictionary.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomremotedictionaryresource1-getdocumenttype
     */
    GetDocumentType() {
        result := ComCall(7, this, "int*", &documentType := 0, "HRESULT")
        return documentType
    }

    /**
     * Serializes the remote dictionary resource to a stream.
     * @param {ISequentialStream} stream The stream that receives the serialized contents of the dictionary.
     * @param {XPS_DOCUMENT_TYPE} documentType The XPS data format to write to outputStream. The value of this parameter cannot be <b>XPS_DOCUMENT_TYPE_UNSPECIFIED</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * 
     * For information about  XPS document API return values, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomremotedictionaryresource1-write1
     */
    Write1(stream, documentType) {
        result := ComCall(8, this, "ptr", stream, XPS_DOCUMENT_TYPE, documentType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsOMRemoteDictionaryResource1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDocumentType := CallbackCreate(GetMethod(implObj, "GetDocumentType"), flags, 2)
        this.vtbl.Write1 := CallbackCreate(GetMethod(implObj, "Write1"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDocumentType)
        CallbackFree(this.vtbl.Write1)
    }
}
