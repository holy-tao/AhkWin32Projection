#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that provides an object's creator with the means to notify the object that it may be subject to subsequent reconciliation. The briefcase reconciler is responsible for implementing this interface.
 * @see https://docs.microsoft.com/windows/win32/api//reconcil/nn-reconcil-inotifyreplica
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
     * 
     * @param {Integer} ulcOtherReplicas 
     * @param {Pointer<IMoniker>} rgpmkOtherReplicas 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/reconcil/nf-reconcil-inotifyreplica-youareareplica
     */
    YouAreAReplica(ulcOtherReplicas, rgpmkOtherReplicas) {
        result := ComCall(3, this, "uint", ulcOtherReplicas, "ptr*", rgpmkOtherReplicas, "HRESULT")
        return result
    }
}
