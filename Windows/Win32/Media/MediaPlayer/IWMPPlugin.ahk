#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPPlugin interface is implemented by the plug-in. It manages the connection to Windows Media Player.Note  The interface identifier GUID for this interface changed between the beta release and the final release. .
 * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nn-wmpservices-iwmpplugin
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
     * @param {Pointer} dwPlaybackContext DWORD value that indicates the particular Windows Media Player playback engine to which the plug-in belongs.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nf-wmpservices-iwmpplugin-init
     */
    Init(dwPlaybackContext) {
        result := ComCall(3, this, "ptr", dwPlaybackContext, "HRESULT")
        return result
    }

    /**
     * The IWMPPlugin::Shutdown method is called when Windows Media Player shuts down the plug-in.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nf-wmpservices-iwmpplugin-shutdown
     */
    Shutdown() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The IWMPPlugin::GetID method returns the class id of the plug-in.
     * @param {Pointer<Guid>} pGUID Pointer to a <b>GUID</b> that represents the class id of the plug-in.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nf-wmpservices-iwmpplugin-getid
     */
    GetID(pGUID) {
        result := ComCall(5, this, "ptr", pGUID, "HRESULT")
        return result
    }

    /**
     * The IWMPPlugin::GetCaps method returns a flag that specifies whether the plug-in can convert between an input format and an output format.
     * @param {Pointer<Integer>} pdwFlags Pointer to a variable that specifies whether the plug-in can convert formats. The specified value is a bitwise combination of zero or more flags from the <b>WMPPlugin_Caps</b> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nf-wmpservices-iwmpplugin-getcaps
     */
    GetCaps(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * The IWMPPlugin::AdviseWMPServices method is implemented by the plug-in.
     * @param {IWMPServices} pWMPServices Pointer to an <b>IWMPServices</b> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nf-wmpservices-iwmpplugin-advisewmpservices
     */
    AdviseWMPServices(pWMPServices) {
        result := ComCall(7, this, "ptr", pWMPServices, "HRESULT")
        return result
    }

    /**
     * The IWMPPlugin::UnAdviseWMPServices method is used to release the pointer provided by AdviseWMPServices.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nf-wmpservices-iwmpplugin-unadvisewmpservices
     */
    UnAdviseWMPServices() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
