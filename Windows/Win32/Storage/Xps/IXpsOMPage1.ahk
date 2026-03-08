#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPage.ahk

/**
 * Inherits from IXpsOMPage.
 * @remarks
 * <h3><a id="Additional_References"></a><a id="additional_references"></a><a id="ADDITIONAL_REFERENCES"></a>Additional References</h3>
 * The base interface is defined and documented in Windows 7 SDK.
 * 
 * [IXpsOMPage interface](/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompage)
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsompage1
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPage1 extends IXpsOMPage{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPage1
     * @type {Guid}
     */
    static IID => Guid("{305b60ef-6892-4dda-9cbb-3aa65974508a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocumentType", "Write1"]

    /**
     * Gets the type of FixedPage markup that was used to initialize this page. This method is used to determine whether a document is the XPS or OpenXPS type. For more information, see XPS Documents.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsompage1">IXpsOMPage1</a> instance was not loaded from a stream or a  file, the document type is unspecified (XPS_DOCUMENT_TYPE_UNSPECIFIED). Otherwise, the document type returned is that of the stream or file used to initialize the <b>IXpsOMPage1</b> instance.
     * @returns {Integer} [out, retval] The document type of the source data used to initialize this package. A document type value of XPS_DOCUMENT_TYPE_UNSPECIFIED is returned if the package was created in memory.
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
     * @param {Integer} documentType 
     * @returns {HRESULT} 
     */
    Write1(stream, optimizeMarkupSize, documentType) {
        result := ComCall(28, this, "ptr", stream, "int", optimizeMarkupSize, "int", documentType, "HRESULT")
        return result
    }
}
