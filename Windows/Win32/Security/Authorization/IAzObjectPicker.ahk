#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Displays a dialog box that allows users to select one or more principals from a list.
 * @remarks
 * 
 * Implement this interface when you need a custom dialog box that allows users to choose principals.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazobjectpicker
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzObjectPicker extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzObjectPicker
     * @type {Guid}
     */
    static IID => Guid("{63130a48-699a-42d8-bf01-c62ac3fb79f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPrincipals", "get_Name"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Displays a dialog box from which users can choose one or more principals, and then returns the chosen list of principals and their corresponding security identifiers (SIDs).
     * @param {HWND} hParentWnd A handle to the parent window of the dialog box.
     * @param {BSTR} bstrTitle The display title of the dialog box.
     * @param {Pointer<VARIANT>} pvSidTypes A pointer to an array of elements of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration that specify the types of the SIDs that correspond to the principals chosen by the user.
     * 
     * This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_I4</b> value that specifies an element of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration.
     * @param {Pointer<VARIANT>} pvNames A pointer to an array of display names of the principals chosen by the user. 
     * 
     * This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_BSTR</b> that contains a display name.
     * @param {Pointer<VARIANT>} pvSids A pointer to an array of string representations of the SIDs that correspond to the principals chosen by the user.
     * 
     * This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_BSTR</b> that contains a string representation of a SID.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazobjectpicker-getprincipals
     */
    GetPrincipals(hParentWnd, bstrTitle, pvSidTypes, pvNames, pvSids) {
        hParentWnd := hParentWnd is Win32Handle ? NumGet(hParentWnd, "ptr") : hParentWnd
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(7, this, "ptr", hParentWnd, "ptr", bstrTitle, "ptr", pvSidTypes, "ptr", pvNames, "ptr", pvSids, "HRESULT")
        return result
    }

    /**
     * Gets the name of the IAzObjectPicker object.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazobjectpicker-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(8, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }
}
