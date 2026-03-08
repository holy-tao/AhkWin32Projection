#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumContextProps.ahk
#Include .\IUnknown.ahk

/**
 * The IContext (objidlbase.h) interface supports setting COM+ context properties.
 * @remarks
 * An instance of this interface for the current context can be obtained using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetobjectcontext">CoGetObjectContext</a>.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-icontext
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContext
     * @type {Guid}
     */
    static IID => Guid("{000001c0-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProperty", "RemoveProperty", "GetProperty", "EnumContextProps"]

    /**
     * The IContext::SetProperty (objidlbase.h) method adds the specified context property to the object context.
     * @param {Pointer<Guid>} rpolicyId A GUID that uniquely identifies this context property.
     * @param {Integer} flags This parameter is reserved and must be zero.
     * @param {IUnknown} pUnk A pointer to the context property to be added.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icontext-setproperty
     */
    SetProperty(rpolicyId, flags, pUnk) {
        result := ComCall(3, this, "ptr", rpolicyId, "uint", flags, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * The IContext::RemoveProperty (objidlbase.h) method removes the specified context property from the context.
     * @param {Pointer<Guid>} rPolicyId The GUID that uniquely identifies the context property to be removed.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icontext-removeproperty
     */
    RemoveProperty(rPolicyId) {
        result := ComCall(4, this, "ptr", rPolicyId, "HRESULT")
        return result
    }

    /**
     * The IContext::GetProperty (objidlbase.h) method retrieves the specified context property from the context.
     * @param {Pointer<Guid>} rGuid The GUID that uniquely identifies the context property to be retrieved.
     * @param {Pointer<Integer>} pFlags The address of the variable that receives the flags associated with the property.
     * @param {Pointer<IUnknown>} ppUnk The address of the variable that receives the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer of the requested context property.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icontext-getproperty
     */
    GetProperty(rGuid, pFlags, ppUnk) {
        pFlagsMarshal := pFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", rGuid, pFlagsMarshal, pFlags, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * The IContext::EnumContextProps (objidlbase.h) method returns an IEnumContextProps interface pointer that can be used to enumerate the context properties.
     * @returns {IEnumContextProps} The address of the variable that receives the new <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumcontextprops">IEnumContextProps</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icontext-enumcontextprops
     */
    EnumContextProps() {
        result := ComCall(6, this, "ptr*", &ppEnumContextProps := 0, "HRESULT")
        return IEnumContextProps(ppEnumContextProps)
    }
}
