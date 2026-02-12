#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPPlugin interface is implemented by the plug-in. It manages the connection to Windows Media Player.Note  The interface identifier GUID for this interface changed between the beta release and the final release. .
 * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nn-wmpservices-iwmpplugin
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlugin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPlugin
     * @type {Guid}
     */
    static IID => Guid("{f1392a70-024c-42bb-a998-73dfdfe7d5a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "Shutdown", "GetID", "GetCaps", "AdviseWMPServices", "UnAdviseWMPServices"]

    /**
     * The IWMPPlugin::Init method is called when Windows Media Player initializes the plug-in.
     * @remarks
     * It is possible at any given time that multiple instances of Windows Media Player could be running in the same process. For instance, multiple Windows Media Player control instances could be embedded in the same browser window, or even in multiple instances of a browser that coexist in the same process. It is also possible that the same instance of Windows Media Player could create multiple playback engines at the same time. The <i>dwPlaybackContext</i> value allows you to determine which instance of the Windows Media Player playback engine contains the plug-in. This is useful if you wish to enable multiple plug-ins to connect to each other.
     * 
     * <b>Init</b> and <b>Shutdown</b> will always be called on the same thread.
     * @param {Pointer} dwPlaybackContext DWORD value that indicates the particular Windows Media Player playback engine to which the plug-in belongs.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nf-wmpservices-iwmpplugin-init
     */
    Init(dwPlaybackContext) {
        result := ComCall(3, this, "ptr", dwPlaybackContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWMPPlugin::Shutdown method is called when Windows Media Player shuts down the plug-in.
     * @remarks
     * <b>Init</b> and <b>Shutdown</b> will always be called on the same thread.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nf-wmpservices-iwmpplugin-shutdown
     */
    Shutdown() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWMPPlugin::GetID method returns the class id of the plug-in.
     * @remarks
     * For more information on the <b>GUID</b> structure, see the Platform SDK.
     * @param {Pointer<Guid>} pGUID Pointer to a <b>GUID</b> that represents the class id of the plug-in.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nf-wmpservices-iwmpplugin-getid
     */
    GetID(pGUID) {
        result := ComCall(5, this, "ptr", pGUID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWMPPlugin::GetCaps method returns a flag that specifies whether the plug-in can convert between an input format and an output format.
     * @remarks
     * There are currently two possible [out] values that the plug-in may specify: zero to indicate that the plug-in can convert formats, or <b>WMPPlugin_Caps_CannotConvertFormats</b>, which forces Windows Media Player to handle any necessary format conversion.
     * @param {Pointer<Integer>} pdwFlags Pointer to a variable that specifies whether the plug-in can convert formats. The specified value is a bitwise combination of zero or more flags from the <b>WMPPlugin_Caps</b> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nf-wmpservices-iwmpplugin-getcaps
     */
    GetCaps(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwFlagsMarshal, pdwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWMPPlugin::AdviseWMPServices method is implemented by the plug-in.
     * @remarks
     * Windows Media Player calls the <b>AdviseWMPServices</b> method on the plug-in to pass in a pointer that the plug-in can then use to call the <b>IWMPServices</b> interface, which contains methods that provide information about the current state of the stream.
     * @param {IWMPServices} pWMPServices Pointer to an <b>IWMPServices</b> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nf-wmpservices-iwmpplugin-advisewmpservices
     */
    AdviseWMPServices(pWMPServices) {
        result := ComCall(7, this, "ptr", pWMPServices, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWMPPlugin::UnAdviseWMPServices method is used to release the pointer provided by AdviseWMPServices.
     * @remarks
     * Windows Media Player calls this method when the pointer provided by <b>AdviseWMPServices</b> is no longer valid. The plug-in should use this method to cease making stream state requests through the pointer.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nf-wmpservices-iwmpplugin-unadvisewmpservices
     */
    UnAdviseWMPServices() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
