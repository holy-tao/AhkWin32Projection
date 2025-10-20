#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies the caller of the progress of the requested operation or any resulting errors.
 * @see https://docs.microsoft.com/windows/win32/api//tpmvscmgr/nn-tpmvscmgr-itpmvirtualsmartcardmanagerstatuscallback
 * @namespace Windows.Win32.Security.Tpm
 * @version v4.0.30319
 */
class ITpmVirtualSmartCardManagerStatusCallback extends IUnknown{
    /**
     * The interface identifier for ITpmVirtualSmartCardManagerStatusCallback
     * @type {Guid}
     */
    static IID => Guid("{1a1bb35f-abb8-451c-a1ae-33d98f1bef4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} Status 
     * @returns {HRESULT} 
     */
    ReportProgress(Status) {
        result := ComCall(3, this, "int", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Error 
     * @returns {HRESULT} 
     */
    ReportError(Error) {
        result := ComCall(4, this, "int", Error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
