#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITsSbPlugin.ahk" { ITsSbPlugin }

/**
 * Exposes methods that extend the capabilities of Remote Desktop Connection Broker (RD Connection Broker).
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbresourceplugin
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbResourcePlugin extends ITsSbPlugin {
    /**
     * The interface identifier for ITsSbResourcePlugin
     * @type {Guid}
     */
    static IID := Guid("{ea8db42c-98ed-4535-a88b-2a164f35490f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbResourcePlugin interfaces
    */
    struct Vtbl extends ITsSbPlugin.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbResourcePlugin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ITsSbResourcePlugin.IID.Equals(iid)) {
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
