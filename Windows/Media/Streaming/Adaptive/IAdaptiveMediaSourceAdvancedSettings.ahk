#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class IAdaptiveMediaSourceAdvancedSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveMediaSourceAdvancedSettings
     * @type {Guid}
     */
    static IID => Guid("{55db1680-1aeb-47dc-aa08-9a11610ba45a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllSegmentsIndependent", "put_AllSegmentsIndependent", "get_DesiredBitrateHeadroomRatio", "put_DesiredBitrateHeadroomRatio", "get_BitrateDowngradeTriggerRatio", "put_BitrateDowngradeTriggerRatio"]

    /**
     * @type {Boolean} 
     */
    AllSegmentsIndependent {
        get => this.get_AllSegmentsIndependent()
        set => this.put_AllSegmentsIndependent(value)
    }

    /**
     * @type {IReference<Float>} 
     */
    DesiredBitrateHeadroomRatio {
        get => this.get_DesiredBitrateHeadroomRatio()
        set => this.put_DesiredBitrateHeadroomRatio(value)
    }

    /**
     * @type {IReference<Float>} 
     */
    BitrateDowngradeTriggerRatio {
        get => this.get_BitrateDowngradeTriggerRatio()
        set => this.put_BitrateDowngradeTriggerRatio(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllSegmentsIndependent() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllSegmentsIndependent(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_DesiredBitrateHeadroomRatio() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_DesiredBitrateHeadroomRatio(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_BitrateDowngradeTriggerRatio() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_BitrateDowngradeTriggerRatio(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
