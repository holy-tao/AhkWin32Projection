#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemClientTransport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemClientTransport
     * @type {Guid}
     */
    static IID => Guid("{f7ce2e11-8c90-11d1-9e7b-00c04fc324a8}")

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
     * @param {BSTR} strAddressType 
     * @param {Integer} dwBinaryAddressLength 
     * @param {Pointer<Integer>} abBinaryAddress 
     * @param {BSTR} strNetworkResource 
     * @param {BSTR} strUser 
     * @param {BSTR} strPassword 
     * @param {BSTR} strLocale 
     * @param {Integer} lSecurityFlags 
     * @param {BSTR} strAuthority 
     * @param {IWbemContext} pCtx 
     * @param {Pointer<IWbemServices>} ppNamespace 
     * @returns {HRESULT} 
     */
    ConnectServer(strAddressType, dwBinaryAddressLength, abBinaryAddress, strNetworkResource, strUser, strPassword, strLocale, lSecurityFlags, strAuthority, pCtx, ppNamespace) {
        strAddressType := strAddressType is String ? BSTR.Alloc(strAddressType).Value : strAddressType
        strNetworkResource := strNetworkResource is String ? BSTR.Alloc(strNetworkResource).Value : strNetworkResource
        strUser := strUser is String ? BSTR.Alloc(strUser).Value : strUser
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale
        strAuthority := strAuthority is String ? BSTR.Alloc(strAuthority).Value : strAuthority

        abBinaryAddressMarshal := abBinaryAddress is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", strAddressType, "uint", dwBinaryAddressLength, abBinaryAddressMarshal, abBinaryAddress, "ptr", strNetworkResource, "ptr", strUser, "ptr", strPassword, "ptr", strLocale, "int", lSecurityFlags, "ptr", strAuthority, "ptr", pCtx, "ptr*", ppNamespace, "HRESULT")
        return result
    }
}
