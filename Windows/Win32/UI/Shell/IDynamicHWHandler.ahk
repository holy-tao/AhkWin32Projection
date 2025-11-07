#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by AutoPlay. Exposes methods that get dynamic information regarding a registered handler prior to displaying it to the user.
 * @remarks
 * 
 * Prior to this interface, when an application registered a handler and was displayed in the autoplay prompt, the handler was always shown as long as the content type (for example, mp3 or avi) associated with that handler was found on the media device. The same icon and action string were always displayed.
 * 
 * If a handler implements this interface prior to showing the handler,  AutoPlay will first call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-idynamichwhandler-getdynamicinfo">IDynamicHWHandler::GetDynamicInfo</a> to determine if this handler is to be presented to the user. If you want to show the handler, you may specify a different action string than the one supplied by the static handler registration under <b>HKLM</b>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-idynamichwhandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDynamicHWHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDynamicHWHandler
     * @type {Guid}
     */
    static IID => Guid("{dc2601d7-059e-42fc-a09d-2afd21b6d5f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDynamicInfo"]

    /**
     * 
     * @param {PWSTR} pszDeviceID 
     * @param {Integer} dwContentType 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-idynamichwhandler-getdynamicinfo
     */
    GetDynamicInfo(pszDeviceID, dwContentType) {
        pszDeviceID := pszDeviceID is String ? StrPtr(pszDeviceID) : pszDeviceID

        result := ComCall(3, this, "ptr", pszDeviceID, "uint", dwContentType, "ptr*", &ppszAction := 0, "HRESULT")
        return ppszAction
    }
}
