#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsDocumentConsumer extends IUnknown{
    /**
     * The interface identifier for IXpsDocumentConsumer
     * @type {Guid}
     */
    static IID => Guid("{4368d8a2-4181-4a9f-b295-3d9a38bb9ba0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pUnknown 
     * @returns {HRESULT} 
     */
    SendXpsUnknown(pUnknown) {
        result := ComCall(3, this, "ptr", pUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsDocument>} pIXpsDocument 
     * @returns {HRESULT} 
     */
    SendXpsDocument(pIXpsDocument) {
        result := ComCall(4, this, "ptr", pIXpsDocument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFixedDocumentSequence>} pIFixedDocumentSequence 
     * @returns {HRESULT} 
     */
    SendFixedDocumentSequence(pIFixedDocumentSequence) {
        result := ComCall(5, this, "ptr", pIFixedDocumentSequence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFixedDocument>} pIFixedDocument 
     * @returns {HRESULT} 
     */
    SendFixedDocument(pIFixedDocument) {
        result := ComCall(6, this, "ptr", pIFixedDocument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFixedPage>} pIFixedPage 
     * @returns {HRESULT} 
     */
    SendFixedPage(pIFixedPage) {
        result := ComCall(7, this, "ptr", pIFixedPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseSender() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppNewObject 
     * @param {Pointer<IPrintWriteStream>} ppWriteStream 
     * @returns {HRESULT} 
     */
    GetNewEmptyPart(uri, riid, ppNewObject, ppWriteStream) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(9, this, "ptr", uri, "ptr", riid, "ptr", ppNewObject, "ptr", ppWriteStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
