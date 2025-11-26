#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables clients to subscribe to type change notifications on objects that implement the ITypeInfo, ITypeInfo2, ICreateTypeInfo, and ICreateTypeInfo2 interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-itypechangeevents
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ITypeChangeEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeChangeEvents
     * @type {Guid}
     */
    static IID => Guid("{00020410-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestTypeChange", "AfterTypeChange"]

    /**
     * Raised when a request has been made to change a type. The change can be disallowed.
     * @param {Integer} changeKind The type of change.
     * 
     * <a id="CHANGEKIND_ADDMEMBER"></a>
     * <a id="changekind_addmember"></a>
     * @param {ITypeInfo} pTInfoBefore An object that implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo2">ITypeInfo2</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypeinfo">ICreateTypeInfo</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypeinfo2">ICreateTypeInfo2</a> interface and that contains the type information before the change was made. The client subscribes to this object to receive notifications about any changes.
     * @param {PWSTR} pStrName The name of the change. This value may be null.
     * @returns {Integer} False to disallow the change; otherwise, true.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypechangeevents-requesttypechange
     */
    RequestTypeChange(changeKind, pTInfoBefore, pStrName) {
        pStrName := pStrName is String ? StrPtr(pStrName) : pStrName

        result := ComCall(3, this, "int", changeKind, "ptr", pTInfoBefore, "ptr", pStrName, "int*", &pfCancel := 0, "HRESULT")
        return pfCancel
    }

    /**
     * Raised after a type has been changed.
     * @param {Integer} changeKind The type of change.
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
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypechangeevents-aftertypechange
     */
    AfterTypeChange(changeKind, pTInfoAfter, pStrName) {
        pStrName := pStrName is String ? StrPtr(pStrName) : pStrName

        result := ComCall(4, this, "int", changeKind, "ptr", pTInfoAfter, "ptr", pStrName, "HRESULT")
        return result
    }
}
