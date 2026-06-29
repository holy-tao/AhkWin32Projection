#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that enable clients to access items in a collection of objects that support IUnknown.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Clients do not need to implement this interface.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use this interface to access generic objects in an array.
 * @see https://learn.microsoft.com/windows/win32/api/objectarray/nn-objectarray-iobjectarray
 * @namespace Windows.Win32.UI.Shell.Common
 */
export default struct IObjectArray extends IUnknown {
    /**
     * The interface identifier for IObjectArray
     * @type {Guid}
     */
    static IID := Guid("{92ca9dcd-5622-4bba-a805-5e9f541bd8c9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectArray interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount : IntPtr
        GetAt    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectArray.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides a count of the objects in the collection.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The number of objects in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/objectarray/nf-objectarray-iobjectarray-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pcObjects := 0, "HRESULT")
        return pcObjects
    }

    /**
     * Provides a pointer to a specified object's interface. The object and interface are specified by index and interface ID.
     * @param {Integer} uiIndex Type: <b>UINT</b>
     * 
     * The index of the object
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the desired interface ID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives the interface pointer requested in <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/objectarray/nf-objectarray-iobjectarray-getat
     */
    GetAt(uiIndex, riid) {
        result := ComCall(4, this, "uint", uiIndex, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IObjectArray.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
    }
}
