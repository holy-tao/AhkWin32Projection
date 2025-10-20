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
     * 
     * @param {Pointer<Int32>} documentType 
     * @returns {HRESULT} 
     */
    GetDocumentType(documentType) {
        result := ComCall(7, this, "int*", documentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISequentialStream>} stream 
     * @param {Integer} documentType 
     * @returns {HRESULT} 
     */
    Write1(stream, documentType) {
        result := ComCall(8, this, "ptr", stream, "int", documentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
