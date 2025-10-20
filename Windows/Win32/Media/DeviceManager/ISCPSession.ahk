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
     * 
     * @param {Pointer<IMDSPDevice>} pIDevice 
     * @param {Pointer<Byte>} pCtx 
     * @param {Integer} dwSizeCtx 
     * @returns {HRESULT} 
     */
    BeginSession(pIDevice, pCtx, dwSizeCtx) {
        result := ComCall(3, this, "ptr", pIDevice, "char*", pCtx, "uint", dwSizeCtx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pCtx 
     * @param {Integer} dwSizeCtx 
     * @returns {HRESULT} 
     */
    EndSession(pCtx, dwSizeCtx) {
        result := ComCall(4, this, "char*", pCtx, "uint", dwSizeCtx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISCPSecureQuery>} ppSecureQuery 
     * @returns {HRESULT} 
     */
    GetSecureQuery(ppSecureQuery) {
        result := ComCall(5, this, "ptr", ppSecureQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
