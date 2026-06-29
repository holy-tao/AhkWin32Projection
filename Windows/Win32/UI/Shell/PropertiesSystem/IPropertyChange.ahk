#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IObjectWithPropertyKey.ahk" { IObjectWithPropertyKey }

/**
 * Exposes a method that encapsulates a change to a single property.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertychange
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyChange extends IObjectWithPropertyKey {
    /**
     * The interface identifier for IPropertyChange
     * @type {Guid}
     */
    static IID := Guid("{f917bc8a-1bba-4478-a245-1bde03eb9431}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyChange interfaces
    */
    struct Vtbl extends IObjectWithPropertyKey.Vtbl {
        ApplyToPropVariant : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyChange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Applies a change to a property value.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * A pointer to a changed <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychange-applytopropvariant
     */
    ApplyToPropVariant(propvarIn) {
        ppropvarOut := PROPVARIANT()
        result := ComCall(5, this, PROPVARIANT.Ptr, propvarIn, PROPVARIANT.Ptr, ppropvarOut, "HRESULT")
        return ppropvarOut
    }

    Query(iid) {
        if (IPropertyChange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ApplyToPropVariant := CallbackCreate(GetMethod(implObj, "ApplyToPropVariant"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ApplyToPropVariant)
    }
}
