#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPServices.ahk" { IWMPServices }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPPlugin interface is implemented by the plug-in. It manages the connection to Windows Media Player.Note  The interface identifier GUID for this interface changed between the beta release and the final release. .
 * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nn-wmpservices-iwmpplugin
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPPlugin extends IUnknown {
    /**
     * The interface identifier for IWMPPlugin
     * @type {Guid}
     */
    static IID := Guid("{f1392a70-024c-42bb-a998-73dfdfe7d5a7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPPlugin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init                : IntPtr
        Shutdown            : IntPtr
        GetID               : IntPtr
        GetCaps             : IntPtr
        AdviseWMPServices   : IntPtr
        UnAdviseWMPServices : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPPlugin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWMPPlugin::Init method is called when Windows Media Player initializes the plug-in.
     * @remarks
     * It is possible at any given time that multiple instances of Windows Media Player could be running in the same process. For instance, multiple Windows Media Player control instances could be embedded in the same browser window, or even in multiple instances of a browser that coexist in the same process. It is also possible that the same instance of Windows Media Player could create multiple playback engines at the same time. The <i>dwPlaybackContext</i> value allows you to determine which instance of the Windows Media Player playback engine contains the plug-in. This is useful if you wish to enable multiple plug-ins to connect to each other.
     * 
     * <b>Init</b> and <b>Shutdown</b> will always be called on the same thread.
     * @param {Pointer} dwPlaybackContext DWORD value that indicates the particular Windows Media Player playback engine to which the plug-in belongs.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpplugin-init
     */
    Init(dwPlaybackContext) {
        result := ComCall(3, this, "ptr", dwPlaybackContext, "HRESULT")
        return result
    }

    /**
     * The IWMPPlugin::Shutdown method is called when Windows Media Player shuts down the plug-in.
     * @remarks
     * <b>Init</b> and <b>Shutdown</b> will always be called on the same thread.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpplugin-shutdown
     */
    Shutdown() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The IWMPPlugin::GetID method returns the class id of the plug-in.
     * @remarks
     * For more information on the <b>GUID</b> structure, see the Platform SDK.
     * @param {Pointer<Guid>} pGUID Pointer to a <b>GUID</b> that represents the class id of the plug-in.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpplugin-getid
     */
    GetID(pGUID) {
        result := ComCall(5, this, Guid.Ptr, pGUID, "HRESULT")
        return result
    }

    /**
     * The IWMPPlugin::GetCaps method returns a flag that specifies whether the plug-in can convert between an input format and an output format.
     * @remarks
     * There are currently two possible [out] values that the plug-in may specify: zero to indicate that the plug-in can convert formats, or <b>WMPPlugin_Caps_CannotConvertFormats</b>, which forces Windows Media Player to handle any necessary format conversion.
     * @param {Pointer<Integer>} pdwFlags Pointer to a variable that specifies whether the plug-in can convert formats. The specified value is a bitwise combination of zero or more flags from the <b>WMPPlugin_Caps</b> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpplugin-getcaps
     */
    GetCaps(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * The IWMPPlugin::AdviseWMPServices method is implemented by the plug-in.
     * @remarks
     * Windows Media Player calls the <b>AdviseWMPServices</b> method on the plug-in to pass in a pointer that the plug-in can then use to call the <b>IWMPServices</b> interface, which contains methods that provide information about the current state of the stream.
     * @param {IWMPServices} pWMPServices Pointer to an <b>IWMPServices</b> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpplugin-advisewmpservices
     */
    AdviseWMPServices(pWMPServices) {
        result := ComCall(7, this, "ptr", pWMPServices, "HRESULT")
        return result
    }

    /**
     * The IWMPPlugin::UnAdviseWMPServices method is used to release the pointer provided by AdviseWMPServices.
     * @remarks
     * Windows Media Player calls this method when the pointer provided by <b>AdviseWMPServices</b> is no longer valid. The plug-in should use this method to cease making stream state requests through the pointer.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpplugin-unadvisewmpservices
     */
    UnAdviseWMPServices() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPPlugin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 2)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 1)
        this.vtbl.GetID := CallbackCreate(GetMethod(implObj, "GetID"), flags, 2)
        this.vtbl.GetCaps := CallbackCreate(GetMethod(implObj, "GetCaps"), flags, 2)
        this.vtbl.AdviseWMPServices := CallbackCreate(GetMethod(implObj, "AdviseWMPServices"), flags, 2)
        this.vtbl.UnAdviseWMPServices := CallbackCreate(GetMethod(implObj, "UnAdviseWMPServices"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.Shutdown)
        CallbackFree(this.vtbl.GetID)
        CallbackFree(this.vtbl.GetCaps)
        CallbackFree(this.vtbl.AdviseWMPServices)
        CallbackFree(this.vtbl.UnAdviseWMPServices)
    }
}
