#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsDocumentConsumer extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendXpsUnknown", "SendXpsDocument", "SendFixedDocumentSequence", "SendFixedDocument", "SendFixedPage", "CloseSender", "GetNewEmptyPart"]

    /**
     * 
     * @param {IUnknown} pUnknown 
     * @returns {HRESULT} 
     */
    SendXpsUnknown(pUnknown) {
        result := ComCall(3, this, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsDocument} pIXpsDocument 
     * @returns {HRESULT} 
     */
    SendXpsDocument(pIXpsDocument) {
        result := ComCall(4, this, "ptr", pIXpsDocument, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFixedDocumentSequence} pIFixedDocumentSequence 
     * @returns {HRESULT} 
     */
    SendFixedDocumentSequence(pIFixedDocumentSequence) {
        result := ComCall(5, this, "ptr", pIFixedDocumentSequence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFixedDocument} pIFixedDocument 
     * @returns {HRESULT} 
     */
    SendFixedDocument(pIFixedDocument) {
        result := ComCall(6, this, "ptr", pIFixedDocument, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFixedPage} pIFixedPage 
     * @returns {HRESULT} 
     */
    SendFixedPage(pIFixedPage) {
        result := ComCall(7, this, "ptr", pIFixedPage, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseSender() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppNewObject 
     * @param {Pointer<IPrintWriteStream>} ppWriteStream 
     * @returns {HRESULT} 
     */
    GetNewEmptyPart(uri, riid, ppNewObject, ppWriteStream) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(9, this, "ptr", uri, "ptr", riid, "ptr*", ppNewObject, "ptr*", ppWriteStream, "HRESULT")
        return result
    }
}
