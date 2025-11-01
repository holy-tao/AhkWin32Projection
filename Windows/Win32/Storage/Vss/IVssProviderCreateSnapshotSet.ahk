#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssProviderCreateSnapshotSet interface contains the methods used during shadow copy creation.
 * @see https://docs.microsoft.com/windows/win32/api//vsprov/nn-vsprov-ivssprovidercreatesnapshotset
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssProviderCreateSnapshotSet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssProviderCreateSnapshotSet
     * @type {Guid}
     */
    static IID => Guid("{5f894e5b-1e39-4778-8e23-9abad9f0e08c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EndPrepareSnapshots", "PreCommitSnapshots", "CommitSnapshots", "PostCommitSnapshots", "PreFinalCommitSnapshots", "PostFinalCommitSnapshots", "AbortSnapshots"]

    /**
     * 
     * @param {Guid} SnapshotSetId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-endpreparesnapshots
     */
    EndPrepareSnapshots(SnapshotSetId) {
        result := ComCall(3, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} SnapshotSetId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-precommitsnapshots
     */
    PreCommitSnapshots(SnapshotSetId) {
        result := ComCall(4, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} SnapshotSetId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-commitsnapshots
     */
    CommitSnapshots(SnapshotSetId) {
        result := ComCall(5, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} SnapshotSetId 
     * @param {Integer} lSnapshotsCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-postcommitsnapshots
     */
    PostCommitSnapshots(SnapshotSetId, lSnapshotsCount) {
        result := ComCall(6, this, "ptr", SnapshotSetId, "int", lSnapshotsCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} SnapshotSetId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-prefinalcommitsnapshots
     */
    PreFinalCommitSnapshots(SnapshotSetId) {
        result := ComCall(7, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} SnapshotSetId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-postfinalcommitsnapshots
     */
    PostFinalCommitSnapshots(SnapshotSetId) {
        result := ComCall(8, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} SnapshotSetId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-abortsnapshots
     */
    AbortSnapshots(SnapshotSetId) {
        result := ComCall(9, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }
}
