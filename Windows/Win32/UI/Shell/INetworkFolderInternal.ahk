#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INetworkFolderInternal extends IUnknown {
    /**
     * The interface identifier for INetworkFolderInternal
     * @type {Guid}
     */
    static IID := Guid("{ceb38218-c971-47bb-a703-f0bc99ccdb81}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetworkFolderInternal interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetResourceDisplayType : IntPtr
        GetIDList              : IntPtr
        GetProvider            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetworkFolderInternal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetResourceDisplayType() {
        result := ComCall(3, this, "uint*", &displayType := 0, "HRESULT")
        return displayType
    }

    /**
     * 
     * @returns {Pointer<ITEMIDLIST>} 
     */
    GetIDList() {
        result := ComCall(4, this, "ptr*", &idList := 0, "HRESULT")
        return idList
    }

    /**
     * 
     * @param {Integer} itemIdCount 
     * @param {Pointer<Pointer<ITEMIDLIST>>} itemIds 
     * @param {Integer} providerMaxLength 
     * @param {PWSTR} provider 
     * @returns {HRESULT} 
     */
    GetProvider(itemIdCount, itemIds, providerMaxLength, provider) {
        provider := provider is String ? StrPtr(provider) : provider

        itemIdsMarshal := itemIds is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", itemIdCount, itemIdsMarshal, itemIds, "uint", providerMaxLength, "ptr", provider, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetworkFolderInternal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetResourceDisplayType := CallbackCreate(GetMethod(implObj, "GetResourceDisplayType"), flags, 2)
        this.vtbl.GetIDList := CallbackCreate(GetMethod(implObj, "GetIDList"), flags, 2)
        this.vtbl.GetProvider := CallbackCreate(GetMethod(implObj, "GetProvider"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetResourceDisplayType)
        CallbackFree(this.vtbl.GetIDList)
        CallbackFree(this.vtbl.GetProvider)
    }
}
