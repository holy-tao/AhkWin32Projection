#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAdviseSink.ahk" { IAdviseSink }
#Import ".\IMoniker.ahk" { IMoniker }

/**
 * The IAdviseSink2 interface is an extension of the IAdviseSink interface, adding the method OnLinkSrcChange to the contract to handle a change in the moniker of a linked object.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-iadvisesink2
 * @namespace Windows.Win32.System.Com
 */
export default struct IAdviseSink2 extends IAdviseSink {
    /**
     * The interface identifier for IAdviseSink2
     * @type {Guid}
     */
    static IID := Guid("{00000125-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAdviseSink2 interfaces
    */
    struct Vtbl extends IAdviseSink.Vtbl {
        OnLinkSrcChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAdviseSink2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the container that registered the advise sink that a link source has changed (either name or location), enabling the container to update the link's moniker.
     * @remarks
     * A container of linked objects implements this method to receive notification in the event of a change in the moniker of its link source.
     * 
     * <b>OnLinkSrcChange</b> is called by the OLE link object when it receives the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onrename">OnRename</a> notification from the link-source (object) application. The link object updates its moniker and sends the <b>OnLinkSrcChange</b> notification to containers that have implemented <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink2">IAdviseSink2</a>.
     * 
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Nothing prevents a link object from notifying its container of the moniker change by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onrename">OnRename</a> instead of <b>OnLinkSrcChange</b>. In practice, however, overloading <b>OnRename</b> to mean either that a link object's moniker has changed or that an embedded object's server name has changed makes it difficult for applications to determine which of these events has occurred. If the two events trigger different processing, as will often be the case, calling a different method for each makes the job of determining which event occurred much easier.
     * @param {IMoniker} pmk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface identifying the source of a linked object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iadvisesink2-onlinksrcchange
     */
    OnLinkSrcChange(pmk) {
        ComCall(8, this, "ptr", pmk)
    }

    Query(iid) {
        if (IAdviseSink2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnLinkSrcChange := CallbackCreate(GetMethod(implObj, "OnLinkSrcChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnLinkSrcChange)
    }
}
