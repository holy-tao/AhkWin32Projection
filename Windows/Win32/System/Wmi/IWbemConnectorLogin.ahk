#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemConnectorLogin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemConnectorLogin
     * @type {Guid}
     */
    static IID => Guid("{d8ec9cb1-b135-4f10-8b1b-c7188bb0d186}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectorLogin"]

    /**
     * 
     * @param {PWSTR} wszNetworkResource 
     * @param {PWSTR} wszPreferredLocale 
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} pInterface 
     * @returns {HRESULT} 
     */
    ConnectorLogin(wszNetworkResource, wszPreferredLocale, lFlags, pCtx, riid, pInterface) {
        wszNetworkResource := wszNetworkResource is String ? StrPtr(wszNetworkResource) : wszNetworkResource
        wszPreferredLocale := wszPreferredLocale is String ? StrPtr(wszPreferredLocale) : wszPreferredLocale

        pInterfaceMarshal := pInterface is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", wszNetworkResource, "ptr", wszPreferredLocale, "int", lFlags, "ptr", pCtx, "ptr", riid, pInterfaceMarshal, pInterface, "HRESULT")
        return result
    }
}
