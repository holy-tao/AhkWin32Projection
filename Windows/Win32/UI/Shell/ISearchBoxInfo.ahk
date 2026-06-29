#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that allow the caller to retrieve information entered into a search box.
 * @remarks
 * The search box is shown here in a Windows Explorer window frame.
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
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-isearchboxinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISearchBoxInfo extends IUnknown {
    /**
     * The interface identifier for ISearchBoxInfo
     * @type {Guid}
     */
    static IID := Guid("{6af6e03f-d664-4ef4-9626-f7e0ed36755e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchBoxInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCondition : IntPtr
        GetText      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchBoxInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the contents of the search box as an ICondition object.
     * @remarks
     * As opposed to the text string retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-isearchboxinfo-gettext">ISearchBoxInfo::GetText</a>, <b>GetCondition</b> retrieves the same information as a structured object, the methods of which can be used to parse and manipulate the search string.
     * 
     * We recommend that you use the <b>IID_PPV_ARGS</b> macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error in <i>riid</i> that could lead to unexpected results.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-isearchboxinfo-getcondition
     */
    GetCondition(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Retrieves the contents of the search box as plain text.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Pointer to a buffer that, when this method returns successfully, receives the full text entered in the search box.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-isearchboxinfo-gettext
     */
    GetText() {
        result := ComCall(4, this, PWSTR.Ptr, &ppsz := 0, "HRESULT")
        return ppsz
    }

    Query(iid) {
        if (ISearchBoxInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCondition := CallbackCreate(GetMethod(implObj, "GetCondition"), flags, 3)
        this.vtbl.GetText := CallbackCreate(GetMethod(implObj, "GetText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCondition)
        CallbackFree(this.vtbl.GetText)
    }
}
