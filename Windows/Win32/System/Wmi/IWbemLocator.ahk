#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Use the IWbemLocator interface to obtain the initial namespace pointer to the IWbemServices interface for WMI on a specific host computer.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemlocator
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemLocator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemLocator
     * @type {Guid}
     */
    static IID => Guid("{dc12a687-737f-11cf-884d-00aa004b2e24}")

    /**
     * The class identifier for WbemLocator
     * @type {Guid}
     */
    static CLSID => Guid("{4590f811-1d3a-11d0-891f-00aa004b2e24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectServer"]

    /**
     * 
     * @param {BSTR} strNetworkResource 
     * @param {BSTR} strUser 
     * @param {BSTR} strPassword 
     * @param {BSTR} strLocale 
     * @param {Integer} lSecurityFlags 
     * @param {BSTR} strAuthority 
     * @param {IWbemContext} pCtx 
     * @param {Pointer<IWbemServices>} ppNamespace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemlocator-connectserver
     */
    ConnectServer(strNetworkResource, strUser, strPassword, strLocale, lSecurityFlags, strAuthority, pCtx, ppNamespace) {
        strNetworkResource := strNetworkResource is String ? BSTR.Alloc(strNetworkResource).Value : strNetworkResource
        strUser := strUser is String ? BSTR.Alloc(strUser).Value : strUser
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale
        strAuthority := strAuthority is String ? BSTR.Alloc(strAuthority).Value : strAuthority

        result := ComCall(3, this, "ptr", strNetworkResource, "ptr", strUser, "ptr", strPassword, "ptr", strLocale, "int", lSecurityFlags, "ptr", strAuthority, "ptr", pCtx, "ptr*", ppNamespace, "HRESULT")
        return result
    }
}
