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
     * 
     * @param {Integer} dwThreadID 
     * @param {Integer} uMsgCancel 
     * @returns {HRESULT} 
     */
    SetCancelInformation(dwThreadID, uMsgCancel) {
        result := ComCall(3, this, "uint", dwThreadID, "uint", uMsgCancel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwThreadID 
     * @param {Pointer<UInt32>} puMsgCancel 
     * @returns {HRESULT} 
     */
    GetCancelInformation(pdwThreadID, puMsgCancel) {
        result := ComCall(4, this, "uint*", pdwThreadID, "uint*", puMsgCancel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
