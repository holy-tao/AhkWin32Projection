#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPContentContainer.ahk
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainerlist-gettransactiontype
     */
    GetTransactionType() {
        result := ComCall(3, this, "int*", &pwmptt := 0, "HRESULT")
        return pwmptt
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainerlist-getcontainercount
     */
    GetContainerCount() {
        result := ComCall(4, this, "uint*", &pcContainer := 0, "HRESULT")
        return pcContainer
    }

    /**
     * 
     * @param {Integer} idxContainer 
     * @returns {IWMPContentContainer} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainerlist-getcontainer
     */
    GetContainer(idxContainer) {
        result := ComCall(5, this, "uint", idxContainer, "ptr*", &ppContent := 0, "HRESULT")
        return IWMPContentContainer(ppContent)
    }
}
