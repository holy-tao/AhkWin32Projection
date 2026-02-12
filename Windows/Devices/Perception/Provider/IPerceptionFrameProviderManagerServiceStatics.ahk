#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class IPerceptionFrameProviderManagerServiceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionFrameProviderManagerServiceStatics
     * @type {Guid}
     */
    static IID => Guid("{ae8386e6-cad9-4359-8f96-8eae51810526}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterFrameProviderInfo", "UnregisterFrameProviderInfo", "RegisterFaceAuthenticationGroup", "UnregisterFaceAuthenticationGroup", "RegisterControlGroup", "UnregisterControlGroup", "RegisterCorrelationGroup", "UnregisterCorrelationGroup", "UpdateAvailabilityForProvider", "PublishFrameForProvider"]

    /**
     * 
     * @param {IPerceptionFrameProviderManager} manager 
     * @param {PerceptionFrameProviderInfo} frameProviderInfo 
     * @returns {HRESULT} 
     */
    RegisterFrameProviderInfo(manager, frameProviderInfo) {
        result := ComCall(6, this, "ptr", manager, "ptr", frameProviderInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IPerceptionFrameProviderManager} manager 
     * @param {PerceptionFrameProviderInfo} frameProviderInfo 
     * @returns {HRESULT} 
     */
    UnregisterFrameProviderInfo(manager, frameProviderInfo) {
        result := ComCall(7, this, "ptr", manager, "ptr", frameProviderInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IPerceptionFrameProviderManager} manager 
     * @param {PerceptionFaceAuthenticationGroup} faceAuthenticationGroup 
     * @returns {HRESULT} 
     */
    RegisterFaceAuthenticationGroup(manager, faceAuthenticationGroup) {
        result := ComCall(8, this, "ptr", manager, "ptr", faceAuthenticationGroup, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IPerceptionFrameProviderManager} manager 
     * @param {PerceptionFaceAuthenticationGroup} faceAuthenticationGroup 
     * @returns {HRESULT} 
     */
    UnregisterFaceAuthenticationGroup(manager, faceAuthenticationGroup) {
        result := ComCall(9, this, "ptr", manager, "ptr", faceAuthenticationGroup, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IPerceptionFrameProviderManager} manager 
     * @param {PerceptionControlGroup} controlGroup 
     * @returns {HRESULT} 
     */
    RegisterControlGroup(manager, controlGroup) {
        result := ComCall(10, this, "ptr", manager, "ptr", controlGroup, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IPerceptionFrameProviderManager} manager 
     * @param {PerceptionControlGroup} controlGroup 
     * @returns {HRESULT} 
     */
    UnregisterControlGroup(manager, controlGroup) {
        result := ComCall(11, this, "ptr", manager, "ptr", controlGroup, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IPerceptionFrameProviderManager} manager 
     * @param {PerceptionCorrelationGroup} correlationGroup 
     * @returns {HRESULT} 
     */
    RegisterCorrelationGroup(manager, correlationGroup) {
        result := ComCall(12, this, "ptr", manager, "ptr", correlationGroup, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IPerceptionFrameProviderManager} manager 
     * @param {PerceptionCorrelationGroup} correlationGroup 
     * @returns {HRESULT} 
     */
    UnregisterCorrelationGroup(manager, correlationGroup) {
        result := ComCall(13, this, "ptr", manager, "ptr", correlationGroup, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IPerceptionFrameProvider} provider 
     * @param {Boolean} available 
     * @returns {HRESULT} 
     */
    UpdateAvailabilityForProvider(provider, available) {
        result := ComCall(14, this, "ptr", provider, "int", available, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IPerceptionFrameProvider} provider 
     * @param {PerceptionFrame} frame_ 
     * @returns {HRESULT} 
     */
    PublishFrameForProvider(provider, frame_) {
        result := ComCall(15, this, "ptr", provider, "ptr", frame_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
