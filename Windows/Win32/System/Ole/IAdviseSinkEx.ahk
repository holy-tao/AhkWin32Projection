#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IAdviseSink.ahk" { IAdviseSink }

/**
 * This interface is derived from IAdviseSink to provide extensions for notifying the sink of changes in an object's view status.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iadvisesinkex
 * @namespace Windows.Win32.System.Ole
 */
export default struct IAdviseSinkEx extends IAdviseSink {
    /**
     * The interface identifier for IAdviseSinkEx
     * @type {Guid}
     */
    static IID := Guid("{3af24290-0c96-11ce-a0cf-00aa00600ab8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAdviseSinkEx interfaces
    */
    struct Vtbl extends IAdviseSink.Vtbl {
        OnViewStatusChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAdviseSinkEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the sink that a view status of an object has changed.
     * @remarks
     * It is important that objects call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onviewchange">IAdviseSink:OnViewChange</a> method whenever the object's view changes even when the object is in place active. Containers rely on this notification to keep an object's view up-to-date.
     * @param {Integer} dwViewStatus The new view status. Possible values are from the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-viewstatus">VIEWSTATUS</a> enumeration.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iadvisesinkex-onviewstatuschange
     */
    OnViewStatusChange(dwViewStatus) {
        ComCall(8, this, "uint", dwViewStatus)
    }

    Query(iid) {
        if (IAdviseSinkEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnViewStatusChange := CallbackCreate(GetMethod(implObj, "OnViewStatusChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnViewStatusChange)
    }
}
