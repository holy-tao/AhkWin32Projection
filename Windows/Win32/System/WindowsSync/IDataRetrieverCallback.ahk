#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents methods that an IAsynchronousDataRetriever object can call to indicate that processing has been completed on an IAsynchronousDataRetriever method.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-idataretrievercallback
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IDataRetrieverCallback extends IUnknown {
    /**
     * The interface identifier for IDataRetrieverCallback
     * @type {Guid}
     */
    static IID := Guid("{71b4863b-f969-4676-bbc3-3d9fdc3fb2c7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataRetrieverCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LoadChangeDataComplete : IntPtr
        LoadChangeDataError    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataRetrieverCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates that IAsynchronousDataRetriever::LoadChangeData has finished successfully.
     * @param {IUnknown} pUnkData An object that can be used to access the data that was loaded by <b>LoadChangeData</b>.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-idataretrievercallback-loadchangedatacomplete
     */
    LoadChangeDataComplete(pUnkData) {
        result := ComCall(3, this, "ptr", pUnkData, "HRESULT")
        return result
    }

    /**
     * Indicates that an IAsynchronousDataRetriever method failed.
     * @param {HRESULT} hrError The error code that represents the reason for the failure.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-idataretrievercallback-loadchangedataerror
     */
    LoadChangeDataError(hrError) {
        result := ComCall(4, this, "int", hrError, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDataRetrieverCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadChangeDataComplete := CallbackCreate(GetMethod(implObj, "LoadChangeDataComplete"), flags, 2)
        this.vtbl.LoadChangeDataError := CallbackCreate(GetMethod(implObj, "LoadChangeDataError"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadChangeDataComplete)
        CallbackFree(this.vtbl.LoadChangeDataError)
    }
}
