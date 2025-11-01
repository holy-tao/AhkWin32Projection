#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {IOpcPartUri} documentSequencePartName 
     * @param {IOpcPartUri} discardControlPartName 
     * @param {Pointer<IXpsOMPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsdocumentpackagetarget-getxpsompackagewriter
     */
    GetXpsOMPackageWriter(documentSequencePartName, discardControlPartName, packageWriter) {
        result := ComCall(3, this, "ptr", documentSequencePartName, "ptr", discardControlPartName, "ptr*", packageWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMObjectFactory>} xpsFactory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsdocumentpackagetarget-getxpsomfactory
     */
    GetXpsOMFactory(xpsFactory) {
        result := ComCall(4, this, "ptr*", xpsFactory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} documentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsdocumentpackagetarget-getxpstype
     */
    GetXpsType(documentType) {
        documentTypeMarshal := documentType is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, documentTypeMarshal, documentType, "HRESULT")
        return result
    }
}
