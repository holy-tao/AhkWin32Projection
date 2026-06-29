#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IAMMediaContent2 interface retrieves custom parameters and playlists from ASX files. This interface is not implemented by any default components in DirectShow.
 * @remarks
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nn-qnetwork-iammediacontent2
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMMediaContent2 extends IDispatch {
    /**
     * The interface identifier for IAMMediaContent2
     * @type {Guid}
     */
    static IID := Guid("{ce8f78c1-74d9-11d2-b09d-00a0c9a81117}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMMediaContent2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_MediaParameter     : IntPtr
        get_MediaParameterName : IntPtr
        get_PlaylistCount      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMMediaContent2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    PlaylistCount {
        get => this.get_PlaylistCount()
    }

    /**
     * The get_MediaParameter method retrieves the value of a custom parameter in the ASX file.
     * @remarks
     * The caller must release the <b>BSTR</b> returned in <i>pbstrValue</i>, by calling <b>SysFreeString</b>.
     * @param {Integer} EntryNum Specifies the location of the parameter in the ASX file.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>The parameter is a direct child of the ASX node.</td>
     * </tr>
     * <tr>
     * <td>&gt; 0</td>
     * <td>The parameter is located inside an ENTRY tag; <i>EntryNum</i> specifies the entry, indexed from 1.</td>
     * </tr>
     * </table>
     * @param {BSTR} bstrName Specifies the name of the parameter.
     * @param {Pointer<BSTR>} pbstrValue Pointer to a variable that receives the value of the parameter.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent2-get_mediaparameter
     */
    get_MediaParameter(EntryNum, bstrName, pbstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, "int", EntryNum, BSTR, bstrName, BSTR.Ptr, pbstrValue, "HRESULT")
        return result
    }

    /**
     * The get_MediaParameterName method retrieves the name of a custom parameter in an ASX file.
     * @remarks
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @param {Integer} EntryNum Specifies the location of the parameter in the ASX file.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>The parameter is a direct child of the ASX node.</td>
     * </tr>
     * <tr>
     * <td>&gt; 0</td>
     * <td>The parameter is located inside an ENTRY tag; <i>EntryNum</i> specifies the entry, indexed from 1.</td>
     * </tr>
     * </table>
     * @param {Integer} Index Specifies the index of the parameter to retrieve, indexed from 1.
     * @param {Pointer<BSTR>} pbstrName Pointer to a variable that receives the parameter name.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent2-get_mediaparametername
     */
    get_MediaParameterName(EntryNum, Index, pbstrName) {
        result := ComCall(8, this, "int", EntryNum, "int", Index, BSTR.Ptr, pbstrName, "HRESULT")
        return result
    }

    /**
     * The get_PlaylistCount method retrieves the number of entries in an ASX file.
     * @param {Pointer<Integer>} pNumberEntries Pointer to a variable that receives the number of entries.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent2-get_playlistcount
     */
    get_PlaylistCount(pNumberEntries) {
        pNumberEntriesMarshal := pNumberEntries is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pNumberEntriesMarshal, pNumberEntries, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMMediaContent2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MediaParameter := CallbackCreate(GetMethod(implObj, "get_MediaParameter"), flags, 4)
        this.vtbl.get_MediaParameterName := CallbackCreate(GetMethod(implObj, "get_MediaParameterName"), flags, 4)
        this.vtbl.get_PlaylistCount := CallbackCreate(GetMethod(implObj, "get_PlaylistCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MediaParameter)
        CallbackFree(this.vtbl.get_MediaParameterName)
        CallbackFree(this.vtbl.get_PlaylistCount)
    }
}
