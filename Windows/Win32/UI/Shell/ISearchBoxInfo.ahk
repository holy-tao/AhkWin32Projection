#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow the caller to retrieve information entered into a search box.
 * @remarks
 * 
  * The search box is shown here in an Windows Explorer window frame.
  * 
  * 
  * 
  * <img alt="Screen shot of upper-right corner of explorer frame showing search box" src="./images/searchbox.jpg"/>
  * The frame that contains the search box might also be hosted in another window or in the common file dialog box.
  * 
  * To access the search dialog, use <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">QueryService</a> using SID_SSearchBoxInfo on a site pointer within the Windows Explorer window.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * An implementation of this interface is provided with Windows. Third parties do not need to implement their own version.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-isearchboxinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISearchBoxInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchBoxInfo
     * @type {Guid}
     */
    static IID => Guid("{6af6e03f-d664-4ef4-9626-f7e0ed36755e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCondition", "GetText"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-isearchboxinfo-getcondition
     */
    GetCondition(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppsz 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-isearchboxinfo-gettext
     */
    GetText(ppsz) {
        result := ComCall(4, this, "ptr", ppsz, "HRESULT")
        return result
    }
}
