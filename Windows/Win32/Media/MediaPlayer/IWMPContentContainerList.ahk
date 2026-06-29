#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMPContentContainer.ahk" { IWMPContentContainer }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WMPTransactionType.ahk" { WMPTransactionType }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nn-contentpartner-iwmpcontentcontainerlist
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPContentContainerList extends IUnknown {
    /**
     * The interface identifier for IWMPContentContainerList
     * @type {Guid}
     */
    static IID := Guid("{a9937f78-0802-4af8-8b8d-e3f045bc8ab5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPContentContainerList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTransactionType : IntPtr
        GetContainerCount  : IntPtr
        GetContainer       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPContentContainerList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetTransactionType method retrieves the type of the current transaction.
     * @returns {WMPTransactionType} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmptransactiontype">WMPTransactionType</a> that receives the transaction type value.
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainerlist-gettransactiontype
     */
    GetTransactionType() {
        result := ComCall(3, this, "int*", &pwmptt := 0, "HRESULT")
        return pwmptt
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetContainerCount method retrieves the count of content containers in the container list.
     * @returns {Integer} Address of a <b>ULONG</b> that receives the count.
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainerlist-getcontainercount
     */
    GetContainerCount() {
        result := ComCall(4, this, "uint*", &pcContainer := 0, "HRESULT")
        return pcContainer
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetContainer method retrieves the content container at the specified index.
     * @param {Integer} idxContainer Specifies the index of the content container to retrieve.
     * @returns {IWMPContentContainer} Address of a variable that receives a pointer to the <b>IWMPContentContainer</b> interface at the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainerlist-getcontainer
     */
    GetContainer(idxContainer) {
        result := ComCall(5, this, "uint", idxContainer, "ptr*", &ppContent := 0, "HRESULT")
        return IWMPContentContainer(ppContent)
    }

    Query(iid) {
        if (IWMPContentContainerList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTransactionType := CallbackCreate(GetMethod(implObj, "GetTransactionType"), flags, 2)
        this.vtbl.GetContainerCount := CallbackCreate(GetMethod(implObj, "GetContainerCount"), flags, 2)
        this.vtbl.GetContainer := CallbackCreate(GetMethod(implObj, "GetContainer"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTransactionType)
        CallbackFree(this.vtbl.GetContainerCount)
        CallbackFree(this.vtbl.GetContainer)
    }
}
