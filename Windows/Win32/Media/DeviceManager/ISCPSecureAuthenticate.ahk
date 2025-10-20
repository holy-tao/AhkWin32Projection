#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISCPSecureAuthenticate interface is the primary interface of the secure content provider, which Windows Media Device Manager queries to authenticate the secure content provider and to be authenticated by the secure content provider.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iscpsecureauthenticate
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSecureAuthenticate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSecureAuthenticate
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a0f-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSecureQuery"]

    /**
     * 
     * @param {Pointer<ISCPSecureQuery>} ppSecureQuery 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureauthenticate-getsecurequery
     */
    GetSecureQuery(ppSecureQuery) {
        result := ComCall(3, this, "ptr*", ppSecureQuery, "HRESULT")
        return result
    }
}
