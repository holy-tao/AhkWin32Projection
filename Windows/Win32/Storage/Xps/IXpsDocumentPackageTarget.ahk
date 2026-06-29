#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Packaging\Opc\IOpcPartUri.ahk" { IOpcPartUri }
#Import ".\IXpsOMPackageWriter.ahk" { IXpsOMPackageWriter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IXpsOMObjectFactory.ahk" { IXpsOMObjectFactory }
#Import ".\XPS_DOCUMENT_TYPE.ahk" { XPS_DOCUMENT_TYPE }

/**
 * The IXpsDocumentPackageTarget interface contains the elements needed for printing XPS content in the Document Printing model.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsdocumentpackagetarget
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsDocumentPackageTarget extends IUnknown {
    /**
     * The interface identifier for IXpsDocumentPackageTarget
     * @type {Guid}
     */
    static IID := Guid("{3b0b6d38-53ad-41da-b212-d37637a6714e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsDocumentPackageTarget interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetXpsOMPackageWriter : IntPtr
        GetXpsOMFactory       : IntPtr
        GetXpsType            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsDocumentPackageTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the IXpsOMPackageWriter object for the document package.
     * @param {IOpcPartUri} documentSequencePartName The document sequence part name.
     * @param {IOpcPartUri} discardControlPartName The control part name.
     * @returns {IXpsOMPackageWriter} The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsdocumentpackagetarget-getxpsompackagewriter
     */
    GetXpsOMPackageWriter(documentSequencePartName, discardControlPartName) {
        result := ComCall(3, this, "ptr", documentSequencePartName, "ptr", discardControlPartName, "ptr*", &packageWriter := 0, "HRESULT")
        return IXpsOMPackageWriter(packageWriter)
    }

    /**
     * Gets the IXpsOMObjectFactory object for the document package. (IXpsDocumentPackageTarget.GetXpsOMFactory)
     * @returns {IXpsOMObjectFactory} The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomobjectfactory">IXpsOMObjectFactory</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsdocumentpackagetarget-getxpsomfactory
     */
    GetXpsOMFactory() {
        result := ComCall(4, this, "ptr*", &xpsFactory := 0, "HRESULT")
        return IXpsOMObjectFactory(xpsFactory)
    }

    /**
     * Gets the XPS_DOCUMENT_TYPE enumerated value for the document package.
     * @returns {XPS_DOCUMENT_TYPE} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel_1/ne-xpsobjectmodel_1-xps_document_type">XPS_DOCUMENT_TYPE</a> enumerated value.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsdocumentpackagetarget-getxpstype
     */
    GetXpsType() {
        result := ComCall(5, this, "int*", &documentType := 0, "HRESULT")
        return documentType
    }

    Query(iid) {
        if (IXpsDocumentPackageTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetXpsOMPackageWriter := CallbackCreate(GetMethod(implObj, "GetXpsOMPackageWriter"), flags, 4)
        this.vtbl.GetXpsOMFactory := CallbackCreate(GetMethod(implObj, "GetXpsOMFactory"), flags, 2)
        this.vtbl.GetXpsType := CallbackCreate(GetMethod(implObj, "GetXpsType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetXpsOMPackageWriter)
        CallbackFree(this.vtbl.GetXpsOMFactory)
        CallbackFree(this.vtbl.GetXpsType)
    }
}
