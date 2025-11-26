#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFNetProxyLocator.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates a proxy locator object, which determines the proxy to use.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetproxylocatorfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetProxyLocatorFactory extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateProxyLocator"]

    /**
     * Creates an IMFNetProxyLocator interface proxy locator object based on the protocol name.
     * @param {PWSTR} pszProtocol Null-terminated wide-character string containing the protocol name (for example, RTSP or HTTP).
     * @returns {IMFNetProxyLocator} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetproxylocator">IMFNetProxyLocator</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetproxylocatorfactory-createproxylocator
     */
    CreateProxyLocator(pszProtocol) {
        pszProtocol := pszProtocol is String ? StrPtr(pszProtocol) : pszProtocol

        result := ComCall(3, this, "ptr", pszProtocol, "ptr*", &ppProxyLocator := 0, "HRESULT")
        return IMFNetProxyLocator(ppProxyLocator)
    }
}
