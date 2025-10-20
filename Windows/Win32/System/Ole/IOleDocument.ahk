#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables a document object to communicate to containers its ability to create views of its data.
 * @see https://docs.microsoft.com/windows/win32/api//docobj/nn-docobj-ioledocument
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleDocument extends IUnknown{
    /**
     * The interface identifier for IOleDocument
     * @type {Guid}
     */
    static IID => Guid("{b722bcc5-4e68-101b-a2bc-00aa00404770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IOleInPlaceSite>} pIPSite 
     * @param {Pointer<IStream>} pstm 
     * @param {Integer} dwReserved 
     * @param {Pointer<IOleDocumentView>} ppView 
     * @returns {HRESULT} 
     */
    CreateView(pIPSite, pstm, dwReserved, ppView) {
        result := ComCall(3, this, "ptr", pIPSite, "ptr", pstm, "uint", dwReserved, "ptr", ppView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetDocMiscStatus(pdwStatus) {
        result := ComCall(4, this, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumOleDocumentViews>} ppEnum 
     * @param {Pointer<IOleDocumentView>} ppView 
     * @returns {HRESULT} 
     */
    EnumViews(ppEnum, ppView) {
        result := ComCall(5, this, "ptr", ppEnum, "ptr", ppView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
