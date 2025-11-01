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
     * 
     * @param {Integer} EntryNum 
     * @param {BSTR} bstrName 
     * @param {Pointer<BSTR>} pbstrValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent2-get_mediaparameter
     */
    get_MediaParameter(EntryNum, bstrName, pbstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, "int", EntryNum, "ptr", bstrName, "ptr", pbstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EntryNum 
     * @param {Integer} Index 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent2-get_mediaparametername
     */
    get_MediaParameterName(EntryNum, Index, pbstrName) {
        result := ComCall(8, this, "int", EntryNum, "int", Index, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pNumberEntries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent2-get_playlistcount
     */
    get_PlaylistCount(pNumberEntries) {
        result := ComCall(9, this, "int*", pNumberEntries, "HRESULT")
        return result
    }
}
