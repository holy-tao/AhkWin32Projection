#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Configures the synchronization for the work that is done when calling either CoCreateActivity or CoEnterServiceDomain.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iservicesynchronizationconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceSynchronizationConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceSynchronizationConfig
     * @type {Guid}
     */
    static IID => Guid("{fd880e81-6dce-4c58-af83-a208846c0030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConfigureSynchronization"]

    /**
     * 
     * @param {Integer} synchConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicesynchronizationconfig-configuresynchronization
     */
    ConfigureSynchronization(synchConfig) {
        result := ComCall(3, this, "int", synchConfig, "HRESULT")
        return result
    }
}
