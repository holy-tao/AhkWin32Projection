#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * IUISimplePropertySet is a read-only interface that defines a method for retrieving the value identified by a property key.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nn-uiribbon-iuisimplepropertyset
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct IUISimplePropertySet extends IUnknown {
    /**
     * The interface identifier for IUISimplePropertySet
     * @type {Guid}
     */
    static IID := Guid("{c205bb48-5b1c-4219-a106-15bd0a5f24e2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUISimplePropertySet interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUISimplePropertySet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the value identified by a property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-reference-properties">Property Key</a> of interest.
     * @returns {PROPVARIANT} Type: <b>PROPVARIANT*</b>
     * 
     * When this method returns, contains a pointer to the value for 
     * 					<i>key</i>.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuisimplepropertyset-getvalue
     */
    GetValue(key) {
        value := PROPVARIANT()
        result := ComCall(3, this, PROPERTYKEY.Ptr, key, PROPVARIANT.Ptr, value, "HRESULT")
        return value
    }

    Query(iid) {
        if (IUISimplePropertySet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetValue)
    }
}
