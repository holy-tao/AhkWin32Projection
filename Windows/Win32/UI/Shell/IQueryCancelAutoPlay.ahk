#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that programmatically overrides AutoPlay or AutoRun. This allows you to customize the location and type of content that is launched when media is inserted.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  <b>IQueryCancelAutoPlay</b> is intended only for use by user-launched applications that are currently running. It should not be handled by invisible or background service applications to prevent the normal AutoPlay/AutoRun feature from being invoked. Giving the user a choice of what happens when media and devices are inserted into the system is a key feature of the platform. This feature is designed specifically to improve and personalize the user experience and should not be inhibited by background services.</div>
  * <div> </div>
  * A valid use of <b>IQueryCancelAutoPlay</b> is illustrated in the following scenario: Assume that you have, through AutoPlay, previously designated application A to handle video camera events. For video editing, however, you prefer application B. You open application B, begin editing some previously filmed video, and then decide to add some new content to the video being edited. Application B's import function prompts you to turn on the video camera so that the new content can be accessed. Normally, this video device activation would trigger the launch of the device-associated application A. Fortunately, using <b>IQueryCancelAutoPlay</b>, application B has canceled AutoPlay processing of video camera events while you are editing video content. In this case, the cancellation of Autoplay by application B has created a better user experience.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iquerycancelautoplay
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IQueryCancelAutoPlay extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQueryCancelAutoPlay
     * @type {Guid}
     */
    static IID => Guid("{ddefe873-6997-4e68-be26-39b633adbe12}")

    /**
     * The class identifier for QueryCancelAutoPlay
     * @type {Guid}
     */
    static CLSID => Guid("{331f1768-05a9-4ddd-b86e-dae34ddc998a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AllowAutoPlay"]

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} dwContentType 
     * @param {PWSTR} pszLabel 
     * @param {Integer} dwSerialNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iquerycancelautoplay-allowautoplay
     */
    AllowAutoPlay(pszPath, dwContentType, pszLabel, dwSerialNumber) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(3, this, "ptr", pszPath, "uint", dwContentType, "ptr", pszLabel, "uint", dwSerialNumber, "HRESULT")
        return result
    }
}
