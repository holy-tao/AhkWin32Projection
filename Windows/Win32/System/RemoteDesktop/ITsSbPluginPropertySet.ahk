#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITsSbPropertySet.ahk" { ITsSbPropertySet }

/**
 * Can be used to define custom plug-in properties as appropriate.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbpluginpropertyset
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbPluginPropertySet extends ITsSbPropertySet {
    /**
     * The interface identifier for ITsSbPluginPropertySet
     * @type {Guid}
     */
    static IID := Guid("{95006e34-7eff-4b6c-bb40-49a4fda7cea6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbPluginPropertySet interfaces
    */
    struct Vtbl extends ITsSbPropertySet.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbPluginPropertySet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ITsSbPluginPropertySet.IID.Equals(iid)) {
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
