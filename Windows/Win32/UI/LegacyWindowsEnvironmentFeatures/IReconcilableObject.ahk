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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reconcile", "GetProgressFeedbackMaxEstimate"]

    /**
     * Reconciles the state of an object with one or more other objects. The reconciliation updates the internal state of the object by merging the states of all objects to form a combined state.
     * @param {IReconcileInitiator} pInitiator Type: <b><a href="https://docs.microsoft.com/windows/desktop/lwef/ireconcileinitiator">IReconcileInitiator</a>*</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/lwef/ireconcileinitiator">IReconcileInitiator</a> interface for the initiator of the reconciliation process. This parameter must not be <b>NULL</b>.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * The control flags for the reconciliation. This parameter may be zero or a combination of these values:
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to the window to be used as the parent for any child windows that the briefcase reconciler creates. This parameter is valid only if RECONCILEF_MAYBOTHERUSER is specified in 
     * 					<i>dwFlags</i>.
     * @param {HWND} hwndProgressFeedback Type: <b>HWND</b>
     * 
     * A handle to the progress feedback window to be displayed by the initiator. This parameter is valid only if RECONCILEF_FEEDBACKWINDOWVALID is specified in 
     * 					<i>dwFlags</i>. The briefcase reconciler may call the 
     * 					<b>SetWindowText</b> function using this window handle to display additional reconciliation status information to the user.
     * @param {Integer} ulcInput Type: <b>ULONG</b>
     * 
     * The number of versions or partial residues specified in 
     * 					<i>dwFlags</i>. This parameter must not be zero.
     * @param {Pointer<IMoniker>} rgpmkOtherInput Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>**</b>
     * 
     * The address of an array that contains the addresses of the monikers to use to access the versions or partial residues to be reconciled.
     * @param {IStorage} pstgNewResidues Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>*</b>
     * 
     * The address of the 
     * 					<b>IStorage</b> interface used to store the new residues. This parameter can be <b>NULL</b> to indicate that residues should not be saved.
     * @returns {Integer} Type: <b>LONG*</b>
     * 
     * The address of the variable that receives an index value indicating whether the result of the reconciliation is identical to one of the initial versions. The variable is set to -1L if the reconciliation result is a combination of two or more versions. Otherwise, it is a zero-based index, with 0 indicating this object, 1 indicating the first version, 2 indicating the second version, and so on.
     * @see https://docs.microsoft.com/windows/win32/api//reconcil/nf-reconcil-ireconcilableobject-reconcile
     */
    Reconcile(pInitiator, dwFlags, hwndOwner, hwndProgressFeedback, ulcInput, rgpmkOtherInput, pstgNewResidues) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner
        hwndProgressFeedback := hwndProgressFeedback is Win32Handle ? NumGet(hwndProgressFeedback, "ptr") : hwndProgressFeedback

        result := ComCall(3, this, "ptr", pInitiator, "uint", dwFlags, "ptr", hwndOwner, "ptr", hwndProgressFeedback, "uint", ulcInput, "ptr*", rgpmkOtherInput, "int*", &plOutIndex := 0, "ptr", pstgNewResidues, "ptr", pvReserved, "HRESULT")
        return plOutIndex
    }

    /**
     * Retrieves an estimated measurement of the amount of work required to complete a reconciliation.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * The address of the variable to receive the work estimate value.
     * @see https://docs.microsoft.com/windows/win32/api//reconcil/nf-reconcil-ireconcilableobject-getprogressfeedbackmaxestimate
     */
    GetProgressFeedbackMaxEstimate() {
        result := ComCall(4, this, "uint*", &pulProgressMax := 0, "HRESULT")
        return pulProgressMax
    }
}
