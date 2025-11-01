#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPMediaPluginRegistrar interface manages plug-in registration.
 * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nn-wmpservices-iwmpmediapluginregistrar
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPMediaPluginRegistrar extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPMediaPluginRegistrar
     * @type {Guid}
     */
    static IID => Guid("{68e27045-05bd-40b2-9720-23088c78e390}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WMPRegisterPlayerPlugin", "WMPUnRegisterPlayerPlugin"]

    /**
     * 
     * @param {PWSTR} pwszFriendlyName 
     * @param {PWSTR} pwszDescription 
     * @param {PWSTR} pwszUninstallString 
     * @param {Integer} dwPriority 
     * @param {Guid} guidPluginType 
     * @param {Guid} clsid 
     * @param {Integer} cMediaTypes 
     * @param {Pointer<Void>} pMediaTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpmediapluginregistrar-wmpregisterplayerplugin
     */
    WMPRegisterPlayerPlugin(pwszFriendlyName, pwszDescription, pwszUninstallString, dwPriority, guidPluginType, clsid, cMediaTypes, pMediaTypes) {
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription
        pwszUninstallString := pwszUninstallString is String ? StrPtr(pwszUninstallString) : pwszUninstallString

        pMediaTypesMarshal := pMediaTypes is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pwszFriendlyName, "ptr", pwszDescription, "ptr", pwszUninstallString, "uint", dwPriority, "ptr", guidPluginType, "ptr", clsid, "uint", cMediaTypes, pMediaTypesMarshal, pMediaTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} guidPluginType 
     * @param {Guid} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpmediapluginregistrar-wmpunregisterplayerplugin
     */
    WMPUnRegisterPlayerPlugin(guidPluginType, clsid) {
        result := ComCall(4, this, "ptr", guidPluginType, "ptr", clsid, "HRESULT")
        return result
    }
}
