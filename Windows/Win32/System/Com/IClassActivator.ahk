#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Specifies a method that retrieves a class object.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-iclassactivator
 * @namespace Windows.Win32.System.Com
 */
export default struct IClassActivator extends IUnknown {
    /**
     * The interface identifier for IClassActivator
     * @type {Guid}
     */
    static IID := Guid("{00000140-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IClassActivator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClassObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IClassActivator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a class object.
     * @param {Pointer<Guid>} rclsid The CLSID that identifies the class whose class object is to be retrieved.
     * @param {Integer} dwClassContext The context in which the class is expected to run. For a list of values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {Integer} locale An LCID constant as defined in WinNls.h.
     * @param {Pointer<Guid>} riid The IID of the interface on the object to which a pointer is desired.
     * @returns {Pointer<Void>} The address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppv</i> contains the requested interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iclassactivator-getclassobject
     */
    GetClassObject(rclsid, dwClassContext, locale, riid) {
        result := ComCall(3, this, Guid.Ptr, rclsid, "uint", dwClassContext, "uint", locale, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IClassActivator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClassObject := CallbackCreate(GetMethod(implObj, "GetClassObject"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClassObject)
    }
}
