#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class WinML {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WINML_TENSOR_DIMENSION_COUNT_MAX => 4
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<IWinMLRuntime>} runtime 
     * @returns {HRESULT} 
     */
    static WinMLCreateRuntime(runtime) {
        result := DllCall("winml.dll\WinMLCreateRuntime", "ptr*", runtime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMLOperatorRegistry>} registry 
     * @returns {HRESULT} 
     */
    static MLCreateOperatorRegistry(registry) {
        result := DllCall("windows.ai.machinelearning.dll\MLCreateOperatorRegistry", "ptr*", registry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
