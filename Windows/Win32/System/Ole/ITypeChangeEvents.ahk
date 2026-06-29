#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CHANGEKIND.ahk" { CHANGEKIND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\ITypeInfo.ahk" { ITypeInfo }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables clients to subscribe to type change notifications on objects that implement the ITypeInfo, ITypeInfo2, ICreateTypeInfo, and ICreateTypeInfo2 interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-itypechangeevents
 * @namespace Windows.Win32.System.Ole
 */
export default struct ITypeChangeEvents extends IUnknown {
    /**
     * The interface identifier for ITypeChangeEvents
     * @type {Guid}
     */
    static IID := Guid("{00020410-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITypeChangeEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RequestTypeChange : IntPtr
        AfterTypeChange   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITypeChangeEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Raised when a request has been made to change a type. The change can be disallowed.
     * @param {CHANGEKIND} _changeKind The type of change.
     * 
     * <a id="CHANGEKIND_ADDMEMBER"></a>
     * <a id="changekind_addmember"></a>
     * @param {ITypeInfo} pTInfoBefore An object that implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo2">ITypeInfo2</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypeinfo">ICreateTypeInfo</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypeinfo2">ICreateTypeInfo2</a> interface and that contains the type information before the change was made. The client subscribes to this object to receive notifications about any changes.
     * @param {PWSTR} pStrName The name of the change. This value may be null.
     * @returns {Integer} False to disallow the change; otherwise, true.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypechangeevents-requesttypechange
     */
    RequestTypeChange(_changeKind, pTInfoBefore, pStrName) {
        pStrName := pStrName is String ? StrPtr(pStrName) : pStrName

        result := ComCall(3, this, CHANGEKIND, _changeKind, "ptr", pTInfoBefore, "ptr", pStrName, "int*", &pfCancel := 0, "HRESULT")
        return pfCancel
    }

    /**
     * Raised after a type has been changed.
     * @param {CHANGEKIND} _changeKind The type of change.
     * 
     * <a id="CHANGEKIND_ADDMEMBER"></a>
     * <a id="changekind_addmember"></a>
     * @param {ITypeInfo} pTInfoAfter An object that implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo2">ITypeInfo2</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypeinfo">ICreateTypeInfo</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypeinfo2">ICreateTypeInfo2</a> interface and that contains the type information before the change was made. The client subscribes to this object to receive notifications about any changes.
     * @param {PWSTR} pStrName The name of the change. This value may be null.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypechangeevents-aftertypechange
     */
    AfterTypeChange(_changeKind, pTInfoAfter, pStrName) {
        pStrName := pStrName is String ? StrPtr(pStrName) : pStrName

        result := ComCall(4, this, CHANGEKIND, _changeKind, "ptr", pTInfoAfter, "ptr", pStrName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITypeChangeEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestTypeChange := CallbackCreate(GetMethod(implObj, "RequestTypeChange"), flags, 5)
        this.vtbl.AfterTypeChange := CallbackCreate(GetMethod(implObj, "AfterTypeChange"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestTypeChange)
        CallbackFree(this.vtbl.AfterTypeChange)
    }
}
