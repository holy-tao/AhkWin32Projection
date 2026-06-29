#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMcastScope.ahk" { IMcastScope }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumMcastScope interface provides COM-standard enumeration methods for the IMcastScope interface. The IMcastAddressAllocation::EnumerateScopes method returns a pointer to IEnumMcastScope.
 * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nn-mdhcp-ienummcastscope
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct IEnumMcastScope extends IUnknown {
    /**
     * The interface identifier for IEnumMcastScope
     * @type {Guid}
     */
    static IID := Guid("{df0daf09-a289-11d1-8697-006008b0e5d2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumMcastScope interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Reset : IntPtr
        Skip  : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumMcastScope.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method gets the next specified number of elements in the enumeration sequence. (IEnumMcastScope.Next)
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-imcastscope">IMcastScope</a> interface returned by <b>IEnumMcastScope::Next</b>. The application must call <b>Release</b> on the 
     * <b>IMcastScope</b> interface to free resources associated with it.
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<Integer>} pceltFetched Pointer to the number of elements actually supplied. May be <b>NULL</b> if <i>celt</i> is one.
     * @returns {IMcastScope} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-imcastscope">IMcastScope</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-ienummcastscope-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &ppScopes := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return IMcastScope(ppScopes)
    }

    /**
     * The Reset method resets to the beginning of enumeration sequence. (IEnumMcastScope.Reset)
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-ienummcastscope-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The Skip method skips over the next specified number of elements in the enumeration sequence. (IEnumMcastScope.Skip)
     * @param {Integer} celt Number of elements to skip.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Number of elements skipped was <i>celt</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Number of elements skipped was not <i>celt</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-ienummcastscope-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Clone method creates another enumerator that contains the same enumeration state as the current one. (IEnumMcastScope.Clone)
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-ienummcastscope">IEnumMcastScope</a> interface returned by <b>IEnumMcastScope::Clone</b>. The application must call <b>Release</b> on the 
     * <b>IEnumMcastScope</b> interface to free resources associated with it.
     * @returns {IEnumMcastScope} Pointer to the new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-ienummcastscope">IEnumMcastScope</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-ienummcastscope-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumMcastScope(ppEnum)
    }

    Query(iid) {
        if (IEnumMcastScope.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Clone)
    }
}
