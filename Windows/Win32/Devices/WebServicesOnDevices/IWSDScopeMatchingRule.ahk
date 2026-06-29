#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Is implemented by the client program to supply a custom scope matching rule which can be used to extend the standard scope matching rules defined in WS-Discovery.
 * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nn-wsddisco-iwsdscopematchingrule
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDScopeMatchingRule extends IUnknown {
    /**
     * The interface identifier for IWSDScopeMatchingRule
     * @type {Guid}
     */
    static IID := Guid("{fcafe424-fef5-481a-bd9f-33ce0574256f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDScopeMatchingRule interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetScopeRule : IntPtr
        MatchScopes  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDScopeMatchingRule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Is called to return a URI defining the implemented scope matching rule.
     * @remarks
     * <b>GetScopeRule</b> should provide a copy of the URI for the scope matching rule this object represents. The copy will be released by the caller using <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a>.
     * 
     * <i>ppszScopeMatchingRule</i> should never be <b>NULL</b> or an empty string. To register for the <b>NULL</b> scope matching rule, register for the RFC2396 rule as defined in <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery</a>. Probe messages containing a <b>NULL</b> MatchBy value will be converted to RFC2396 before <b>GetScopeRule</b> is called.
     * @returns {PWSTR} Pointer to the scope matching rule. The implementer must allocate memory using <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdallocatelinkedmemory">WSDAllocateLinkedMemory</a> and the caller must release memory using <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdscopematchingrule-getscoperule
     */
    GetScopeRule() {
        result := ComCall(3, this, PWSTR.Ptr, &ppszScopeMatchingRule := 0, "HRESULT")
        return ppszScopeMatchingRule
    }

    /**
     * Is called to compare two scopes to determine if they match.
     * @remarks
     * <b>MatchScopes</b> will be called on custom scope matching rules to determine whether or not the two scopes provided match. <i>pfMatch</i> should be assigned either <b>TRUE</b> or <b>FALSE</b> to indicate the match status.
     * @param {PWSTR} pszScope1 Pointer to the first scope matching rule.
     * @param {PWSTR} pszScope2 Pointer to the second scope matching rule.
     * @returns {BOOL} Set to <b>TRUE</b> if the scopes received via <i>pszScope1</i> and <i>pszScope2</i> match, <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdscopematchingrule-matchscopes
     */
    MatchScopes(pszScope1, pszScope2) {
        pszScope1 := pszScope1 is String ? StrPtr(pszScope1) : pszScope1
        pszScope2 := pszScope2 is String ? StrPtr(pszScope2) : pszScope2

        result := ComCall(4, this, "ptr", pszScope1, "ptr", pszScope2, BOOL.Ptr, &pfMatch := 0, "HRESULT")
        return pfMatch
    }

    Query(iid) {
        if (IWSDScopeMatchingRule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetScopeRule := CallbackCreate(GetMethod(implObj, "GetScopeRule"), flags, 2)
        this.vtbl.MatchScopes := CallbackCreate(GetMethod(implObj, "MatchScopes"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetScopeRule)
        CallbackFree(this.vtbl.MatchScopes)
    }
}
