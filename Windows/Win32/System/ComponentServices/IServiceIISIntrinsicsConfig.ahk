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
     * 
     * @param {Integer} iisIntrinsicsConfig 
     * @returns {HRESULT} 
     */
    IISIntrinsicsConfig(iisIntrinsicsConfig) {
        result := ComCall(3, this, "int", iisIntrinsicsConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
