#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPackageWriter3D.ahk
#Include .\IXpsOMObjectFactory.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for sending 3D content to XPS for printing.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_2/nn-xpsobjectmodel_2-ixpsdocumentpackagetarget3d
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsDocumentPackageTarget3D extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsDocumentPackageTarget3D
     * @type {Guid}
     */
    static IID => Guid("{60ba71b8-3101-4984-9199-f4ea775ff01d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetXpsOMPackageWriter3D", "GetXpsOMFactory"]

    /**
     * Gets a new IXpsOMPackageWriter3D object for the document package.
     * @param {IOpcPartUri} documentSequencePartName The root part of XPS payload.
     * @param {IOpcPartUri} discardControlPartName The discard control part for the XPS payload.
     * @param {IOpcPartUri} modelPartName Name of the part which will hold the 3D model. The part’s content type is “application/vnd.ms-package.3dmanufacturing-3dmodel+xml”. It is linked from package root with relationship type “http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodel” .
     * @param {IStream} modelData A readable stream which holds 3D model description. The model description may be UTF16 encoding of XML document, but for XPS OM and XpsPrint, this is a BLOB passing through. The <b>GetXpsOMPackageWriter3D</b> method attempts to move the provided stream’s read pointer to the beginning of the stream, but the method call will not fail if the stream does not support the <a href="https://docs.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-seek">Seek</a> method.
     * @returns {IXpsOMPackageWriter3D} Returns the writer which may be used to send XPS content and textures for the 3D model.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_2/nf-xpsobjectmodel_2-ixpsdocumentpackagetarget3d-getxpsompackagewriter3d
     */
    GetXpsOMPackageWriter3D(documentSequencePartName, discardControlPartName, modelPartName, modelData) {
        result := ComCall(3, this, "ptr", documentSequencePartName, "ptr", discardControlPartName, "ptr", modelPartName, "ptr", modelData, "ptr*", &packageWriter := 0, "HRESULT")
        return IXpsOMPackageWriter3D(packageWriter)
    }

    /**
     * Gets the IXpsOMObjectFactory object for the document package.
     * @returns {IXpsOMObjectFactory} The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomobjectfactory">IXpsOMObjectFactory</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_2/nf-xpsobjectmodel_2-ixpsdocumentpackagetarget3d-getxpsomfactory
     */
    GetXpsOMFactory() {
        result := ComCall(4, this, "ptr*", &xpsFactory := 0, "HRESULT")
        return IXpsOMObjectFactory(xpsFactory)
    }
}
