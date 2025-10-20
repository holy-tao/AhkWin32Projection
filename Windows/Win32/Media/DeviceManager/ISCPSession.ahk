#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISCPSession interface provides efficient common state management for multiple operations.A secure content provider (SCP) session is useful when transferring multiple files.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iscpsession
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSession extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSession
     * @type {Guid}
     */
    static IID => Guid("{88a3e6ed-eee4-4619-bbb3-fd4fb62715d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginSession", "EndSession", "GetSecureQuery"]

    /**
     * 
     * @param {IMDSPDevice} pIDevice 
     * @param {Pointer<Integer>} pCtx 
     * @param {Integer} dwSizeCtx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsession-beginsession
     */
    BeginSession(pIDevice, pCtx, dwSizeCtx) {
        result := ComCall(3, this, "ptr", pIDevice, "char*", pCtx, "uint", dwSizeCtx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCtx 
     * @param {Integer} dwSizeCtx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsession-endsession
     */
    EndSession(pCtx, dwSizeCtx) {
        result := ComCall(4, this, "char*", pCtx, "uint", dwSizeCtx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISCPSecureQuery>} ppSecureQuery 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsession-getsecurequery
     */
    GetSecureQuery(ppSecureQuery) {
        result := ComCall(5, this, "ptr*", ppSecureQuery, "HRESULT")
        return result
    }
}
