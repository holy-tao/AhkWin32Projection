#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that presents a conflict to the user.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrconflictpresenter
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrConflictPresenter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrConflictPresenter
     * @type {Guid}
     */
    static IID => Guid("{0b4f5353-fd2b-42cd-8763-4779f2d508a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PresentConflict"]

    /**
     * 
     * @param {ISyncMgrConflict} pConflict 
     * @param {ISyncMgrConflictResolveInfo} pResolveInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictpresenter-presentconflict
     */
    PresentConflict(pConflict, pResolveInfo) {
        result := ComCall(3, this, "ptr", pConflict, "ptr", pResolveInfo, "HRESULT")
        return result
    }
}
