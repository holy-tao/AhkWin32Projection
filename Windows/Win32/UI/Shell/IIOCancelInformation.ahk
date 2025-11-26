#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for posting a cancel window message to the process thread from the Progress Dialog.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iiocancelinformation
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IIOCancelInformation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIOCancelInformation
     * @type {Guid}
     */
    static IID => Guid("{f5b0bf81-8cb5-4b1b-9449-1a159e0c733c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCancelInformation", "GetCancelInformation"]

    /**
     * Sets information that is posted when a user selects Cancel from the progress UI.
     * @param {Integer} dwThreadID Type: <b>DWORD</b>
     * 
     * The ID of the process thread to be canceled.
     * @param {Integer} uMsgCancel Type: <b>UINT</b>
     * 
     * The cancel message to be posted to the thread.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iiocancelinformation-setcancelinformation
     */
    SetCancelInformation(dwThreadID, uMsgCancel) {
        result := ComCall(3, this, "uint", dwThreadID, "uint", uMsgCancel, "HRESULT")
        return result
    }

    /**
     * Returns information that is posted when a user selects Cancel from the progress UI.
     * @param {Pointer<Integer>} pdwThreadID Type: <b>DWORD*</b>
     * 
     * When this method returns, contains a pointer to the ID of the process thread.
     * @param {Pointer<Integer>} puMsgCancel Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to <i>uMsgCancel</i> that the process thread should post if the operation is canceled.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iiocancelinformation-getcancelinformation
     */
    GetCancelInformation(pdwThreadID, puMsgCancel) {
        pdwThreadIDMarshal := pdwThreadID is VarRef ? "uint*" : "ptr"
        puMsgCancelMarshal := puMsgCancel is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwThreadIDMarshal, pdwThreadID, puMsgCancelMarshal, puMsgCancel, "HRESULT")
        return result
    }
}
