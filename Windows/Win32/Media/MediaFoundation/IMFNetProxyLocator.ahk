#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Determines the proxy to use when connecting to a server.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetproxylocator
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetProxyLocator extends IUnknown{
    /**
     * The interface identifier for IMFNetProxyLocator
     * @type {Guid}
     */
    static IID => Guid("{e9cd0383-a268-4bb4-82de-658d53574d41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszHost 
     * @param {PWSTR} pszUrl 
     * @param {BOOL} fReserved 
     * @returns {HRESULT} 
     */
    FindFirstProxy(pszHost, pszUrl, fReserved) {
        pszHost := pszHost is String ? StrPtr(pszHost) : pszHost
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(3, this, "ptr", pszHost, "ptr", pszUrl, "int", fReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FindNextProxy() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hrOp 
     * @returns {HRESULT} 
     */
    RegisterProxyResult(hrOp) {
        result := ComCall(5, this, "int", hrOp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszStr 
     * @param {Pointer<UInt32>} pcchStr 
     * @returns {HRESULT} 
     */
    GetCurrentProxy(pszStr, pcchStr) {
        pszStr := pszStr is String ? StrPtr(pszStr) : pszStr

        result := ComCall(6, this, "ptr", pszStr, "uint*", pcchStr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFNetProxyLocator>} ppProxyLocator 
     * @returns {HRESULT} 
     */
    Clone(ppProxyLocator) {
        result := ComCall(7, this, "ptr", ppProxyLocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
