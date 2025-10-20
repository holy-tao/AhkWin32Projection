#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that notify Remote Desktop Gateway (RD Gateway) about the result of an attempt to authorize a resource.
 * @see https://docs.microsoft.com/windows/win32/api//tsgpolicyengine/nn-tsgpolicyengine-itsgauthorizeresourcesink
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITSGAuthorizeResourceSink extends IUnknown{
    /**
     * The interface identifier for ITSGAuthorizeResourceSink
     * @type {Guid}
     */
    static IID => Guid("{feddfcd4-fa12-4435-ae55-7ad1a9779af7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HRESULT} hrIn 
     * @param {Pointer<Guid>} mainSessionId 
     * @param {Integer} subSessionId 
     * @param {Pointer<BSTR>} allowedResourceNames 
     * @param {Integer} numAllowedResourceNames 
     * @param {Pointer<BSTR>} failedResourceNames 
     * @param {Integer} numFailedResourceNames 
     * @returns {HRESULT} 
     */
    OnChannelAuthorized(hrIn, mainSessionId, subSessionId, allowedResourceNames, numAllowedResourceNames, failedResourceNames, numFailedResourceNames) {
        result := ComCall(3, this, "int", hrIn, "ptr", mainSessionId, "int", subSessionId, "ptr", allowedResourceNames, "uint", numAllowedResourceNames, "ptr", failedResourceNames, "uint", numFailedResourceNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
