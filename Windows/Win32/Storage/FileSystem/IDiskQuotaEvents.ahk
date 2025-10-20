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
     * 
     * @param {Pointer<IDiskQuotaUser>} pUser 
     * @returns {HRESULT} 
     */
    OnUserNameChanged(pUser) {
        result := ComCall(3, this, "ptr", pUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
