#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Called by AutoPlay. Exposes methods that get dynamic information regarding a registered handler prior to displaying it to the user.
 * @remarks
 * Prior to this interface, when an application registered a handler and was displayed in the autoplay prompt, the handler was always shown as long as the content type (for example, mp3 or avi) associated with that handler was found on the media device. The same icon and action string were always displayed.
 * 
 * If a handler implements this interface prior to showing the handler,  AutoPlay will first call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-idynamichwhandler-getdynamicinfo">IDynamicHWHandler::GetDynamicInfo</a> to determine if this handler is to be presented to the user. If you want to show the handler, you may specify a different action string than the one supplied by the static handler registration under <b>HKLM</b>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-idynamichwhandler
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDynamicHWHandler extends IUnknown {
    /**
     * The interface identifier for IDynamicHWHandler
     * @type {Guid}
     */
    static IID := Guid("{dc2601d7-059e-42fc-a09d-2afd21b6d5f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDynamicHWHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDynamicInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDynamicHWHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the system to determine whether a particular handler will be shown before the AutoPlay dialog is displayed.
     * @remarks
     * To register a dynamic handler, add a REG_SZ named "DynamicHWHandlerCLSID" and assign it the CLSID of your IDynamicHWHandler implementation.
     * 
     * Example:
     * 
     * 
     * <pre><b>HKLM</b>
     *    <b>Software</b>
     *       <b>Microsoft</b>
     *          <b>Windows</b>
     *             <b>CurrentVersion</b>
     *                <b>Explorer</b>
     *                   <b>AutoplayHandlers</b>
     *                      <b>Handlers</b>
     *                         <b>YourHandler</b>
     *                            <b>DynamicHWHandlerCLSID</b> = [REG_SZ] {xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}</pre>
     * @param {PWSTR} pszDeviceID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that indicates the device path or drive root.
     * @param {Integer} dwContentType Type: <b>DWORD</b>
     * 
     * The content type.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A pointer to the new action string, or <b>NULL</b> if the default action string is to be used.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-idynamichwhandler-getdynamicinfo
     */
    GetDynamicInfo(pszDeviceID, dwContentType) {
        pszDeviceID := pszDeviceID is String ? StrPtr(pszDeviceID) : pszDeviceID

        result := ComCall(3, this, "ptr", pszDeviceID, "uint", dwContentType, PWSTR.Ptr, &ppszAction := 0, "HRESULT")
        return ppszAction
    }

    Query(iid) {
        if (IDynamicHWHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDynamicInfo := CallbackCreate(GetMethod(implObj, "GetDynamicInfo"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDynamicInfo)
    }
}
