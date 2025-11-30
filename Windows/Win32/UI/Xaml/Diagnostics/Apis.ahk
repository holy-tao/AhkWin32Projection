#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class Diagnostics {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static E_UNKNOWNTYPE => -2144665560
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {PWSTR} endPointName 
     * @param {Integer} pid 
     * @param {PWSTR} wszDllXamlDiagnostics 
     * @param {PWSTR} wszTAPDllName 
     * @param {Guid} tapClsid 
     * @returns {HRESULT} 
     */
    static InitializeXamlDiagnostic(endPointName, pid, wszDllXamlDiagnostics, wszTAPDllName, tapClsid) {
        endPointName := endPointName is String ? StrPtr(endPointName) : endPointName
        wszDllXamlDiagnostics := wszDllXamlDiagnostics is String ? StrPtr(wszDllXamlDiagnostics) : wszDllXamlDiagnostics
        wszTAPDllName := wszTAPDllName is String ? StrPtr(wszTAPDllName) : wszTAPDllName

        result := DllCall("Windows.UI.Xaml.dll\InitializeXamlDiagnostic", "ptr", endPointName, "uint", pid, "ptr", wszDllXamlDiagnostics, "ptr", wszTAPDllName, "ptr", tapClsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-initializexamldiagnosticsex
     * @since windows10.0.15063
     */
    static InitializeXamlDiagnosticsEx(endPointName, pid, wszDllXamlDiagnostics, wszTAPDllName, tapClsid, wszInitializationData) {
        endPointName := endPointName is String ? StrPtr(endPointName) : endPointName
        wszDllXamlDiagnostics := wszDllXamlDiagnostics is String ? StrPtr(wszDllXamlDiagnostics) : wszDllXamlDiagnostics
        wszTAPDllName := wszTAPDllName is String ? StrPtr(wszTAPDllName) : wszTAPDllName
        wszInitializationData := wszInitializationData is String ? StrPtr(wszInitializationData) : wszInitializationData

        result := DllCall("Windows.UI.Xaml.dll\InitializeXamlDiagnosticsEx", "ptr", endPointName, "uint", pid, "ptr", wszDllXamlDiagnostics, "ptr", wszTAPDllName, "ptr", tapClsid, "ptr", wszInitializationData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
