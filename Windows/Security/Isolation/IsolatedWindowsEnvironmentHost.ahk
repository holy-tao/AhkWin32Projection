#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentHostStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Class that represents host device for the Isolated Windows Environment.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmenthost
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentHost extends IInspectable {
;@region Static Properties
    /**
     * **Deprecated.** Boolean value that represents if a host is configured correctly and is ready to create Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmenthost.isready
     * @type {Boolean} 
     */
    static IsReady {
        get => IsolatedWindowsEnvironmentHost.get_IsReady()
    }

    /**
     * **Deprecated.** IVectorView of errors on the host that are needed to be resolved before Isolated Windows Environment can be created on a host.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmenthost.hosterrors
     * @type {IVectorView<Integer>} 
     */
    static HostErrors {
        get => IsolatedWindowsEnvironmentHost.get_HostErrors()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsReady() {
        if (!IsolatedWindowsEnvironmentHost.HasProp("__IIsolatedWindowsEnvironmentHostStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsEnvironmentHost")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIsolatedWindowsEnvironmentHostStatics.IID)
            IsolatedWindowsEnvironmentHost.__IIsolatedWindowsEnvironmentHostStatics := IIsolatedWindowsEnvironmentHostStatics(factoryPtr)
        }

        return IsolatedWindowsEnvironmentHost.__IIsolatedWindowsEnvironmentHostStatics.get_IsReady()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_HostErrors() {
        if (!IsolatedWindowsEnvironmentHost.HasProp("__IIsolatedWindowsEnvironmentHostStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsEnvironmentHost")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIsolatedWindowsEnvironmentHostStatics.IID)
            IsolatedWindowsEnvironmentHost.__IIsolatedWindowsEnvironmentHostStatics := IIsolatedWindowsEnvironmentHostStatics(factoryPtr)
        }

        return IsolatedWindowsEnvironmentHost.__IIsolatedWindowsEnvironmentHostStatics.get_HostErrors()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
