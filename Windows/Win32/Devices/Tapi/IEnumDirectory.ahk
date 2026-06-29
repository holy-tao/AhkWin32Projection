#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITDirectory.ahk" { ITDirectory }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumDirectory interface provides COM-standard enumeration methods for the ITDirectory interface. The ITRendezvous::EnumerateDefaultDirectories method returns a pointer to IEnumDirectory.
 * @see https://learn.microsoft.com/windows/win32/api/rend/nn-rend-ienumdirectory
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct IEnumDirectory extends IUnknown {
    /**
     * The interface identifier for IEnumDirectory
     * @type {Guid}
     */
    static IID := Guid("{34621d6d-6cff-11d1-aff7-00c04fc31fee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumDirectory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Reset : IntPtr
        Skip  : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumDirectory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method gets the next specified number of elements in the enumeration sequence. (IEnumDirectory.Next)
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectory">ITDirectory</a> interface returned by <b>IEnumDirectory::Next</b>. The application must call <b>Release</b> on the 
     * <b>ITDirectory</b> interface to free resources associated with it.
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<Integer>} pcFetched Pointer to the number of elements actually supplied. May be <b>NULL</b> if <i>celt</i> is one.
     * @returns {ITDirectory} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectory">ITDirectory</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-ienumdirectory-next
     */
    Next(celt, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &ppElements := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return ITDirectory(ppElements)
    }

    /**
     * The Reset method resets to the beginning of the enumeration sequence. (IEnumDirectory.Reset)
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
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-ienumdirectory-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The Skip method skips over the next specified number of elements in the enumeration sequence. (IEnumDirectory.Skip)
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
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-ienumdirectory-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Clone method creates another enumerator that contains the same enumeration state as the current one. (IEnumDirectory.Clone)
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-ienumdirectory">IEnumDirectory</a> interface returned by <b>IEnumDirectory::Clone</b>. The application must call <b>Release</b> on the 
     * <b>IEnumDirectory</b> interface to free resources associated with it.
     * @returns {IEnumDirectory} Pointer to the new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-ienumdirectory">IEnumDirectory</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-ienumdirectory-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDirectory(ppEnum)
    }

    Query(iid) {
        if (IEnumDirectory.IID.Equals(iid)) {
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
