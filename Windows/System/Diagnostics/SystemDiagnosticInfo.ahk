#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemDiagnosticInfo.ahk
#Include .\ISystemDiagnosticInfoStatics2.ahk
#Include .\ISystemDiagnosticInfoStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides diagnostic information about the system, such as CPU usage, disk usage, memory usage and so on.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemdiagnosticinfo
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class SystemDiagnosticInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemDiagnosticInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemDiagnosticInfo.IID

    /**
     * Gets the system's preferred processor architecture.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemdiagnosticinfo.preferredarchitecture
     * @type {Integer} 
     */
    static PreferredArchitecture {
        get => SystemDiagnosticInfo.get_PreferredArchitecture()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Determines if the system supports the specified processor architecture.
     * @param {Integer} type The architecture.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemdiagnosticinfo.isarchitecturesupported
     */
    static IsArchitectureSupported(type) {
        if (!SystemDiagnosticInfo.HasProp("__ISystemDiagnosticInfoStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.SystemDiagnosticInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemDiagnosticInfoStatics2.IID)
            SystemDiagnosticInfo.__ISystemDiagnosticInfoStatics2 := ISystemDiagnosticInfoStatics2(factoryPtr)
        }

        return SystemDiagnosticInfo.__ISystemDiagnosticInfoStatics2.IsArchitectureSupported(type)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_PreferredArchitecture() {
        if (!SystemDiagnosticInfo.HasProp("__ISystemDiagnosticInfoStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.SystemDiagnosticInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemDiagnosticInfoStatics2.IID)
            SystemDiagnosticInfo.__ISystemDiagnosticInfoStatics2 := ISystemDiagnosticInfoStatics2(factoryPtr)
        }

        return SystemDiagnosticInfo.__ISystemDiagnosticInfoStatics2.get_PreferredArchitecture()
    }

    /**
     * Gets the [SystemDiagnosticInfo](systemdiagnosticinfo.md) for the current system.
     * @returns {SystemDiagnosticInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemdiagnosticinfo.getforcurrentsystem
     */
    static GetForCurrentSystem() {
        if (!SystemDiagnosticInfo.HasProp("__ISystemDiagnosticInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.SystemDiagnosticInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemDiagnosticInfoStatics.IID)
            SystemDiagnosticInfo.__ISystemDiagnosticInfoStatics := ISystemDiagnosticInfoStatics(factoryPtr)
        }

        return SystemDiagnosticInfo.__ISystemDiagnosticInfoStatics.GetForCurrentSystem()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets memory usage data for the system.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemdiagnosticinfo.memoryusage
     * @type {SystemMemoryUsage} 
     */
    MemoryUsage {
        get => this.get_MemoryUsage()
    }

    /**
     * Gets the CPU time used by the system.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemdiagnosticinfo.cpuusage
     * @type {SystemCpuUsage} 
     */
    CpuUsage {
        get => this.get_CpuUsage()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SystemMemoryUsage} 
     */
    get_MemoryUsage() {
        if (!this.HasProp("__ISystemDiagnosticInfo")) {
            if ((queryResult := this.QueryInterface(ISystemDiagnosticInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDiagnosticInfo := ISystemDiagnosticInfo(outPtr)
        }

        return this.__ISystemDiagnosticInfo.get_MemoryUsage()
    }

    /**
     * 
     * @returns {SystemCpuUsage} 
     */
    get_CpuUsage() {
        if (!this.HasProp("__ISystemDiagnosticInfo")) {
            if ((queryResult := this.QueryInterface(ISystemDiagnosticInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDiagnosticInfo := ISystemDiagnosticInfo(outPtr)
        }

        return this.__ISystemDiagnosticInfo.get_CpuUsage()
    }

;@endregion Instance Methods
}
