#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioNodeEmitterNaturalDecayModelProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioNodeEmitterDecayModel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioNodeEmitterDecayModel
     * @type {Guid}
     */
    static IID => Guid("{1d1d5af7-0d53-4fa9-bd84-d5816a86f3ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Kind", "get_MinGain", "get_MaxGain", "get_NaturalProperties"]

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * @type {Float} 
     */
    MinGain {
        get => this.get_MinGain()
    }

    /**
     * @type {Float} 
     */
    MaxGain {
        get => this.get_MaxGain()
    }

    /**
     * @type {AudioNodeEmitterNaturalDecayModelProperties} 
     */
    NaturalProperties {
        get => this.get_NaturalProperties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinGain() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxGain() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AudioNodeEmitterNaturalDecayModelProperties} 
     */
    get_NaturalProperties() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioNodeEmitterNaturalDecayModelProperties(value)
    }
}
