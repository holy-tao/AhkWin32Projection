#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemCpuUsage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to data about the CPU usage of the system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemcpuusage
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class SystemCpuUsage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemCpuUsage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemCpuUsage.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the CPU usage report for the system.
     * @returns {SystemCpuUsageReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemcpuusage.getreport
     */
    GetReport() {
        if (!this.HasProp("__ISystemCpuUsage")) {
            if ((queryResult := this.QueryInterface(ISystemCpuUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemCpuUsage := ISystemCpuUsage(outPtr)
        }

        return this.__ISystemCpuUsage.GetReport()
    }

;@endregion Instance Methods
}
