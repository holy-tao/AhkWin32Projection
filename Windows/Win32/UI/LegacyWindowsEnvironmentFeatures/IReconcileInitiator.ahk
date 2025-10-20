#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide the briefcase reconciler with the means to notify the initiator of its progress, to set a termination object, and to request a given version of a document. The initiator is responsible for implementing this interface.
 * @see https://docs.microsoft.com/windows/win32/api//reconcil/nn-reconcil-ireconcileinitiator
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 * @version v4.0.30319
 */
class IReconcileInitiator extends IUnknown{
    /**
     * The interface identifier for IReconcileInitiator
     * @type {Guid}
     */
    static IID => Guid("{99180161-da16-101a-935c-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} punkForAbort 
     * @returns {HRESULT} 
     */
    SetAbortCallback(punkForAbort) {
        result := ComCall(3, this, "ptr", punkForAbort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulProgress 
     * @param {Integer} ulProgressMax 
     * @returns {HRESULT} 
     */
    SetProgressFeedback(ulProgress, ulProgressMax) {
        result := ComCall(4, this, "uint", ulProgress, "uint", ulProgressMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
