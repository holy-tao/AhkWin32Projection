#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Supports setting COM+ context properties.
 * @remarks
 * 
  *  An instance of this interface for the current context can be obtained using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetobjectcontext">CoGetObjectContext</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-icontext
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
     * 
     * @param {Pointer<Guid>} rpolicyId 
     * @param {Integer} flags 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icontext-setproperty
     */
    SetProperty(rpolicyId, flags, pUnk) {
        result := ComCall(3, this, "ptr", rpolicyId, "uint", flags, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rPolicyId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icontext-removeproperty
     */
    RemoveProperty(rPolicyId) {
        result := ComCall(4, this, "ptr", rPolicyId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rGuid 
     * @param {Pointer<Integer>} pFlags 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icontext-getproperty
     */
    GetProperty(rGuid, pFlags, ppUnk) {
        result := ComCall(5, this, "ptr", rGuid, "uint*", pFlags, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumContextProps>} ppEnumContextProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icontext-enumcontextprops
     */
    EnumContextProps(ppEnumContextProps) {
        result := ComCall(6, this, "ptr*", ppEnumContextProps, "HRESULT")
        return result
    }
}
