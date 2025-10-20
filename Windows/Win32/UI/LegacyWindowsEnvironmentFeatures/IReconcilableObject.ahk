#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that reconcile a given document. The briefcase reconciler is responsible for implementing this interface.
 * @see https://docs.microsoft.com/windows/win32/api//reconcil/nn-reconcil-ireconcilableobject
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 * @version v4.0.30319
 */
class IReconcilableObject extends IUnknown{
    /**
     * The interface identifier for IReconcilableObject
     * @type {Guid}
     */
    static IID => Guid("{99180162-da16-101a-935c-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IReconcileInitiator>} pInitiator 
     * @param {Integer} dwFlags 
     * @param {HWND} hwndOwner 
     * @param {HWND} hwndProgressFeedback 
     * @param {Integer} ulcInput 
     * @param {Pointer<IMoniker>} rgpmkOtherInput 
     * @param {Pointer<Int32>} plOutIndex 
     * @param {Pointer<IStorage>} pstgNewResidues 
     * @returns {HRESULT} 
     */
    Reconcile(pInitiator, dwFlags, hwndOwner, hwndProgressFeedback, ulcInput, rgpmkOtherInput, plOutIndex, pstgNewResidues) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner
        hwndProgressFeedback := hwndProgressFeedback is Win32Handle ? NumGet(hwndProgressFeedback, "ptr") : hwndProgressFeedback

        result := ComCall(3, this, "ptr", pInitiator, "uint", dwFlags, "ptr", hwndOwner, "ptr", hwndProgressFeedback, "uint", ulcInput, "ptr", rgpmkOtherInput, "int*", plOutIndex, "ptr", pstgNewResidues, "ptr", pvReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulProgressMax 
     * @returns {HRESULT} 
     */
    GetProgressFeedbackMaxEstimate(pulProgressMax) {
        result := ComCall(4, this, "uint*", pulProgressMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
