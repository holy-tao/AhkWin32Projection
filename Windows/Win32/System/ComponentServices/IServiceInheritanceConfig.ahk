#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Determines whether to construct a new context based on the current context or to create a new context based solely on the information in CServiceConfig.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iserviceinheritanceconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceInheritanceConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceInheritanceConfig
     * @type {Guid}
     */
    static IID => Guid("{92186771-d3b4-4d77-a8ea-ee842d586f35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ContainingContextTreatment"]

    /**
     * Determines whether the containing context is based on the current context.
     * @param {Integer} inheritanceConfig A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iserviceinheritanceconfig-containingcontexttreatment
     */
    ContainingContextTreatment(inheritanceConfig) {
        result := ComCall(3, this, "int", inheritanceConfig, "HRESULT")
        return result
    }
}
