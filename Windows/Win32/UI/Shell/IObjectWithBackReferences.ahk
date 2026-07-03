#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method for interacting with back references held by an object.
 * @remarks
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * When an object contains forward references to child objects that have back references to the parent object, circular references can occur. To break this circle, the parent object needs to keep track of back references from child objects.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * This interface should be implemented by Shell data source objects (objects that implement <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>) that hold references to other objects in a way that might result in reference cycles. For example, an object that maintains references to other data source objects that are cached as the result of binding operations should implement this interface.
 * 
 * This interface was available in Windows Vista with Service Pack 1 (SP1), but it was not declared in a public header until Windows 7. For use in Windows Vista with SP1, the following Interface Definition Language (IDL) fragment describes this interface, including its IID.
 *                 
 *                 
 * 
 * 
 * ```cpp
 * object,
 *     uuid(321a6a6a-d61f-4bf3-97ae-14be2986bb36),
 *     pointer_default(unique)
 * ]
 * interface IObjectWithBackReferences : IUnknown
 * {
 *     HRESULT RemoveBackReferences();
 * }
 * 
 * ```
 * 
 * 
 * The following C++ fragment can be used to enable access to this interface.
 *                 
 * 
 * 
 * ```cpp
 * struct 
 *     __declspec(uuid("321a6a6a-d61f-4bf3-97ae-14be2986bb36")) 
 *     __declspec(novtable)
 * IObjectWithBackReferences : public IUnknown
 * {
 *     public:
 *         virtual HRESULT __stdcall RemoveBackReferences() = 0;
 * };
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iobjectwithbackreferences
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IObjectWithBackReferences extends IUnknown {
    /**
     * The interface identifier for IObjectWithBackReferences
     * @type {Guid}
     */
    static IID := Guid("{321a6a6a-d61f-4bf3-97ae-14be2986bb36}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectWithBackReferences interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RemoveBackReferences : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectWithBackReferences.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Removes all back references held by an object.
     * @remarks
     * This method is used for all tasks associated with freeing/releasing back references held
     *     by an object, and may prepare an object for reuse.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithbackreferences-removebackreferences
     */
    RemoveBackReferences() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IObjectWithBackReferences.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RemoveBackReferences := CallbackCreate(GetMethod(implObj, "RemoveBackReferences"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RemoveBackReferences)
    }
}
