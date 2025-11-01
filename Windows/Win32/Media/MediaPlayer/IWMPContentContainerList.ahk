#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nn-contentpartner-iwmpcontentcontainerlist
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPContentContainerList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPContentContainerList
     * @type {Guid}
     */
    static IID => Guid("{a9937f78-0802-4af8-8b8d-e3f045bc8ab5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTransactionType", "GetContainerCount", "GetContainer"]

    /**
     * 
     * @param {Pointer<Integer>} pwmptt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainerlist-gettransactiontype
     */
    GetTransactionType(pwmptt) {
        result := ComCall(3, this, "int*", pwmptt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcContainer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainerlist-getcontainercount
     */
    GetContainerCount(pcContainer) {
        result := ComCall(4, this, "uint*", pcContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} idxContainer 
     * @param {Pointer<IWMPContentContainer>} ppContent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainerlist-getcontainer
     */
    GetContainer(idxContainer, ppContent) {
        result := ComCall(5, this, "uint", idxContainer, "ptr*", ppContent, "HRESULT")
        return result
    }
}
