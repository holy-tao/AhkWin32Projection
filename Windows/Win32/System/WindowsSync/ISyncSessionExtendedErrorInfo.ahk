#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents information about which provider caused synchronization to fail.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncsessionextendederrorinfo
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncSessionExtendedErrorInfo extends IUnknown{
    /**
     * The interface identifier for ISyncSessionExtendedErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{326c6810-790a-409b-b741-6999388761eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ISyncProvider>} ppProviderWithError 
     * @returns {HRESULT} 
     */
    GetSyncProviderWithError(ppProviderWithError) {
        result := ComCall(3, this, "ptr", ppProviderWithError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
