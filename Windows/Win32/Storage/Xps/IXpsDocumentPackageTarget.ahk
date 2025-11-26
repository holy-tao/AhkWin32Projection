#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPackageWriter.ahk
#Include .\IXpsOMObjectFactory.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IXpsDocumentPackageTarget interface contains the elements needed for printing XPS content in the Document Printing model.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsdocumentpackagetarget
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsDocumentPackageTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsDocumentPackageTarget
     * @type {Guid}
     */
    static IID => Guid("{3b0b6d38-53ad-41da-b212-d37637a6714e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetXpsOMPackageWriter", "GetXpsOMFactory", "GetXpsType"]

    /**
     * Gets the IXpsOMPackageWriter object for the document package.
     * @param {IOpcPartUri} documentSequencePartName The document sequence part name.
     * @param {IOpcPartUri} discardControlPartName The control part name.
     * @returns {IXpsOMPackageWriter} The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsdocumentpackagetarget-getxpsompackagewriter
     */
    GetXpsOMPackageWriter(documentSequencePartName, discardControlPartName) {
        result := ComCall(3, this, "ptr", documentSequencePartName, "ptr", discardControlPartName, "ptr*", &packageWriter := 0, "HRESULT")
        return IXpsOMPackageWriter(packageWriter)
    }

    /**
     * Gets the IXpsOMObjectFactory object for the document package.
     * @returns {IXpsOMObjectFactory} The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomobjectfactory">IXpsOMObjectFactory</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsdocumentpackagetarget-getxpsomfactory
     */
    GetXpsOMFactory() {
        result := ComCall(4, this, "ptr*", &xpsFactory := 0, "HRESULT")
        return IXpsOMObjectFactory(xpsFactory)
    }

    /**
     * Gets the XPS_DOCUMENT_TYPE enumerated value for the document package.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel_1/ne-xpsobjectmodel_1-xps_document_type">XPS_DOCUMENT_TYPE</a> enumerated value.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsdocumentpackagetarget-getxpstype
     */
    GetXpsType() {
        result := ComCall(5, this, "int*", &documentType := 0, "HRESULT")
        return documentType
    }
}
