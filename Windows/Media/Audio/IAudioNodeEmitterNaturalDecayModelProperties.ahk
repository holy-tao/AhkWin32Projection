#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioNodeEmitterNaturalDecayModelProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioNodeEmitterNaturalDecayModelProperties
     * @type {Guid}
     */
    static IID => Guid("{48934bcf-cf2c-4efc-9331-75bd22df1f0c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UnityGainDistance", "get_CutoffDistance"]

    /**
     * @type {Float} 
     */
    UnityGainDistance {
        get => this.get_UnityGainDistance()
    }

    /**
     * @type {Float} 
     */
    CutoffDistance {
        get => this.get_CutoffDistance()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_UnityGainDistance() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CutoffDistance() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
