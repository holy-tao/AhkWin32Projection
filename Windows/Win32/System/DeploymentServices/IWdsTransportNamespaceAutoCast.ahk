#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWdsTransportNamespace.ahk" { IWdsTransportNamespace }

/**
 * The WDS transport server can create, start, and end multicast sessions that are hosted by a namespace object of this interface.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespaceautocast
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportNamespaceAutoCast extends IWdsTransportNamespace {
    /**
     * The interface identifier for IWdsTransportNamespaceAutoCast
     * @type {Guid}
     */
    static IID := Guid("{ad931a72-c4bd-4c41-8fbc-59c9c748df9e}")

    /**
     * The class identifier for WdsTransportNamespaceAutoCast
     * @type {Guid}
     */
    static CLSID := Guid("{b091f5a8-6a99-478d-b23b-09e8fee04574}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportNamespaceAutoCast interfaces
    */
    struct Vtbl extends IWdsTransportNamespace.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportNamespaceAutoCast.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IWdsTransportNamespaceAutoCast.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
