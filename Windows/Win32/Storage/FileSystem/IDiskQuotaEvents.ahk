#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Receives quota-related event notifications.
 * @see https://docs.microsoft.com/windows/win32/api//dskquota/nn-dskquota-idiskquotaevents
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IDiskQuotaEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiskQuotaEvents
     * @type {Guid}
     */
    static IID => Guid("{7988b579-ec89-11cf-9c00-00aa00a14f56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUserNameChanged"]

    /**
     * 
     * @param {IDiskQuotaUser} pUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotaevents-onusernamechanged
     */
    OnUserNameChanged(pUser) {
        result := ComCall(3, this, "ptr", pUser, "HRESULT")
        return result
    }
}
