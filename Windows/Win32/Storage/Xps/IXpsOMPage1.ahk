#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\ISequentialStream.ahk" { ISequentialStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsOMPage.ahk" { IXpsOMPage }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\XPS_DOCUMENT_TYPE.ahk" { XPS_DOCUMENT_TYPE }

/**
 * Inherits from IXpsOMPage.
 * @remarks
 * <h3><a id="Additional_References"></a><a id="additional_references"></a><a id="ADDITIONAL_REFERENCES"></a>Additional References</h3>
 * The base interface is defined and documented in Windows 7 SDK.
 * 
 * [IXpsOMPage interface](/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompage)
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsompage1
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMPage1 extends IXpsOMPage {
    /**
     * The interface identifier for IXpsOMPage1
     * @type {Guid}
     */
    static IID := Guid("{305b60ef-6892-4dda-9cbb-3aa65974508a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMPage1 interfaces
    */
    struct Vtbl extends IXpsOMPage.Vtbl {
        GetDocumentType : IntPtr
        Write1          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMPage1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the type of FixedPage markup that was used to initialize this page. This method is used to determine whether a document is the XPS or OpenXPS type. For more information, see XPS Documents.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsompage1">IXpsOMPage1</a> instance was not loaded from a stream or a  file, the document type is unspecified (XPS_DOCUMENT_TYPE_UNSPECIFIED). Otherwise, the document type returned is that of the stream or file used to initialize the <b>IXpsOMPage1</b> instance.
     * @returns {XPS_DOCUMENT_TYPE} [out, retval] The document type of the source data used to initialize this package. A document type value of XPS_DOCUMENT_TYPE_UNSPECIFIED is returned if the package was created in memory.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsompage1-getdocumenttype
     */
    GetDocumentType() {
        result := ComCall(27, this, "int*", &documentType := 0, "HRESULT")
        return documentType
    }

    /**
     * 
     * @param {ISequentialStream} stream 
     * @param {BOOL} optimizeMarkupSize 
     * @param {XPS_DOCUMENT_TYPE} documentType 
     * @returns {HRESULT} 
     */
    Write1(stream, optimizeMarkupSize, documentType) {
        result := ComCall(28, this, "ptr", stream, BOOL, optimizeMarkupSize, XPS_DOCUMENT_TYPE, documentType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsOMPage1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDocumentType := CallbackCreate(GetMethod(implObj, "GetDocumentType"), flags, 2)
        this.vtbl.Write1 := CallbackCreate(GetMethod(implObj, "Write1"), flags, 4)
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
