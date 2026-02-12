#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsXamlManager.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IWindowsXamlManagerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the UWP XAML framework in a non-UWP desktop application (for example, a WPF or Windows Forms application) that hosts UWP controls.
 * @remarks
 * **WindowsXamlManager** is part of the *UWP XAML hosting API*. This API enables non-UWP desktop applications to host any control that derives from [Windows.UI.Xaml.UIElement](../windows.ui.xaml/uielement.md)) in a UI element that is associated with a window handle (HWND). This API can be used by desktop applications built using WPF, Windows Forms, and the Windows API (Win32). For more information, see [Using the UWP XAML hosting API in a desktop application](/windows/uwp/xaml-platform/using-the-xaml-hosting-api).
 * 
 * **WindowsXamlManager** provides a static [InitializeForCurrentThread](windowsxamlmanager_initializeforcurrentthread_14911797.md) method you can use to initialize the UWP XAML framework on the current thread.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.windowsxamlmanager
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class WindowsXamlManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsXamlManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsXamlManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes the UWP XAML framework in a non-UWP desktop application (for example, a WPF or Windows Forms application) on the current thread.
     * @remarks
     * Call this method to initialize the internal UWP XAML framework for the current thread in a desktop application in which you want to host [Windows.UI.Xaml.UIElement](../windows.ui.xaml/uielement.md) objects in a [DesktopWindowXamlSource](desktopwindowxamlsource.md). You only need to explicitly call this method if your application creates the **Windows.UI.Xaml.UIElement** objects before it creates the **DesktopWindowXamlSource** object that will host them. Your application should typically should call this method when the parent UI object that hosts the **DesktopWindowXamlSource** is instantiated.
     * 
     * If you create a **DesktopWindowXamlSource** object before you create the **Windows.UI.Xaml.UIElement** objects that will be hosted in it, you don’t need to call this method. In this scenario, the UWP XAML framework will be initialized for you when you instantiate the **DesktopWindowXamlSource** object.
     * 
     * This method returns a [WindowsXamlManager](windowsxamlmanager.md) object that contains a reference to the UWP XAML framework. You can create as many **WindowsXamlManager** objects as you want on a given thread. However, because each object holds a reference to the UWP XAML framework, you should **Close** (**Dispose** in .NET) the objects to ensure that XAML resources are eventually released.
     * @returns {WindowsXamlManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.windowsxamlmanager.initializeforcurrentthread
     */
    static InitializeForCurrentThread() {
        if (!WindowsXamlManager.HasProp("__IWindowsXamlManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.WindowsXamlManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsXamlManagerStatics.IID)
            WindowsXamlManager.__IWindowsXamlManagerStatics := IWindowsXamlManagerStatics(factoryPtr)
        }

        return WindowsXamlManager.__IWindowsXamlManagerStatics.InitializeForCurrentThread()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Closes and asynchronously releases any resources used by this [WindowsXamlManager](windowsxamlmanager.md).
     * @remarks
     * This method operates asynchronously.
     * 
     * Ensure that all asynchronous work has completed before exiting the thread on which the WindowsXamlManager was initialized. Some ways to do this include:
     * 
     * - Calling [DispatcherQueueController.ShutdownQueueAsync](../windows.system/dispatcherqueuecontroller_shutdownqueueasync_542547627.md) and awaiting its completion.
     * - Running the top-level message pump until `PeekMessage` returns `FALSE`.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.windowsxamlmanager.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
