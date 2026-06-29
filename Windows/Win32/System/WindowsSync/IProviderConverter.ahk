#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncProvider.ahk" { ISyncProvider }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * When implemented by a derived class, represents an object that can convert an ISyncProvider object to an IKnowledgeSyncProvider object.
 * @remarks
 * <b>IProviderConverter</b> is typically implemented by the developer of the custom provider that it converts.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-iproviderconverter
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IProviderConverter extends IUnknown {
    /**
     * The interface identifier for IProviderConverter
     * @type {Guid}
     */
    static IID := Guid("{809b7276-98cf-4957-93a5-0ebdd3dddffd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProviderConverter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProviderConverter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * When implemented by a derived class, initializes the IProviderConverter object with the ISyncProvider object to be converted to IKnowledgeSyncProvider.
     * @param {ISyncProvider} pISyncProvider The <b>ISyncProvider</b> object to be converted.
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
     * <dt><b>Converter-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iproviderconverter-initialize
     */
    Initialize(pISyncProvider) {
        result := ComCall(3, this, "ptr", pISyncProvider, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProviderConverter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
