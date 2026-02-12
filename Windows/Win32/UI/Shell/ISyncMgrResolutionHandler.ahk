#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that manage synchronizing conflicts. Implement this interface to construct a sync conflict handler. The conflict resolution user interface (UI) will call this interface to resolve the conflict presented to the user.
 * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nn-syncmgr-isyncmgrresolutionhandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrResolutionHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrResolutionHandler
     * @type {Guid}
     */
    static IID => Guid("{40a3d052-8bff-4c4b-a338-d4a395700de9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryAbilities", "KeepOther", "KeepRecent", "RemoveFromSyncSet", "KeepItems"]

    /**
     * Determines what options the conflict presenter will display.
     * @remarks
     * The handler exposes how a conflict can be resolved by calling this method. The result of this method determines what options the conflict presenter displays, and as a result, how other methods in this interface are called.
     * @returns {Integer} Type: <b>SYNCMGR_RESOLUTION_ABILITIES_FLAGS*</b>
     * 
     * When this method returns, contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_abilities">SYNCMGR_RESOLUTION_ABILITIES</a> enumerated type.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-queryabilities
     */
    QueryAbilities() {
        result := ComCall(3, this, "uint*", &pdwAbilities := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwAbilities
    }

    /**
     * Replaces the versions in conflict with a different Shell item that is usually a merged version of the originals.
     * @remarks
     * The specified Shell item that replaces the Shell item(s) in conflict may not have been one of those originally in conflict.  It may be a merged copy, or a replacement copy.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_feedback">SYNCMGR_RESOLUTION_FEEDBACK</a> value returned in <i>pFeedback</i> determines how the next conflict is resolved. If this method fails, an error message is displayed and the user is asked how to proceed.
     * @param {IShellItem} psiOther Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the substitute <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_feedback">SYNCMGR_RESOLUTION_FEEDBACK</a>*</b>
     * 
     * When this method returns, contains a <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_feedback">SYNCMGR_RESOLUTION_FEEDBACK</a> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-keepother
     */
    KeepOther(psiOther) {
        result := ComCall(4, this, "ptr", psiOther, "int*", &pFeedback := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFeedback
    }

    /**
     * Keeps the more recent copy.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_feedback">SYNCMGR_RESOLUTION_FEEDBACK</a>*</b>
     * 
     * When this method returns, contains a <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_feedback">SYNCMGR_RESOLUTION_FEEDBACK</a> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-keeprecent
     */
    KeepRecent() {
        result := ComCall(5, this, "int*", &pFeedback := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFeedback
    }

    /**
     * Deletes the conflict and removes the IShellItem from synchronization.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that is in conflict will no longer be synchronized and the conflict should be deleted.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_feedback">SYNCMGR_RESOLUTION_FEEDBACK</a> value returned in <i>pFeedback</i> determines how the next conflict is resolved. If this method fails, an error message is displayed and the user is asked how to proceed.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_feedback">SYNCMGR_RESOLUTION_FEEDBACK</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_feedback">SYNCMGR_RESOLUTION_FEEDBACK</a> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-removefromsyncset
     */
    RemoveFromSyncSet() {
        result := ComCall(6, this, "int*", &pFeedback := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFeedback
    }

    /**
     * Keeps the Shell items that are passed in.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_feedback">SYNCMGR_RESOLUTION_FEEDBACK</a> value returned in <i>pFeedback</i> determines how the next conflict is resolved. If this method fails, an error message is displayed and the user is asked how to proceed.
     * @param {ISyncMgrConflictResolutionItems} pArray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflictresolutionitems">ISyncMgrConflictResolutionItems</a>*</b>
     * 
     * A pointer to an array of<a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflictresolutionitems">ISyncMgrConflictResolutionItems</a>. The array will contain more than one item if method <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-queryabilities">ISyncMgrResolutionHandler::QueryAbilities</a> returned SYNCMGR_RA_KEEP_MULTIPLE in parameter <i>pdwAbilities</i>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_feedback">SYNCMGR_RESOLUTION_FEEDBACK</a>*</b>
     * 
     * When this method returns, contains a <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_feedback">SYNCMGR_RESOLUTION_FEEDBACK</a> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-keepitems
     */
    KeepItems(pArray) {
        result := ComCall(7, this, "ptr", pArray, "int*", &pFeedback := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFeedback
    }
}
