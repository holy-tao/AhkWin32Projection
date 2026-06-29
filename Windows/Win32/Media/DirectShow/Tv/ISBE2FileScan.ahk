#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Repairs a corrupted .WTV file.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2FileScan)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-isbe2filescan
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ISBE2FileScan extends IUnknown {
    /**
     * The interface identifier for ISBE2FileScan
     * @type {Guid}
     */
    static IID := Guid("{3e2bf5a5-4f96-4899-a1a3-75e8be9a5ac0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISBE2FileScan interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RepairFile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISBE2FileScan.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Repairs a corrupted .WTV file.
     * @param {PWSTR} filename A pointer to a null-terminated wide-character string that specifies the full path name of the .WTV file.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_POINTER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Null pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>INVALID_HANDLE_VALUE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid .WTV file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2filescan-repairfile
     */
    RepairFile(filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(3, this, "ptr", filename, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISBE2FileScan.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RepairFile := CallbackCreate(GetMethod(implObj, "RepairFile"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RepairFile)
    }
}
