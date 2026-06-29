#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumDialableAddrs interface provides COM-standard enumeration methods to discover and use the available dialable addresses in a directory. The ITDirectoryObject::EnumerateDialableAddrs method returns a pointer to this interface.
 * @see https://learn.microsoft.com/windows/win32/api/rend/nn-rend-ienumdialableaddrs
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct IEnumDialableAddrs extends IUnknown {
    /**
     * The interface identifier for IEnumDialableAddrs
     * @type {Guid}
     */
    static IID := Guid("{34621d70-6cff-11d1-aff7-00c04fc31fee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumDialableAddrs interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Reset : IntPtr
        Skip  : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumDialableAddrs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method gets the next specified number of elements in the enumeration sequence. (IEnumDialableAddrs.Next)
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppElements</i> parameter.
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<Integer>} pcFetched Pointer to the number of elements actually supplied. May be <b>NULL</b> if <i>celt</i> is one.
     * @returns {BSTR} Pointer to a <b>BSTR</b> representation of the address list.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-ienumdialableaddrs-next
     */
    Next(celt, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        ppElements := BSTR.Owned()
        result := ComCall(3, this, "uint", celt, BSTR.Ptr, ppElements, pcFetchedMarshal, pcFetched, "HRESULT")
        return ppElements
    }

    /**
     * The Reset method resets to the beginning of the enumeration sequence. (IEnumDialableAddrs.Reset)
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
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-ienumdialableaddrs-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The Skip method skips over the next specified number of elements in the enumeration sequence. (IEnumDialableAddrs.Skip)
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
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-ienumdialableaddrs-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Clone method creates another enumerator that contains the same enumeration state as the current one. (IEnumDialableAddrs.Clone)
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-ienumdialableaddrs">IEnumDialableAddrs</a> interface returned by <b>IEnumDialableAddrs::Clone</b>. The application must call <b>Release</b> on the 
     * <b>IEnumDialableAddrs</b> interface to free resources associated with it.
     * @returns {IEnumDialableAddrs} Pointer to the new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-ienumdialableaddrs">IEnumDialableAddrs</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-ienumdialableaddrs-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDialableAddrs(ppEnum)
    }

    Query(iid) {
        if (IEnumDialableAddrs.IID.Equals(iid)) {
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
