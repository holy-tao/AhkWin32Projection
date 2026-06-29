#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOpcRelationship.ahk" { IOpcRelationship }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A read-only enumerator of IOpcRelationship interface pointers.
 * @remarks
 * To get a pointer to this interface, call either the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipset-getenumerator">IOpcRelationshipSet::GetEnumerator</a> or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipset-getenumeratorfortype">IOpcRelationshipSet::GetEnumeratorForType</a> method.
 * 
 * When an enumerator is created, the current position precedes the first pointer. To set the current position to the first pointer of the enumerator, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipenumerator-movenext">MoveNext</a> method after creating the enumerator.
 * 
 * 
 * <div class="alert"><b>Note</b>  Changes to the set will invalidate the enumerator, and all subsequent calls will fail.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcrelationshipenumerator
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcRelationshipEnumerator extends IUnknown {
    /**
     * The interface identifier for IOpcRelationshipEnumerator
     * @type {Guid}
     */
    static IID := Guid("{42195949-3b79-4fc8-89c6-fc7fb979ee76}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcRelationshipEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MoveNext     : IntPtr
        MovePrevious : IntPtr
        GetCurrent   : IntPtr
        Clone        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcRelationshipEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Moves the current position of the enumerator to the next IOpcRelationship interface pointer.
     * @remarks
     * When an enumerator is created, the current position precedes the first pointer. To set the current position to the first pointer of the enumerator, call the <b>MoveNext</b> method after creating the enumerator.
     * @returns {BOOL} A Boolean value that indicates the status of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationship">IOpcRelationship</a> interface pointer at the current position.
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
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipenumerator-movenext
     */
    MoveNext() {
        result := ComCall(3, this, BOOL.Ptr, &hasNext := 0, "HRESULT")
        return hasNext
    }

    /**
     * Moves the current position of the enumerator to the previous IOpcRelationship interface pointer.
     * @remarks
     * When an enumerator is created, the current position precedes the first pointer. To set the current position to the first pointer of the enumerator, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipenumerator-movenext">MoveNext</a> method after creating the enumerator.
     * @returns {BOOL} A Boolean value that indicates the status of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationship">IOpcRelationship</a> interface pointer at the current position.
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
     * The current position of the enumerator has been moved past the beginning of the enumerator and is no longer valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipenumerator-moveprevious
     */
    MovePrevious() {
        result := ComCall(4, this, BOOL.Ptr, &hasPrevious := 0, "HRESULT")
        return hasPrevious
    }

    /**
     * Gets the IOpcRelationship interface pointer at the current position of the enumerator.
     * @remarks
     * When an enumerator is created, the current position precedes the first pointer. To set the current position to the first pointer of the enumerator, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipenumerator-movenext">MoveNext</a> method after creating the enumerator.
     * @returns {IOpcRelationship} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationship">IOpcRelationship</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(5, this, "ptr*", &relationship := 0, "HRESULT")
        return IOpcRelationship(relationship)
    }

    /**
     * Creates a copy of the current enumerator and all its descendants. (IOpcRelationshipEnumerator.Clone)
     * @remarks
     * When an enumerator is created, the current position precedes the first pointer. To set the current position to the first pointer of the enumerator, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipenumerator-movenext">MoveNext</a> method after creating the enumerator.
     * @returns {IOpcRelationshipEnumerator} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipenumerator">IOpcRelationshipEnumerator</a> interface of the new enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipenumerator-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &copy := 0, "HRESULT")
        return IOpcRelationshipEnumerator(copy)
    }

    Query(iid) {
        if (IOpcRelationshipEnumerator.IID.Equals(iid)) {
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
