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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnChannelAuthorized"]

    /**
     * 
     * @param {HRESULT} hrIn 
     * @param {Guid} mainSessionId 
     * @param {Integer} subSessionId 
     * @param {Pointer<BSTR>} allowedResourceNames 
     * @param {Integer} numAllowedResourceNames 
     * @param {Pointer<BSTR>} failedResourceNames 
     * @param {Integer} numFailedResourceNames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/nf-tsgpolicyengine-itsgauthorizeresourcesink-onchannelauthorized
     */
    OnChannelAuthorized(hrIn, mainSessionId, subSessionId, allowedResourceNames, numAllowedResourceNames, failedResourceNames, numFailedResourceNames) {
        result := ComCall(3, this, "int", hrIn, "ptr", mainSessionId, "int", subSessionId, "ptr", allowedResourceNames, "uint", numAllowedResourceNames, "ptr", failedResourceNames, "uint", numFailedResourceNames, "HRESULT")
        return result
    }
}
