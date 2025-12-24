#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Configures the COM Transaction Integrator (COMTI) intrinsics for the work that is done when calling the CoCreateActivity or CoEnterServiceDomain function.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iservicecomtiintrinsicsconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceComTIIntrinsicsConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceComTIIntrinsicsConfig
     * @type {Guid}
     */
    static IID => Guid("{09e6831e-04e1-4ed4-9d0f-e8b168bafeaf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ComTIIntrinsicsConfig"]

    /**
     * Configures the COMTI intrinsics for the enclosed work.
     * @param {Integer} comtiIntrinsicsConfig A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_comtiintrinsicsconfig">CSC_COMTIIntrinsicsConfig</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicecomtiintrinsicsconfig-comtiintrinsicsconfig
     */
    ComTIIntrinsicsConfig(comtiIntrinsicsConfig) {
        result := ComCall(3, this, "int", comtiIntrinsicsConfig, "HRESULT")
        return result
    }
}
