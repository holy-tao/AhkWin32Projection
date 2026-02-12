#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDiagnosticActionResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a property bag containing the results of a diagnostic action.
 * @remarks
 * This API requires the **Diagnostics** capability.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.diagnosticactionresult
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class DiagnosticActionResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDiagnosticActionResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDiagnosticActionResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Contains extended error data about a diagnostic action.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.diagnosticactionresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Contains the results of executing a diagnostics troubleshooting package.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.diagnosticactionresult.results
     * @type {ValueSet} 
     */
    Results {
        get => this.get_Results()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IDiagnosticActionResult")) {
            if ((queryResult := this.QueryInterface(IDiagnosticActionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDiagnosticActionResult := IDiagnosticActionResult(outPtr)
        }

        return this.__IDiagnosticActionResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Results() {
        if (!this.HasProp("__IDiagnosticActionResult")) {
            if ((queryResult := this.QueryInterface(IDiagnosticActionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDiagnosticActionResult := IDiagnosticActionResult(outPtr)
        }

        return this.__IDiagnosticActionResult.get_Results()
    }

;@endregion Instance Methods
}
