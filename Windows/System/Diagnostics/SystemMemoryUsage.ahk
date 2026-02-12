#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemMemoryUsage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to data about the memory usage of the system.
 * @remarks
 * Call SystemDiagnosticInfo.MemoryUsage to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemmemoryusage
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class SystemMemoryUsage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemMemoryUsage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemMemoryUsage.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the memory usage report for the system.
     * @returns {SystemMemoryUsageReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemmemoryusage.getreport
     */
    GetReport() {
        if (!this.HasProp("__ISystemMemoryUsage")) {
            if ((queryResult := this.QueryInterface(ISystemMemoryUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMemoryUsage := ISystemMemoryUsage(outPtr)
        }

        return this.__ISystemMemoryUsage.GetReport()
    }

;@endregion Instance Methods
}
