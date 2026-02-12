#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPMediaPluginRegistrar interface manages plug-in registration.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nn-wmpservices-iwmpmediapluginregistrar
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
     * The IWMPMediaPluginRegistrar::WMPRegisterPlayerPlugin function adds information to the registry that identifies a Windows Media Player plug-in.
     * @remarks
     * Implement this function in the exported <b>DllRegisterServer</b> function.
     * 
     * The uninstall string is a command line string that Windows Media Player passes as the argument to the Windows <b>ShellExecute</b> function when the user chooses to remove the plug-in by clicking <b>Remove</b> in the Player plug-in configuration dialog box. This gives you a way to execute your own uninstall program that initiates from Windows Media Player.
     * 
     * Priority values start at zero. Most DSP plug-ins should specify a value between 1 and 10. Lower values place the plug-in closer to the rendering engine.
     * 
     * DSP plug-ins registered with identical values for <b>dwPriority</b> are ordered based on their position in the registry. Plug-ins located higher in the registry hierarchy are assigned a higher priority than plug-ins located lower in the registry hierarchy.
     * 
     * DSP plug-ins designed to work with Windows Media Player 11 must call this method twice. The first call must specify <i>guidPluginType</i> as WMP_PLUGINTYPE_DSP. The second call must specify <i>guidPluginType</i> as WMP_PLUGINTYPE_DSP_OUTOFPROC. For plug-ins designed to be backward compatible, you should avoid making the second call when installing for earlier versions of Windows Media Player. To accomplish this, check the Windows version. If the Windows operating system major version is greater than or equal to 6, you can safely register the plug-in for Media Foundation playback.
     * @param {PWSTR} pwszFriendlyName Pointer to a wide character null-terminated string containing the friendly name of the plug-in. This is also the name that displays to the user.
     * @param {PWSTR} pwszDescription Pointer to a wide character null-terminated string containing the description of the plug-in. This information also displays to the user.
     * @param {PWSTR} pwszUninstallString Pointer to a wide character null-terminated string containing the uninstall string.
     * @param {Integer} dwPriority Integer value containing the priority position of the plug-in in the chain of currently enabled plug-ins.
     * @param {Guid} guidPluginType GUID specifying plug-in type. For DSP plug-ins, specify WMP_PLUGINTYPE_DSP to register for DirectShow playback and WMP_PLUGINTYPE_DSP_OUTOFPROC for Media Foundation playback. See Remarks.
     * @param {Guid} clsid The class ID of the plug-in.
     * @param {Integer} cMediaTypes Count of media types supported by the plug-in.
     * @param {Pointer<Void>} pMediaTypes Pointer to an array of media types that enumerates the supported media types. Media types are stored as type/subtype pairs.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nf-wmpservices-iwmpmediapluginregistrar-wmpregisterplayerplugin
     */
    WMPRegisterPlayerPlugin(pwszFriendlyName, pwszDescription, pwszUninstallString, dwPriority, guidPluginType, clsid, cMediaTypes, pMediaTypes) {
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription
        pwszUninstallString := pwszUninstallString is String ? StrPtr(pwszUninstallString) : pwszUninstallString

        pMediaTypesMarshal := pMediaTypes is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pwszFriendlyName, "ptr", pwszDescription, "ptr", pwszUninstallString, "uint", dwPriority, "ptr", guidPluginType, "ptr", clsid, "uint", cMediaTypes, pMediaTypesMarshal, pMediaTypes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWMPMediaPluginRegistrar::WMPUnRegisterPlayerPlugin function removes information from the registry about a Windows Media Player plug-in.
     * @remarks
     * Implement this function in the exported <b>DllUnRegisterServer</b> function.
     * 
     * DSP plug-ins designed to work with Windows Media Player 11 must call this method twice if <b>WMPRegisterPlayerPlugin</b> was called twice. The first call must specify <i>guidPluginType</i> as WMP_PLUGINTYPE_DSP. The second call must specify <i>guidPluginType</i> as WMP_PLUGINTYPE_DSP_OUTOFPROC. For plug-ins designed to be backward compatible, you should avoid making the second call when installing for earlier versions of Windows Media Player. To accomplish this, check the Windows version. If the Windows operating system major version is greater than or equal to 6, you can safely remove the plug-in for Media Foundation playback.
     * @param {Guid} guidPluginType GUID specifying plug-in type. For DSP plug-ins, specify WMP_PLUGINTYPE_DSP to register for DirectShow playback and WMP_PLUGINTYPE_DSP_OUTOFPROC for Media Foundation playback. See Remarks.
     * @param {Guid} clsid Specifies the class ID of the plug-in being removed.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nf-wmpservices-iwmpmediapluginregistrar-wmpunregisterplayerplugin
     */
    WMPUnRegisterPlayerPlugin(guidPluginType, clsid) {
        result := ComCall(4, this, "ptr", guidPluginType, "ptr", clsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
