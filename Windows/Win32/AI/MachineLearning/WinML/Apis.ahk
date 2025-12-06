#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include .\IWinMLRuntime.ahk
#Include .\IMLOperatorRegistry.ahk

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
     * @returns {Pointer<IWinMLRuntime>} 
     */
    static WinMLCreateRuntime() {
        result := DllCall("winml.dll\WinMLCreateRuntime", "ptr*", &runtime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return runtime
    }

    /**
     * 
     * @returns {Pointer<IMLOperatorRegistry>} 
     */
    static MLCreateOperatorRegistry() {
        result := DllCall("windows.ai.machinelearning.dll\MLCreateOperatorRegistry", "ptr*", &registry := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return registry
    }

;@endregion Methods
}
