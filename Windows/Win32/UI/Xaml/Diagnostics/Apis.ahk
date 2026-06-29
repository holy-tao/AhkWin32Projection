#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */

;@region Functions
/**
 * 
 * @param {PWSTR} endPointName 
 * @param {Integer} pid 
 * @param {PWSTR} wszDllXamlDiagnostics 
 * @param {PWSTR} wszTAPDllName 
 * @param {Guid} tapClsid 
 * @returns {HRESULT} 
 */
export InitializeXamlDiagnostic(endPointName, pid, wszDllXamlDiagnostics, wszTAPDllName, tapClsid) {
    endPointName := endPointName is String ? StrPtr(endPointName) : endPointName
    wszDllXamlDiagnostics := wszDllXamlDiagnostics is String ? StrPtr(wszDllXamlDiagnostics) : wszDllXamlDiagnostics
    wszTAPDllName := wszTAPDllName is String ? StrPtr(wszTAPDllName) : wszTAPDllName

    result := DllCall("Windows.UI.Xaml.dll\InitializeXamlDiagnostic", "ptr", endPointName, "uint", pid, "ptr", wszDllXamlDiagnostics, "ptr", wszTAPDllName, Guid, tapClsid, "HRESULT")
    return result
}

/**
 * Initializes a Xaml Diagnostics session. This is the entry point for any debugging tool using the XAML Diagnostic APIs.
 * @param {PWSTR} endPointName The end point name for Visual Diagnostics.
 * @param {Integer} pid The pid of the process to connect to.
 * @param {PWSTR} wszDllXamlDiagnostics The path to XamlDiagnostics.dll.
 * @param {PWSTR} wszTAPDllName The name of the DLL to be injected in the process.
 * @param {Guid} tapClsid The COM CLSID of the DLL to be injected in the process.
 * @param {PWSTR} wszInitializationData Initialization data for Xaml Diagnostics.
 * @returns {HRESULT} 
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-initializexamldiagnosticsex
 * @since windows10.0.15063
 */
export InitializeXamlDiagnosticsEx(endPointName, pid, wszDllXamlDiagnostics, wszTAPDllName, tapClsid, wszInitializationData) {
    endPointName := endPointName is String ? StrPtr(endPointName) : endPointName
    wszDllXamlDiagnostics := wszDllXamlDiagnostics is String ? StrPtr(wszDllXamlDiagnostics) : wszDllXamlDiagnostics
    wszTAPDllName := wszTAPDllName is String ? StrPtr(wszTAPDllName) : wszTAPDllName
    wszInitializationData := wszInitializationData is String ? StrPtr(wszInitializationData) : wszInitializationData

    result := DllCall("Windows.UI.Xaml.dll\InitializeXamlDiagnosticsEx", "ptr", endPointName, "uint", pid, "ptr", wszDllXamlDiagnostics, "ptr", wszTAPDllName, Guid, tapClsid, "ptr", wszInitializationData, "HRESULT")
    return result
}

;@endregion Functions
