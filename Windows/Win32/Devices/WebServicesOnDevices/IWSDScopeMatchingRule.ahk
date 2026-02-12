#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is implemented by the client program to supply a custom scope matching rule which can be used to extend the standard scope matching rules defined in WS-Discovery.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsddisco/nn-wsddisco-iwsdscopematchingrule
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDScopeMatchingRule extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDScopeMatchingRule
     * @type {Guid}
     */
    static IID => Guid("{fcafe424-fef5-481a-bd9f-33ce0574256f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetScopeRule", "MatchScopes"]

    /**
     * Is called to return a URI defining the implemented scope matching rule.
     * @remarks
     * <b>GetScopeRule</b> should provide a copy of the URI for the scope matching rule this object represents. The copy will be released by the caller using <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a>.
     * 
     * <i>ppszScopeMatchingRule</i> should never be <b>NULL</b> or an empty string. To register for the <b>NULL</b> scope matching rule, register for the RFC2396 rule as defined in <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery</a>. Probe messages containing a <b>NULL</b> MatchBy value will be converted to RFC2396 before <b>GetScopeRule</b> is called.
     * @returns {PWSTR} Pointer to the scope matching rule. The implementer must allocate memory using <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdallocatelinkedmemory">WSDAllocateLinkedMemory</a> and the caller must release memory using <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsddisco/nf-wsddisco-iwsdscopematchingrule-getscoperule
     */
    GetScopeRule() {
        result := ComCall(3, this, "ptr*", &ppszScopeMatchingRule := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszScopeMatchingRule
    }

    /**
     * Is called to compare two scopes to determine if they match.
     * @remarks
     * <b>MatchScopes</b> will be called on custom scope matching rules to determine whether or not the two scopes provided match. <i>pfMatch</i> should be assigned either <b>TRUE</b> or <b>FALSE</b> to indicate the match status.
     * @param {PWSTR} pszScope1 Pointer to the first scope matching rule.
     * @param {PWSTR} pszScope2 Pointer to the second scope matching rule.
     * @returns {BOOL} Set to <b>TRUE</b> if the scopes received via <i>pszScope1</i> and <i>pszScope2</i> match, <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsddisco/nf-wsddisco-iwsdscopematchingrule-matchscopes
     */
    MatchScopes(pszScope1, pszScope2) {
        pszScope1 := pszScope1 is String ? StrPtr(pszScope1) : pszScope1
        pszScope2 := pszScope2 is String ? StrPtr(pszScope2) : pszScope2

        result := ComCall(4, this, "ptr", pszScope1, "ptr", pszScope2, "int*", &pfMatch := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfMatch
    }
}
