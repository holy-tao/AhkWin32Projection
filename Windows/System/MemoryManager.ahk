#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMemoryManagerStatics.ahk
#Include .\IMemoryManagerStatics3.ahk
#Include .\IMemoryManagerStatics4.ahk
#Include .\IMemoryManagerStatics2.ahk
#Include ..\..\Guid.ahk

/**
 * Provides access to information on an app's memory usage.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.memorymanager
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class MemoryManager extends IInspectable {
;@region Static Properties
    /**
     * Gets the app's current memory usage.
     * @see https://learn.microsoft.com/uwp/api/windows.system.memorymanager.appmemoryusage
     * @type {Integer} 
     */
    static AppMemoryUsage {
        get => MemoryManager.get_AppMemoryUsage()
    }

    /**
     * Gets the app's memory usage limit.
     * @see https://learn.microsoft.com/uwp/api/windows.system.memorymanager.appmemoryusagelimit
     * @type {Integer} 
     */
    static AppMemoryUsageLimit {
        get => MemoryManager.get_AppMemoryUsageLimit()
    }

    /**
     * Gets the app's memory usage level.
     * @see https://learn.microsoft.com/uwp/api/windows.system.memorymanager.appmemoryusagelevel
     * @type {Integer} 
     */
    static AppMemoryUsageLevel {
        get => MemoryManager.get_AppMemoryUsageLevel()
    }

    /**
     * Gets the amount of memory that your app may expect to have available.
     * @remarks
     * When an app launches on Xbox, it is initially given a small app memory usage limit that may grow as the system frees memory. This property returns the expected upper limit that your app will be able to use.
     * 
     * When an app launches on a non-Xbox system, the memory usage limit the app gets at launch remains the same and this property will return the same value as [Windows.System.MemoryManager.AppMemoryUsageLimit](memorymanager_appmemoryusagelimit.md).
     * @see https://learn.microsoft.com/uwp/api/windows.system.memorymanager.expectedappmemoryusagelimit
     * @type {Integer} 
     */
    static ExpectedAppMemoryUsageLimit {
        get => MemoryManager.get_ExpectedAppMemoryUsageLimit()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_AppMemoryUsage() {
        if (!MemoryManager.HasProp("__IMemoryManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.MemoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryManagerStatics.IID)
            MemoryManager.__IMemoryManagerStatics := IMemoryManagerStatics(factoryPtr)
        }

        return MemoryManager.__IMemoryManagerStatics.get_AppMemoryUsage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_AppMemoryUsageLimit() {
        if (!MemoryManager.HasProp("__IMemoryManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.MemoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryManagerStatics.IID)
            MemoryManager.__IMemoryManagerStatics := IMemoryManagerStatics(factoryPtr)
        }

        return MemoryManager.__IMemoryManagerStatics.get_AppMemoryUsageLimit()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_AppMemoryUsageLevel() {
        if (!MemoryManager.HasProp("__IMemoryManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.MemoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryManagerStatics.IID)
            MemoryManager.__IMemoryManagerStatics := IMemoryManagerStatics(factoryPtr)
        }

        return MemoryManager.__IMemoryManagerStatics.get_AppMemoryUsageLevel()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_AppMemoryUsageIncreased(handler) {
        if (!MemoryManager.HasProp("__IMemoryManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.MemoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryManagerStatics.IID)
            MemoryManager.__IMemoryManagerStatics := IMemoryManagerStatics(factoryPtr)
        }

        return MemoryManager.__IMemoryManagerStatics.add_AppMemoryUsageIncreased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_AppMemoryUsageIncreased(token) {
        if (!MemoryManager.HasProp("__IMemoryManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.MemoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryManagerStatics.IID)
            MemoryManager.__IMemoryManagerStatics := IMemoryManagerStatics(factoryPtr)
        }

        return MemoryManager.__IMemoryManagerStatics.remove_AppMemoryUsageIncreased(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_AppMemoryUsageDecreased(handler) {
        if (!MemoryManager.HasProp("__IMemoryManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.MemoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryManagerStatics.IID)
            MemoryManager.__IMemoryManagerStatics := IMemoryManagerStatics(factoryPtr)
        }

        return MemoryManager.__IMemoryManagerStatics.add_AppMemoryUsageDecreased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_AppMemoryUsageDecreased(token) {
        if (!MemoryManager.HasProp("__IMemoryManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.MemoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryManagerStatics.IID)
            MemoryManager.__IMemoryManagerStatics := IMemoryManagerStatics(factoryPtr)
        }

        return MemoryManager.__IMemoryManagerStatics.remove_AppMemoryUsageDecreased(token)
    }

    /**
     * 
     * @param {EventHandler<AppMemoryUsageLimitChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_AppMemoryUsageLimitChanging(handler) {
        if (!MemoryManager.HasProp("__IMemoryManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.MemoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryManagerStatics.IID)
            MemoryManager.__IMemoryManagerStatics := IMemoryManagerStatics(factoryPtr)
        }

        return MemoryManager.__IMemoryManagerStatics.add_AppMemoryUsageLimitChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_AppMemoryUsageLimitChanging(token) {
        if (!MemoryManager.HasProp("__IMemoryManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.MemoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryManagerStatics.IID)
            MemoryManager.__IMemoryManagerStatics := IMemoryManagerStatics(factoryPtr)
        }

        return MemoryManager.__IMemoryManagerStatics.remove_AppMemoryUsageLimitChanging(token)
    }

    /**
     * Tries to set a specific memory cap for the current app or task. In cases where memory caps are shared between foreground and background components, any difference between the default cap and the new request will be assigned to the other component.
     * @param {Integer} value The new memory limit to set.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.memorymanager.trysetappmemoryusagelimit
     */
    static TrySetAppMemoryUsageLimit(value) {
        if (!MemoryManager.HasProp("__IMemoryManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.System.MemoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryManagerStatics3.IID)
            MemoryManager.__IMemoryManagerStatics3 := IMemoryManagerStatics3(factoryPtr)
        }

        return MemoryManager.__IMemoryManagerStatics3.TrySetAppMemoryUsageLimit(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ExpectedAppMemoryUsageLimit() {
        if (!MemoryManager.HasProp("__IMemoryManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.System.MemoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryManagerStatics4.IID)
            MemoryManager.__IMemoryManagerStatics4 := IMemoryManagerStatics4(factoryPtr)
        }

        return MemoryManager.__IMemoryManagerStatics4.get_ExpectedAppMemoryUsageLimit()
    }

    /**
     * Gets an [AppMemoryReport](appmemoryreport.md) for the app, which provides information about its memory usage.
     * @returns {AppMemoryReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.memorymanager.getappmemoryreport
     */
    static GetAppMemoryReport() {
        if (!MemoryManager.HasProp("__IMemoryManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.MemoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryManagerStatics2.IID)
            MemoryManager.__IMemoryManagerStatics2 := IMemoryManagerStatics2(factoryPtr)
        }

        return MemoryManager.__IMemoryManagerStatics2.GetAppMemoryReport()
    }

    /**
     * Gets a [ProcessMemoryReport](processmemoryreport.md) for a process, which provides information about its memory usage.
     * @returns {ProcessMemoryReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.memorymanager.getprocessmemoryreport
     */
    static GetProcessMemoryReport() {
        if (!MemoryManager.HasProp("__IMemoryManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.MemoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMemoryManagerStatics2.IID)
            MemoryManager.__IMemoryManagerStatics2 := IMemoryManagerStatics2(factoryPtr)
        }

        return MemoryManager.__IMemoryManagerStatics2.GetProcessMemoryReport()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
