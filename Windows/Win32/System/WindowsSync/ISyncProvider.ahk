#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID_PARAMETERS.ahk" { ID_PARAMETERS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a synchronization provider that can be used by a synchronization session to synchronize data with another synchronization provider.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncprovider
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncProvider extends IUnknown {
    /**
     * The interface identifier for ISyncProvider
     * @type {Guid}
     */
    static IID := Guid("{8f657056-2bce-4a17-8c68-c7bb7898b56f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIdParameters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the ID format schema of the provider. (ISyncProvider.GetIdParameters)
     * @remarks
     * This method is used to get the ID format schema from the two providers that are participating in synchronization. A synchronization session should use this method to verify that the two providers have the same ID format schema, so that they can synchronize with one another.
     * @param {Pointer<ID_PARAMETERS>} pIdParameters Returns the ID format schema of the provider.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Provider-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncprovider-getidparameters
     */
    GetIdParameters(pIdParameters) {
        result := ComCall(3, this, ID_PARAMETERS.Ptr, pIdParameters, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIdParameters := CallbackCreate(GetMethod(implObj, "GetIdParameters"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIdParameters)
    }
}
