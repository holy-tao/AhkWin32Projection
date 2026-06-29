#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IOpcSignatureCustomObject.ahk" { IOpcSignatureCustomObject }

/**
 * A read-only enumerator of IOpcSignatureCustomObject interface pointers.
 * @remarks
 * When an enumerator is created, the current position precedes the first pointer of the enumerator. To set the current position to the first pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobjectenumerator-movenext">MoveNext</a> method after creating the enumerator.
 * 
 * Changes to the set will invalidate the enumerator, and all subsequent calls to it will fail.
 * 
 * To get an <b>IOpcSignatureCustomObjectEnumerator</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getcustomobjectenumerator">IOpcDigitalSignature::GetCustomObjectEnumerator</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobjectset-getenumerator">IOpcSignatureCustomObjectSet::GetEnumerator</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcsignaturecustomobjectenumerator
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcSignatureCustomObjectEnumerator extends IUnknown {
    /**
     * The interface identifier for IOpcSignatureCustomObjectEnumerator
     * @type {Guid}
     */
    static IID := Guid("{5ee4fe1d-e1b0-4683-8079-7ea0fcf80b4c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcSignatureCustomObjectEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MoveNext     : IntPtr
        MovePrevious : IntPtr
        GetCurrent   : IntPtr
        Clone        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcSignatureCustomObjectEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Moves the current position of the enumerator to the next IOpcSignatureCustomObject interface pointer.
     * @returns {BOOL} A Boolean value that indicates the status of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer at the current position.
     * 
     * The value of <i>hasNext</i> is only valid when the method succeeds.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>TRUE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current position of the enumerator has been advanced to the next pointer and that pointer is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current position of the enumerator has been advanced past the end of the collection and is no longer valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectenumerator-movenext
     */
    MoveNext() {
        result := ComCall(3, this, BOOL.Ptr, &hasNext := 0, "HRESULT")
        return hasNext
    }

    /**
     * Moves the current position of the enumerator to the previous IOpcSignatureCustomObjectinterface pointer.
     * @returns {BOOL} A Boolean value that indicates the status of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer at the current position.
     * 
     * The value of <i>hasPrevious</i> is only valid when the method succeeds.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>TRUE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current position of the enumerator has been moved to the previous pointer in the collection, and that pointer is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current position of the enumerator has been moved past the beginning of the collection and is no longer valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectenumerator-moveprevious
     */
    MovePrevious() {
        result := ComCall(4, this, BOOL.Ptr, &hasPrevious := 0, "HRESULT")
        return hasPrevious
    }

    /**
     * Gets the IOpcSignatureCustomObject interface at the current position of the enumerator.
     * @remarks
     * When an enumerator is created, the current position precedes the first pointer of the enumerator. To set the current position to the first pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobjectenumerator-movenext">MoveNext</a> method after creating the enumerator.
     * @returns {IOpcSignatureCustomObject} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(5, this, "ptr*", &customObject := 0, "HRESULT")
        return IOpcSignatureCustomObject(customObject)
    }

    /**
     * Creates a copy of the current IOpcSignatureCustomObjectEnumerator interface pointer and all its descendants.
     * @remarks
     * The copy has a current position  and set that are identical to the current enumerator.
     * @returns {IOpcSignatureCustomObjectEnumerator} A pointer to a copy of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobjectenumerator">IOpcSignatureCustomObjectEnumerator</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectenumerator-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &copy := 0, "HRESULT")
        return IOpcSignatureCustomObjectEnumerator(copy)
    }

    Query(iid) {
        if (IOpcSignatureCustomObjectEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MoveNext := CallbackCreate(GetMethod(implObj, "MoveNext"), flags, 2)
        this.vtbl.MovePrevious := CallbackCreate(GetMethod(implObj, "MovePrevious"), flags, 2)
        this.vtbl.GetCurrent := CallbackCreate(GetMethod(implObj, "GetCurrent"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MoveNext)
        CallbackFree(this.vtbl.MovePrevious)
        CallbackFree(this.vtbl.GetCurrent)
        CallbackFree(this.vtbl.Clone)
    }
}
