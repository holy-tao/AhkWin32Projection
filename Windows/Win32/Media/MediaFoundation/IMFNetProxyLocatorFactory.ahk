#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates a proxy locator object, which determines the proxy to use.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetproxylocatorfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetProxyLocatorFactory extends IUnknown{
    /**
     * The interface identifier for IMFNetProxyLocatorFactory
     * @type {Guid}
     */
    static IID => Guid("{e9cd0384-a268-4bb4-82de-658d53574d41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszProtocol 
     * @param {Pointer<IMFNetProxyLocator>} ppProxyLocator 
     * @returns {HRESULT} 
     */
    CreateProxyLocator(pszProtocol, ppProxyLocator) {
        pszProtocol := pszProtocol is String ? StrPtr(pszProtocol) : pszProtocol

        result := ComCall(3, this, "ptr", pszProtocol, "ptr", ppProxyLocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
