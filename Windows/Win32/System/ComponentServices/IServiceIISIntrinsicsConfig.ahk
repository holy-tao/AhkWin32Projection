#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Configures the IIS intrinsics for the work that is done when calling the CoCreateActivity or CoEnterServiceDomain function.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iserviceiisintrinsicsconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceIISIntrinsicsConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceIISIntrinsicsConfig
     * @type {Guid}
     */
    static IID => Guid("{1a0cf920-d452-46f4-bc36-48118d54ea52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IISIntrinsicsConfig"]

    /**
     * Configures the IIS intrinsics for the enclosed work.
     * @param {Integer} iisIntrinsicsConfig A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_iisintrinsicsconfig">CSC_IISIntrinsicsConfig</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iserviceiisintrinsicsconfig-iisintrinsicsconfig
     */
    IISIntrinsicsConfig(iisIntrinsicsConfig) {
        result := ComCall(3, this, "int", iisIntrinsicsConfig, "HRESULT")
        return result
    }
}
