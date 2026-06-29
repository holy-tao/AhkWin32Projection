#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOpcSignatureReference.ahk" { IOpcSignatureReference }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A read-only enumerator of IOpcSignatureReference interface pointers.
 * @remarks
 * When an enumerator is created, the current position precedes the first pointer. To set the current position to the first pointer of the enumerator, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturereferenceenumerator-movenext">MoveNext</a> method after creating the enumerator.
 * 
 * Changes to the set will invalidate the enumerator, and all subsequent calls to it will fail.
 * 
 * To get an <b>IOpcSignatureReferenceEnumerator</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturereferenceset-getenumerator">IOpcSignatureReferenceSet::GetEnumerator</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getcustomreferenceenumerator">IOpcDigitalSignature::GetCustomReferenceEnumerator</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcsignaturereferenceenumerator
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcSignatureReferenceEnumerator extends IUnknown {
    /**
     * The interface identifier for IOpcSignatureReferenceEnumerator
     * @type {Guid}
     */
    static IID := Guid("{cfa59a45-28b1-4868-969e-fa8097fdc12a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcSignatureReferenceEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MoveNext     : IntPtr
        MovePrevious : IntPtr
        GetCurrent   : IntPtr
        Clone        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcSignatureReferenceEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Moves the current position of the enumerator to the next IOpcSignatureReference interface pointer.
     * @returns {BOOL} A Boolean value that indicates the status of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointer at the current position.
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
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereferenceenumerator-movenext
     */
    MoveNext() {
        result := ComCall(3, this, BOOL.Ptr, &hasNext := 0, "HRESULT")
        return hasNext
    }

    /**
     * Moves the current position of the enumerator to the previous IOpcSignatureReferenceinterface pointer.
     * @returns {BOOL} A Boolean value that indicates the status of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointer at the current position.
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
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereferenceenumerator-moveprevious
     */
    MovePrevious() {
        result := ComCall(4, this, BOOL.Ptr, &hasPrevious := 0, "HRESULT")
        return hasPrevious
    }

    /**
     * Gets the IOpcSignatureReference interface pointer at the current position of the enumerator.
     * @remarks
     * When an enumerator is created, the current position precedes the first pointer. To set the current position to the first pointer of the enumerator, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturereferenceenumerator-movenext">MoveNext</a> method after creating the enumerator.
     * @returns {IOpcSignatureReference} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereferenceenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(5, this, "ptr*", &_reference := 0, "HRESULT")
        return IOpcSignatureReference(_reference)
    }

    /**
     * Creates a copy of the current IOpcSignatureReferenceEnumerator interface pointer and all its descendants.
     * @remarks
     * The copy has a current position  and set that are identical to the current enumerator.
     * @returns {IOpcSignatureReferenceEnumerator} A pointer to a copy of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereferenceenumerator">IOpcSignatureReferenceEnumerator</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturereferenceenumerator-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &copy := 0, "HRESULT")
        return IOpcSignatureReferenceEnumerator(copy)
    }

    Query(iid) {
        if (IOpcSignatureReferenceEnumerator.IID.Equals(iid)) {
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
