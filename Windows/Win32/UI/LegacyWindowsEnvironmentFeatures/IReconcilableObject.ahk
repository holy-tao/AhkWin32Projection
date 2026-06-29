#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IReconcileInitiator.ahk" { IReconcileInitiator }
#Import "..\..\System\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that reconcile a given document. The briefcase reconciler is responsible for implementing this interface.
 * @see https://learn.microsoft.com/windows/win32/api/reconcil/nn-reconcil-ireconcilableobject
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 */
export default struct IReconcilableObject extends IUnknown {
    /**
     * The interface identifier for IReconcilableObject
     * @type {Guid}
     */
    static IID := Guid("{99180162-da16-101a-935c-444553540000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IReconcilableObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Reconcile                      : IntPtr
        GetProgressFeedbackMaxEstimate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IReconcilableObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/reconcil/nf-reconcil-ireconcilableobject-reconcile
     */
    Reconcile(pInitiator, dwFlags, hwndOwner, hwndProgressFeedback, ulcInput, rgpmkOtherInput, pstgNewResidues) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr", pInitiator, "uint", dwFlags, HWND, hwndOwner, HWND, hwndProgressFeedback, "uint", ulcInput, IMoniker.Ptr, rgpmkOtherInput, "int*", &plOutIndex := 0, "ptr", pstgNewResidues, "ptr", pvReserved, "HRESULT")
        return plOutIndex
    }

    /**
     * Retrieves an estimated measurement of the amount of work required to complete a reconciliation.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * The address of the variable to receive the work estimate value.
     * @see https://learn.microsoft.com/windows/win32/api/reconcil/nf-reconcil-ireconcilableobject-getprogressfeedbackmaxestimate
     */
    GetProgressFeedbackMaxEstimate() {
        result := ComCall(4, this, "uint*", &pulProgressMax := 0, "HRESULT")
        return pulProgressMax
    }

    Query(iid) {
        if (IReconcilableObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reconcile := CallbackCreate(GetMethod(implObj, "Reconcile"), flags, 10)
        this.vtbl.GetProgressFeedbackMaxEstimate := CallbackCreate(GetMethod(implObj, "GetProgressFeedbackMaxEstimate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reconcile)
        CallbackFree(this.vtbl.GetProgressFeedbackMaxEstimate)
    }
}
