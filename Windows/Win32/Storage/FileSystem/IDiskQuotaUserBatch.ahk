#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Adds multiple quota user objects to a container that is then submitted for update in a single call.
 * @see https://docs.microsoft.com/windows/win32/api//dskquota/nn-dskquota-idiskquotauserbatch
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IDiskQuotaUserBatch extends IUnknown{
    /**
     * The interface identifier for IDiskQuotaUserBatch
     * @type {Guid}
     */
    static IID => Guid("{7988b576-ec89-11cf-9c00-00aa00a14f56}")

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
    Add(pUser) {
        result := ComCall(3, this, "ptr", pUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDiskQuotaUser>} pUser 
     * @returns {HRESULT} 
     */
    Remove(pUser) {
        result := ComCall(4, this, "ptr", pUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAll() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FlushToDisk() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
