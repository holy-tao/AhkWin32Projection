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
     * 
     * @param {PWSTR} pwszFriendlyName 
     * @param {PWSTR} pwszDescription 
     * @param {PWSTR} pwszUninstallString 
     * @param {Integer} dwPriority 
     * @param {Pointer<Guid>} guidPluginType 
     * @param {Pointer<Guid>} clsid 
     * @param {Integer} cMediaTypes 
     * @param {Pointer<Void>} pMediaTypes 
     * @returns {HRESULT} 
     */
    WMPRegisterPlayerPlugin(pwszFriendlyName, pwszDescription, pwszUninstallString, dwPriority, guidPluginType, clsid, cMediaTypes, pMediaTypes) {
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription
        pwszUninstallString := pwszUninstallString is String ? StrPtr(pwszUninstallString) : pwszUninstallString

        result := ComCall(3, this, "ptr", pwszFriendlyName, "ptr", pwszDescription, "ptr", pwszUninstallString, "uint", dwPriority, "ptr", guidPluginType, "ptr", clsid, "uint", cMediaTypes, "ptr", pMediaTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPluginType 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     */
    WMPUnRegisterPlayerPlugin(guidPluginType, clsid) {
        result := ComCall(4, this, "ptr", guidPluginType, "ptr", clsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
