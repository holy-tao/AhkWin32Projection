#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IResultData.ahk" { IResultData }

/**
 * The IResultData2 interface supersedes the IResultData interface. The IResultData2 interface contains the IResultData2::RenameResultItem method, which allows a result node to programmatically be put in rename mode.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iresultdata2
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IResultData2 extends IResultData {
    /**
     * The interface identifier for IResultData2
     * @type {Guid}
     */
    static IID := Guid("{0f36e0eb-a7f1-4a81-be5a-9247f7de4b1b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IResultData2 interfaces
    */
    struct Vtbl extends IResultData.Vtbl {
        RenameResultItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IResultData2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The RenameResultItem method programmatically places the specified result item into rename mode, after which, the user can manually enter the new name.
     * @remarks
     * The item being placed into rename mode must have the Rename verb enabled for this method to succeed.
     * @param {Pointer} itemID The result item being placed into rename mode. When applied to virtual lists, pass the item index instead of the result item.
     * @returns {HRESULT} If successful, the return value is S_OK; otherwise, the return value is an error code.  The <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and/or <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros can be used to evaluate the return value. If the Rename verb is not enabled, this method returns E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata2-renameresultitem
     */
    RenameResultItem(itemID) {
        result := ComCall(18, this, "ptr", itemID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IResultData2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RenameResultItem := CallbackCreate(GetMethod(implObj, "RenameResultItem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RenameResultItem)
    }
}
