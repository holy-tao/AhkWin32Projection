#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Maintains the state that describes a particular client.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazclientcontext
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzClientContext extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzClientContext
     * @type {Guid}
     */
    static IID => Guid("{eff1f00b-488a-466d-afd9-a401c5f9eef5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AccessCheck", "GetBusinessRuleString", "get_UserDn", "get_UserSamCompat", "get_UserDisplay", "get_UserGuid", "get_UserCanonical", "get_UserUpn", "get_UserDnsSamCompat", "GetProperty", "GetRoles", "get_RoleForAccessCheck", "put_RoleForAccessCheck"]

    /**
     * Determines whether a security descriptor grants a specified set of access rights to the client identified by an access token.
     * @param {BSTR} bstrObjectName 
     * @param {VARIANT} varScopeNames 
     * @param {VARIANT} varOperations 
     * @param {VARIANT} varParameterNames 
     * @param {VARIANT} varParameterValues 
     * @param {VARIANT} varInterfaceNames 
     * @param {VARIANT} varInterfaceFlags 
     * @param {VARIANT} varInterfaces 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-accesscheck
     */
    AccessCheck(bstrObjectName, varScopeNames, varOperations, varParameterNames, varParameterValues, varInterfaceNames, varInterfaceFlags, varInterfaces) {
        bstrObjectName := bstrObjectName is String ? BSTR.Alloc(bstrObjectName).Value : bstrObjectName

        pvarResults := VARIANT()
        result := ComCall(7, this, "ptr", bstrObjectName, "ptr", varScopeNames, "ptr", varOperations, "ptr", varParameterNames, "ptr", varParameterValues, "ptr", varInterfaceNames, "ptr", varInterfaceFlags, "ptr", varInterfaces, "ptr", pvarResults, "HRESULT")
        return pvarResults
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext-getbusinessrulestring
     */
    GetBusinessRuleString() {
        pbstrBusinessRuleString := BSTR()
        result := ComCall(8, this, "ptr", pbstrBusinessRuleString, "HRESULT")
        return pbstrBusinessRuleString
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext-get_userdn
     */
    get_UserDn() {
        pbstrProp := BSTR()
        result := ComCall(9, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext-get_usersamcompat
     */
    get_UserSamCompat() {
        pbstrProp := BSTR()
        result := ComCall(10, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext-get_userdisplay
     */
    get_UserDisplay() {
        pbstrProp := BSTR()
        result := ComCall(11, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext-get_userguid
     */
    get_UserGuid() {
        pbstrProp := BSTR()
        result := ComCall(12, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext-get_usercanonical
     */
    get_UserCanonical() {
        pbstrProp := BSTR()
        result := ComCall(13, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext-get_userupn
     */
    get_UserUpn() {
        pbstrProp := BSTR()
        result := ComCall(14, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext-get_userdnssamcompat
     */
    get_UserDnsSamCompat() {
        pbstrProp := BSTR()
        result := ComCall(15, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varReserved 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(16, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext-getroles
     */
    GetRoles(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        pvarRoleNames := VARIANT()
        result := ComCall(17, this, "ptr", bstrScopeName, "ptr", pvarRoleNames, "HRESULT")
        return pvarRoleNames
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext-get_roleforaccesscheck
     */
    get_RoleForAccessCheck() {
        pbstrProp := BSTR()
        result := ComCall(18, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext-put_roleforaccesscheck
     */
    put_RoleForAccessCheck(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(19, this, "ptr", bstrProp, "HRESULT")
        return result
    }
}
