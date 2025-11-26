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
     * Notifies Remote Desktop Gateway (RD Gateway) about the result of an attempt to authorize a resource.
     * @param {HRESULT} hrIn The result of the authorization attempt. Specify <b>S_OK</b> to indicate that the attempt succeeded. Specify any other value to indicate that the attempt failed.
     * @param {Guid} mainSessionId A unique identifier assigned to the connection request by RD Gateway.
     * @param {Integer} subSessionId A unique identifier assigned to the subsession by RD Gateway. A subsession is a session launched from another session.
     * @param {Pointer<BSTR>} allowedResourceNames A pointer to a <b>BSTR</b> that contains a list of resources that were successfully authorized.
     * @param {Integer} numAllowedResourceNames The number of resources referenced by the <i>allowedResourceNames</i> parameter. If the function succeeds, this parameter must be one or more.
     * @param {Pointer<BSTR>} failedResourceNames A pointer to a <b>BSTR</b> that contains a list of resources that failed authorization.
     * @param {Integer} numFailedResourceNames The number of resources referenced by the <i>failedResourceNames</i> parameter.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tsgpolicyengine/nf-tsgpolicyengine-itsgauthorizeresourcesink-onchannelauthorized
     */
    OnChannelAuthorized(hrIn, mainSessionId, subSessionId, allowedResourceNames, numAllowedResourceNames, failedResourceNames, numFailedResourceNames) {
        result := ComCall(3, this, "int", hrIn, "ptr", mainSessionId, "int", subSessionId, "ptr", allowedResourceNames, "uint", numAllowedResourceNames, "ptr", failedResourceNames, "uint", numFailedResourceNames, "HRESULT")
        return result
    }
}
