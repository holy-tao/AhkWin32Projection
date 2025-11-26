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
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetTransactionType method retrieves the type of the current transaction.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmptransactiontype">WMPTransactionType</a> that receives the transaction type value.
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentcontainerlist-gettransactiontype
     */
    GetTransactionType() {
        result := ComCall(3, this, "int*", &pwmptt := 0, "HRESULT")
        return pwmptt
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetContainerCount method retrieves the count of content containers in the container list.
     * @returns {Integer} Address of a <b>ULONG</b> that receives the count.
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentcontainerlist-getcontainercount
     */
    GetContainerCount() {
        result := ComCall(4, this, "uint*", &pcContainer := 0, "HRESULT")
        return pcContainer
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetContainer method retrieves the content container at the specified index.
     * @param {Integer} idxContainer Specifies the index of the content container to retrieve.
     * @returns {IWMPContentContainer} Address of a variable that receives a pointer to the <b>IWMPContentContainer</b> interface at the specified index.
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentcontainerlist-getcontainer
     */
    GetContainer(idxContainer) {
        result := ComCall(5, this, "uint", idxContainer, "ptr*", &ppContent := 0, "HRESULT")
        return IWMPContentContainer(ppContent)
    }
}
