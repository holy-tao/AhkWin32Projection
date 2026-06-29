#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\IWinMLRuntime.ahk" { IWinMLRuntime }
#Import ".\IMLOperatorRegistry.ahk" { IMLOperatorRegistry }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */

;@region Functions
/**
 * 
 * @returns {IWinMLRuntime} 
 */
export WinMLCreateRuntime() {
    result := DllCall("winml.dll\WinMLCreateRuntime", "ptr*", &runtime := 0, "HRESULT")
    return IWinMLRuntime(runtime)
}

/**
 * 
 * @returns {IMLOperatorRegistry} 
 */
export MLCreateOperatorRegistry() {
    result := DllCall("windows.ai.machinelearning.dll\MLCreateOperatorRegistry", "ptr*", &registry := 0, "HRESULT")
    return IMLOperatorRegistry(registry)
}

;@endregion Functions
