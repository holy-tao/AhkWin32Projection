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
     * Retrieves the contents of the search box as an ICondition object.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-isearchboxinfo-getcondition
     */
    GetCondition(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Retrieves the contents of the search box as plain text.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Pointer to a buffer that, when this method returns successfully, receives the full text entered in the search box.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-isearchboxinfo-gettext
     */
    GetText() {
        result := ComCall(4, this, "ptr*", &ppsz := 0, "HRESULT")
        return ppsz
    }
}
