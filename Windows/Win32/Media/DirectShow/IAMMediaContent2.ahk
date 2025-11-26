#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IAMMediaContent2 interface retrieves custom parameters and playlists from ASX files. This interface is not implemented by any default components in DirectShow.
 * @remarks
 * 
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * 
 * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nn-qnetwork-iammediacontent2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMMediaContent2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMMediaContent2
     * @type {Guid}
     */
    static IID => Guid("{ce8f78c1-74d9-11d2-b09d-00a0c9a81117}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaParameter", "get_MediaParameterName", "get_PlaylistCount"]

    /**
     */
    PlaylistCount {
        get => this.get_PlaylistCount()
    }

    /**
     * The get_MediaParameter method retrieves the value of a custom parameter in the ASX file.
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
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iammediacontent2-get_mediaparameter
     */
    get_MediaParameter(EntryNum, bstrName, pbstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, "int", EntryNum, "ptr", bstrName, "ptr", pbstrValue, "HRESULT")
        return result
    }

    /**
     * The get_MediaParameterName method retrieves the name of a custom parameter in an ASX file.
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
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iammediacontent2-get_mediaparametername
     */
    get_MediaParameterName(EntryNum, Index, pbstrName) {
        result := ComCall(8, this, "int", EntryNum, "int", Index, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * The get_PlaylistCount method retrieves the number of entries in an ASX file.
     * @param {Pointer<Integer>} pNumberEntries Pointer to a variable that receives the number of entries.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iammediacontent2-get_playlistcount
     */
    get_PlaylistCount(pNumberEntries) {
        pNumberEntriesMarshal := pNumberEntries is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pNumberEntriesMarshal, pNumberEntries, "HRESULT")
        return result
    }
}
