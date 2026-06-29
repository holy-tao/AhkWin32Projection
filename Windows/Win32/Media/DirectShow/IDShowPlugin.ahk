#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDShowPlugin interface enables the Windows Media Source filter to communicate with the Windows Media Player 6.4 Plug-in for Netscape Navigator.
 * @remarks
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nn-qnetwork-idshowplugin
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDShowPlugin extends IUnknown {
    /**
     * The interface identifier for IDShowPlugin
     * @type {Guid}
     */
    static IID := Guid("{4746b7c8-700e-11d1-becc-00c04fb6e937}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDShowPlugin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_URL       : IntPtr
        get_UserAgent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDShowPlugin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    URL {
        get => this.get_URL()
    }

    /**
     */
    UserAgent {
        get => this.get_UserAgent()
    }

    /**
     * The get_URL method retrieves the URL of the current web page.
     * @remarks
     * The caller must release the returned <b>BSTR</b>, by calling <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} pURL Receives the URL.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-idshowplugin-get_url
     */
    get_URL(pURL) {
        result := ComCall(3, this, BSTR.Ptr, pURL, "HRESULT")
        return result
    }

    /**
     * The get_UserAgent method retrieves the User-Agent field from the HTTP header.
     * @remarks
     * The caller must release the returned <b>BSTR</b>, by calling <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} pUserAgent Pointer to a variable that receives the User-Agent string.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-idshowplugin-get_useragent
     */
    get_UserAgent(pUserAgent) {
        result := ComCall(4, this, BSTR.Ptr, pUserAgent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDShowPlugin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_URL := CallbackCreate(GetMethod(implObj, "get_URL"), flags, 2)
        this.vtbl.get_UserAgent := CallbackCreate(GetMethod(implObj, "get_UserAgent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_URL)
        CallbackFree(this.vtbl.get_UserAgent)
    }
}
