#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide the briefcase reconciler with the means to notify the initiator of its progress, to set a termination object, and to request a given version of a document. The initiator is responsible for implementing this interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/reconcil/nn-reconcil-ireconcileinitiator
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 * @version v4.0.30319
 */
class IReconcileInitiator extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAbortCallback", "SetProgressFeedback"]

    /**
     * Sets the object through which the initiator can asynchronously terminate a reconciliation. A briefcase reconciler typically sets this object for reconciliations that are lengthy or involve user interaction.
     * @remarks
     * The initiator can accept or reject the object. If the initiator accepts the object, the briefcase reconciler must remove the object by calling this method with a <b>NULL</b> parameter when the reconciliation is complete. Because the reconciler removes the object after completing reconciliation, there may be times when the initiator releases the object after reconciliation is complete. In such cases, the reconciler ignores the request to terminate. 
     * 
     * If the reconciliation is terminated, the <a href="https://docs.microsoft.com/windows/desktop/api/reconcil/nf-reconcil-ireconcilableobject-reconcile">Reconcile</a> method must return either the REC_E_ABORTED or REC_E_NOTCOMPLETE value.
     * @param {IUnknown} punkForAbort Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the object. The initiator signals a request to terminate the reconciliation by using the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method to release the object. This parameter may be <b>NULL</b> to direct the initiator to remove the previously specified object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns the S_OK value if successful, or one of the following error values otherwise. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REC_E_NOCALLBACK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The initiator does not support termination of reconciliation operations and does not hold the specified object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/reconcil/nf-reconcil-ireconcileinitiator-setabortcallback
     */
    SetAbortCallback(punkForAbort) {
        result := ComCall(3, this, "ptr", punkForAbort, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates the amount of progress the briefcase reconciler has made toward completing the reconciliation.
     * @remarks
     * The initiator typically uses this measure of progress to update a thermometer gauge or some other form of visual feedback for the user. The briefcase reconciler can change the value of <i>ulProgressMax</i> from call to call. This means successive calls to this method do not necessarily indicate steady forward progress. Backward progress is legal, although not desirable. It is the responsibility of the initiator to determine whether backward progress should be revealed to the user.
     * @param {Integer} ulProgress Type: <b>ULONG</b>
     * 
     * The numerator of the progress fraction.
     * @param {Integer} ulProgressMax Type: <b>ULONG</b>
     * 
     * The denominator of the progress fraction.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns the S_OK value if successful, or the E_UNEXPECTED value if an unspecified error occurred.
     * @see https://learn.microsoft.com/windows/win32/api//content/reconcil/nf-reconcil-ireconcileinitiator-setprogressfeedback
     */
    SetProgressFeedback(ulProgress, ulProgressMax) {
        result := ComCall(4, this, "uint", ulProgress, "uint", ulProgressMax, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
