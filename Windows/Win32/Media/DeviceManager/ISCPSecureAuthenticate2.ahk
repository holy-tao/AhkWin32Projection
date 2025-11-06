#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISCPSession.ahk
#Include .\ISCPSecureAuthenticate.ahk

/**
 * The ISCPSecureAuthenticate2 interface extends ISCPSecureAuthenticate by providing a way to get a session object.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iscpsecureauthenticate2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSecureAuthenticate2 extends ISCPSecureAuthenticate{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSecureAuthenticate2
     * @type {Guid}
     */
    static IID => Guid("{b580cfae-1672-47e2-acaa-44bbecbcae5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSCPSession"]

    /**
     * 
     * @returns {ISCPSession} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureauthenticate2-getscpsession
     */
    GetSCPSession() {
        result := ComCall(4, this, "ptr*", &ppSCPSession := 0, "HRESULT")
        return ISCPSession(ppSCPSession)
    }
}
