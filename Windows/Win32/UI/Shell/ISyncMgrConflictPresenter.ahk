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
     * 
     * @param {Pointer<ISyncMgrConflict>} pConflict 
     * @param {Pointer<ISyncMgrConflictResolveInfo>} pResolveInfo 
     * @returns {HRESULT} 
     */
    PresentConflict(pConflict, pResolveInfo) {
        result := ComCall(3, this, "ptr", pConflict, "ptr", pResolveInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
