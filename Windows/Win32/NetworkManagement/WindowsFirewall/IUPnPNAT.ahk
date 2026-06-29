#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INATEventManager.ahk" { INATEventManager }
#Import ".\IStaticPortMappingCollection.ahk" { IStaticPortMappingCollection }
#Import ".\IDynamicPortMappingCollection.ahk" { IDynamicPortMappingCollection }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IUPnPNAT interface is the primary interface for managing Network Address Translation (NAT) with UPnP. The IUPnPNAT interface provides access directly or indirectly to all the other interfaces in the NAT API with UPnP technology.
 * @see https://learn.microsoft.com/windows/win32/api/natupnp/nn-natupnp-iupnpnat
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct IUPnPNAT extends IDispatch {
    /**
     * The interface identifier for IUPnPNAT
     * @type {Guid}
     */
    static IID := Guid("{b171c812-cc76-485a-94d8-b6b3a2794e99}")

    /**
     * The class identifier for UPnPNAT
     * @type {Guid}
     */
    static CLSID := Guid("{ae1e00aa-3fd5-403c-8a27-2bbdc30cd0e1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPNAT interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_StaticPortMappingCollection  : IntPtr
        get_DynamicPortMappingCollection : IntPtr
        get_NATEventManager              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPNAT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IStaticPortMappingCollection} 
     */
    StaticPortMappingCollection {
        get => this.get_StaticPortMappingCollection()
    }

    /**
     * @type {IDynamicPortMappingCollection} 
     */
    DynamicPortMappingCollection {
        get => this.get_DynamicPortMappingCollection()
    }

    /**
     * @type {INATEventManager} 
     */
    NATEventManager {
        get => this.get_NATEventManager()
    }

    /**
     * The get_StaticPortMappingCollection method retrieves an interface for the collection of static port mappings on the NAT used by the local computer.
     * @returns {IStaticPortMappingCollection} Pointer to an interface pointer that points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/natupnp/nn-natupnp-istaticportmappingcollection">IStaticPortMappingCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-iupnpnat-get_staticportmappingcollection
     */
    get_StaticPortMappingCollection() {
        result := ComCall(7, this, "ptr*", &ppSPMs := 0, "HRESULT")
        return IStaticPortMappingCollection(ppSPMs)
    }

    /**
     * The IUPnPNAT interface is the primary interface for managing Network Address Translation (NAT) with UPnP. The IUPnPNAT interface provides access directly or indirectly to all the other interfaces in the NAT API with UPnP technology.
     * @returns {IDynamicPortMappingCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nn-natupnp-iupnpnat
     */
    get_DynamicPortMappingCollection() {
        result := ComCall(8, this, "ptr*", &ppDPMs := 0, "HRESULT")
        return IDynamicPortMappingCollection(ppDPMs)
    }

    /**
     * The get_NATEventManager method retrieves an INATEventManager interface for the NAT used by the local computer.
     * @returns {INATEventManager} Pointer to an interface pointer that points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/natupnp/nn-natupnp-inateventmanager">INATEventManager</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-iupnpnat-get_nateventmanager
     */
    get_NATEventManager() {
        result := ComCall(9, this, "ptr*", &ppNEM := 0, "HRESULT")
        return INATEventManager(ppNEM)
    }

    Query(iid) {
        if (IUPnPNAT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StaticPortMappingCollection := CallbackCreate(GetMethod(implObj, "get_StaticPortMappingCollection"), flags, 2)
        this.vtbl.get_DynamicPortMappingCollection := CallbackCreate(GetMethod(implObj, "get_DynamicPortMappingCollection"), flags, 2)
        this.vtbl.get_NATEventManager := CallbackCreate(GetMethod(implObj, "get_NATEventManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StaticPortMappingCollection)
        CallbackFree(this.vtbl.get_DynamicPortMappingCollection)
        CallbackFree(this.vtbl.get_NATEventManager)
    }
}
