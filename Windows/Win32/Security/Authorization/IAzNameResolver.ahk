#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Translates security identifiers (SIDs) into principal display names.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iaznameresolver
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzNameResolver extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzNameResolver
     * @type {Guid}
     */
    static IID => Guid("{504d0f15-73e2-43df-a870-a64f40714f53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NameFromSid", "NamesFromSids"]

    /**
     * Gets the display name that corresponds to the specified security identifier (SID).
     * @param {BSTR} bstrSid The string representation of the SID to translate.
     * @param {Pointer<Integer>} pSidType An element of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration that specifies the type of SID being translated.
     * @param {Pointer<BSTR>} pbstrName A pointer to the display name of the principal that corresponds to the SID specified by the <i>bstrSid</i> parameter.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. In particular, if the method cannot find the display name of the principal, it returns <b>CO_E_NOMATCHINGNAMEFOUND</b>. For a list of other common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iaznameresolver-namefromsid
     */
    NameFromSid(bstrSid, pSidType, pbstrName) {
        bstrSid := bstrSid is String ? BSTR.Alloc(bstrSid).Value : bstrSid

        pSidTypeMarshal := pSidType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", bstrSid, pSidTypeMarshal, pSidType, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * Gets the display names that correspond to the specified security identifiers (SIDs).
     * @param {VARIANT} vSids An array of string representations of the SIDs to translate.
     * 
     * This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_BSTR</b> that contains a string representation of a SID.
     * @param {Pointer<VARIANT>} pvSidTypes A pointer to an array of elements of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration that specify the types of SIDs being translated.
     * 
     * This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_I4</b> value that specifies an element of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration.
     * @param {Pointer<VARIANT>} pvNames A pointer to an array of strings that contain the display names of the principals that correspond to the SIDs specified by the <i>vSids</i> parameter. 
     * 
     * This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_BSTR</b> that contains a display name. If a name could not be found for one or more of the SIDs, the corresponding array element contains an empty string.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. If the method cannot find the display names of any of the principals, it returns <b>CO_E_NOMATCHINGNAMEFOUND</b>. For a list of other common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iaznameresolver-namesfromsids
     */
    NamesFromSids(vSids, pvSidTypes, pvNames) {
        result := ComCall(8, this, "ptr", vSids, "ptr", pvSidTypes, "ptr", pvNames, "HRESULT")
        return result
    }
}
