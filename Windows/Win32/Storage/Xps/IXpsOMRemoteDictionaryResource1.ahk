#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMRemoteDictionaryResource.ahk

/**
 * Extends IXpsOMRemoteDictionaryResource to provide methods that support OpenXPS documents.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsomremotedictionaryresource1
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMRemoteDictionaryResource1 extends IXpsOMRemoteDictionaryResource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMRemoteDictionaryResource1
     * @type {Guid}
     */
    static IID => Guid("{bf8fc1d4-9d46-4141-ba5f-94bb9250d041}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocumentType", "Write1"]

    /**
     * Gets the XPS_DOCUMENT_TYPE of the resource.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel_1/ne-xpsobjectmodel_1-xps_document_type">XPS_DOCUMENT_TYPE</a> document type of the resource.
     * 
     * Returns <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel_1/ne-xpsobjectmodel_1-xps_document_type">XPS_DOCUMENT_TYPE_UNSPECIFIED</a> unless the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomremotedictionaryresource">IXpsOMRemoteDictionaryResource</a> interface was created by loading a previously serialized remote dictionary.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomremotedictionaryresource1-getdocumenttype
     */
    GetDocumentType() {
        result := ComCall(7, this, "int*", &documentType := 0, "HRESULT")
        return documentType
    }

    /**
     * Serializes the remote dictionary resource to a stream.
     * @param {ISequentialStream} stream The stream that receives the serialized contents of the dictionary.
     * @param {Integer} documentType The XPS data format to write to outputStream. The value of this parameter cannot be <b>XPS_DOCUMENT_TYPE_UNSPECIFIED</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * 
     * For information about  XPS document API return values, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomremotedictionaryresource1-write1
     */
    Write1(stream, documentType) {
        result := ComCall(8, this, "ptr", stream, "int", documentType, "HRESULT")
        return result
    }
}
