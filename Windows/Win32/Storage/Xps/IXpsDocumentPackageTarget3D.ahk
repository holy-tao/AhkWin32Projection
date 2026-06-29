#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Packaging\Opc\IOpcPartUri.ahk" { IOpcPartUri }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IXpsOMPackageWriter3D.ahk" { IXpsOMPackageWriter3D }
#Import ".\IXpsOMObjectFactory.ahk" { IXpsOMObjectFactory }

/**
 * Provides methods for sending 3D content to XPS for printing.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_2/nn-xpsobjectmodel_2-ixpsdocumentpackagetarget3d
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsDocumentPackageTarget3D extends IUnknown {
    /**
     * The interface identifier for IXpsDocumentPackageTarget3D
     * @type {Guid}
     */
    static IID := Guid("{60ba71b8-3101-4984-9199-f4ea775ff01d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsDocumentPackageTarget3D interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetXpsOMPackageWriter3D : IntPtr
        GetXpsOMFactory         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsDocumentPackageTarget3D.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a new IXpsOMPackageWriter3D object for the document package.
     * @param {IOpcPartUri} documentSequencePartName The root part of XPS payload.
     * @param {IOpcPartUri} discardControlPartName The discard control part for the XPS payload.
     * @param {IOpcPartUri} modelPartName Name of the part which will hold the 3D model. The part’s content type is “application/vnd.ms-package.3dmanufacturing-3dmodel+xml”. It is linked from package root with relationship type “http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodel” .
     * @param {IStream} modelData A readable stream which holds 3D model description. The model description may be UTF16 encoding of XML document, but for XPS OM and XpsPrint, this is a BLOB passing through. The <b>GetXpsOMPackageWriter3D</b> method attempts to move the provided stream’s read pointer to the beginning of the stream, but the method call will not fail if the stream does not support the <a href="https://docs.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-seek">Seek</a> method.
     * @returns {IXpsOMPackageWriter3D} Returns the writer which may be used to send XPS content and textures for the 3D model.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_2/nf-xpsobjectmodel_2-ixpsdocumentpackagetarget3d-getxpsompackagewriter3d
     */
    GetXpsOMPackageWriter3D(documentSequencePartName, discardControlPartName, modelPartName, modelData) {
        result := ComCall(3, this, "ptr", documentSequencePartName, "ptr", discardControlPartName, "ptr", modelPartName, "ptr", modelData, "ptr*", &packageWriter := 0, "HRESULT")
        return IXpsOMPackageWriter3D(packageWriter)
    }

    /**
     * Gets the IXpsOMObjectFactory object for the document package. (IXpsDocumentPackageTarget3D.GetXpsOMFactory)
     * @returns {IXpsOMObjectFactory} The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomobjectfactory">IXpsOMObjectFactory</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_2/nf-xpsobjectmodel_2-ixpsdocumentpackagetarget3d-getxpsomfactory
     */
    GetXpsOMFactory() {
        result := ComCall(4, this, "ptr*", &xpsFactory := 0, "HRESULT")
        return IXpsOMObjectFactory(xpsFactory)
    }

    Query(iid) {
        if (IXpsDocumentPackageTarget3D.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetXpsOMPackageWriter3D := CallbackCreate(GetMethod(implObj, "GetXpsOMPackageWriter3D"), flags, 6)
        this.vtbl.GetXpsOMFactory := CallbackCreate(GetMethod(implObj, "GetXpsOMFactory"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetXpsOMPackageWriter3D)
        CallbackFree(this.vtbl.GetXpsOMFactory)
    }
}
