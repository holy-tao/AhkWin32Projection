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
     * 
     * @param {Pointer<Integer>} documentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomremotedictionaryresource1-getdocumenttype
     */
    GetDocumentType(documentType) {
        documentTypeMarshal := documentType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, documentTypeMarshal, documentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISequentialStream} stream 
     * @param {Integer} documentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomremotedictionaryresource1-write1
     */
    Write1(stream, documentType) {
        result := ComCall(8, this, "ptr", stream, "int", documentType, "HRESULT")
        return result
    }
}
