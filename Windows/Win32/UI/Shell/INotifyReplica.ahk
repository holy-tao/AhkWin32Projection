#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that provides an object's creator with the means to notify the object that it may be subject to subsequent reconciliation. The briefcase reconciler is responsible for implementing this interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/reconcil/nn-reconcil-inotifyreplica
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INotifyReplica extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INotifyReplica
     * @type {Guid}
     */
    static IID => Guid("{99180163-da16-101a-935c-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["YouAreAReplica"]

    /**
     * Notifies an object that it may be subject to subsequent reconciliation through the Reconcile method.
     * @remarks
     * An object may be notified that it is a replica more than once. Briefcase reconcilers are not required to implement this interface. Initiators are not required to call this interface if it is implemented. However, an object's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/reconcil/nf-reconcil-ireconcilableobject-reconcile">Reconcile</a> may fail if that object has not previously been notified through <b>INotifyReplica::YouAreAReplica</b> that it may be subject to reconciliation.
     * 
     * The briefcase calls the <a href="https://docs.microsoft.com/windows/desktop/api/reconcil/nn-reconcil-inotifyreplica">INotifyReplica</a> interface when objects are added to it.
     * @param {Integer} ulcOtherReplicas Type: <b>ULONG</b>
     * 
     * The number of other replicas of the object. This parameter must not be zero.
     * @param {Pointer<IMoniker>} rgpmkOtherReplicas Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>**</b>
     * 
     * The address of an array that contains the addresses of the monikers to use to access the other replicas.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or <b>E_UNEXPECTED</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/reconcil/nf-reconcil-inotifyreplica-youareareplica
     */
    YouAreAReplica(ulcOtherReplicas, rgpmkOtherReplicas) {
        result := ComCall(3, this, "uint", ulcOtherReplicas, "ptr*", rgpmkOtherReplicas, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
