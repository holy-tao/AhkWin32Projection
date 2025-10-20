#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Provides access to a bind context, which is an object that stores information about a particular moniker binding operation.
 * @remarks
 * 
  * A bind context includes the following information:
  * 
  * <ul>
  * <li>A <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-bind_opts">BIND_OPTS</a> structure containing a set of parameters that do not change during the binding operation. When a composite moniker is bound, each component uses the same bind context, so it acts as a mechanism for passing the same parameters to each component of a composite moniker. 
  * </li>
  * <li>A set of pointers to objects that the binding operation has activated. The bind context holds pointers to these bound objects, keeping them loaded and thus eliminating redundant activations if the objects are needed again during subsequent binding operations.</li>
  * <li>A pointer to the running object table (ROT) on the same computer as the process that started the bind operation. Moniker implementations that need to access the ROT should use the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-getrunningobjecttable">IBindCtx::GetRunningObjectTable</a> method rather than using the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-getrunningobjecttable">GetRunningObjectTable</a> function. This allows future enhancements to the system's <b>IBindCtx</b> implementation to modify binding behavior.
  * </li>
  * <li>A table of interface pointers, each associated with a string key. This capability enables moniker implementations to store interface pointers under a well-known string so that they can later be retrieved from the bind context. For example, OLE defines several string keys ("ExceededDeadline", "ConnectManually", and so on) that can be used to store a pointer to the object that caused an error during a binding operation.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ibindctx
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IBindCtx extends IUnknown{
    /**
     * The interface identifier for IBindCtx
     * @type {Guid}
     */
    static IID => Guid("{0000000e-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @returns {HRESULT} 
     */
    RegisterObjectBound(punk) {
        result := ComCall(3, this, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @returns {HRESULT} 
     */
    RevokeObjectBound(punk) {
        result := ComCall(4, this, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseBoundObjects() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BIND_OPTS>} pbindopts 
     * @returns {HRESULT} 
     */
    SetBindOptions(pbindopts) {
        result := ComCall(6, this, "ptr", pbindopts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BIND_OPTS>} pbindopts 
     * @returns {HRESULT} 
     */
    GetBindOptions(pbindopts) {
        result := ComCall(7, this, "ptr", pbindopts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns a pointer to the IRunningObjectTable interface on the local running object table (ROT).
     * @param {Pointer<IRunningObjectTable>} pprot The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunningobjecttable">IRunningObjectTable</a>* pointer variable that receives the interface pointer to the local ROT. When the function is successful, the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the interface pointer. If an error occurs, *<i>pprot</i> is undefined.
     * @returns {HRESULT} This function can return the standard return values E_UNEXPECTED and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-getrunningobjecttable
     */
    GetRunningObjectTable(pprot) {
        result := ComCall(8, this, "ptr", pprot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszKey 
     * @param {Pointer<IUnknown>} punk 
     * @returns {HRESULT} 
     */
    RegisterObjectParam(pszKey, punk) {
        pszKey := pszKey is String ? StrPtr(pszKey) : pszKey

        result := ComCall(9, this, "ptr", pszKey, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszKey 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    GetObjectParam(pszKey, ppunk) {
        pszKey := pszKey is String ? StrPtr(pszKey) : pszKey

        result := ComCall(10, this, "ptr", pszKey, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumString>} ppenum 
     * @returns {HRESULT} 
     */
    EnumObjectParam(ppenum) {
        result := ComCall(11, this, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszKey 
     * @returns {HRESULT} 
     */
    RevokeObjectParam(pszKey) {
        pszKey := pszKey is String ? StrPtr(pszKey) : pszKey

        result := ComCall(12, this, "ptr", pszKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
