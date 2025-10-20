#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrinterExtensionContext.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterExtensionEventArgs extends IPrinterExtensionContext{
    /**
     * The interface identifier for IPrinterExtensionEventArgs
     * @type {Guid}
     */
    static IID => Guid("{39843bf4-c4d2-41fd-b4b2-aedbee5e1900}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBidiNotification 
     * @returns {HRESULT} 
     */
    get_BidiNotification(pbstrBidiNotification) {
        result := ComCall(11, this, "ptr", pbstrBidiNotification, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pReasonId 
     * @returns {HRESULT} 
     */
    get_ReasonId(pReasonId) {
        result := ComCall(12, this, "ptr", pReasonId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPrinterExtensionRequest>} ppRequest 
     * @returns {HRESULT} 
     */
    get_Request(ppRequest) {
        result := ComCall(13, this, "ptr", ppRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrApplication 
     * @returns {HRESULT} 
     */
    get_SourceApplication(pbstrApplication) {
        result := ComCall(14, this, "ptr", pbstrApplication, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDetailedReasonId 
     * @returns {HRESULT} 
     */
    get_DetailedReasonId(pDetailedReasonId) {
        result := ComCall(15, this, "ptr", pDetailedReasonId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbModal 
     * @returns {HRESULT} 
     */
    get_WindowModal(pbModal) {
        result := ComCall(16, this, "ptr", pbModal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phwndParent 
     * @returns {HRESULT} 
     */
    get_WindowParent(phwndParent) {
        result := ComCall(17, this, "ptr", phwndParent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
