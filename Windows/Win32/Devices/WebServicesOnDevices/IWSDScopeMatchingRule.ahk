#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is implemented by the client program to supply a custom scope matching rule which can be used to extend the standard scope matching rules defined in WS-Discovery.
 * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nn-wsddisco-iwsdscopematchingrule
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
     * @returns {PWSTR} Pointer to the scope matching rule. The implementor must allocate memory using <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdallocatelinkedmemory">WSDAllocateLinkedMemory</a> and the caller must release memory using <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdscopematchingrule-getscoperule
     */
    GetScopeRule() {
        result := ComCall(3, this, "ptr*", &ppszScopeMatchingRule := 0, "HRESULT")
        return ppszScopeMatchingRule
    }

    /**
     * Is called to compare two scopes to determine if they match.
     * @param {PWSTR} pszScope1 Pointer to the first scope matching rule.
     * @param {PWSTR} pszScope2 Pointer to the second scope matching rule.
     * @returns {BOOL} Set to <b>TRUE</b> if the scopes received via <i>pszScope1</i> and <i>pszScope2</i> match, <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdscopematchingrule-matchscopes
     */
    MatchScopes(pszScope1, pszScope2) {
        pszScope1 := pszScope1 is String ? StrPtr(pszScope1) : pszScope1
        pszScope2 := pszScope2 is String ? StrPtr(pszScope2) : pszScope2

        result := ComCall(4, this, "ptr", pszScope1, "ptr", pszScope2, "int*", &pfMatch := 0, "HRESULT")
        return pfMatch
    }
}
