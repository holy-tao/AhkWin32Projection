#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that creates an object of a specified class.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-icreateobject
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct ICreateObject extends IUnknown {
    /**
     * The interface identifier for ICreateObject
     * @type {Guid}
     */
    static IID := Guid("{75121952-e0d0-43e5-9380-1d80483acf72}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICreateObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICreateObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a local object of a specified class and returns a pointer to a specified interface on the object.
     * @remarks
     * This method can be used with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystorewithcreateobject">GetPropertyStoreWithCreateObject</a>.
     * @param {Pointer<Guid>} clsid Type: <b>REFCLSID</b>
     * 
     * A reference to a CLSID.
     * @param {IUnknown} pUnkOuter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface that aggregates the object created by this function, or <b>NULL</b> if no aggregation is desired.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface the created object should return.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of the pointer to the interface requested in <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-icreateobject-createobject
     */
    CreateObject(clsid, pUnkOuter, riid) {
        result := ComCall(3, this, Guid.Ptr, clsid, "ptr", pUnkOuter, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (ICreateObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateObject := CallbackCreate(GetMethod(implObj, "CreateObject"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateObject)
    }
}
