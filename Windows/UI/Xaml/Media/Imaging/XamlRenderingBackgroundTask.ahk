#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXamlRenderingBackgroundTask.ahk
#Include .\IXamlRenderingBackgroundTaskOverrides.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides the ability to create a bitmap from a XAML tree in a background task.
 * @remarks
 * > [!IMPORTANT]
 * > To keep the memory footprint of the background task as low as possible, this task should be implemented in a C++ Windows Runtime Component for Windows Phone. The memory footprint will be higher if written in C# and will cause out of memory exceptions on low-memory devices which will terminate the background task. For more information on memory constraints, see [Support your app with background tasks](/windows/uwp/launch-resume/support-your-app-with-background-tasks).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.xamlrenderingbackgroundtask
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class XamlRenderingBackgroundTask extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXamlRenderingBackgroundTask

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXamlRenderingBackgroundTask.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Performs the work of the background task. The system calls this method when the associated background task has been triggered.
     * @remarks
     * > [!IMPORTANT]
     * > To keep the memory footprint of the background task as low as possible, this task should be implemented in a C++ Windows Runtime Component for Windows Phone. The memory footprint will be higher if written in C# and will cause out of memory exceptions on low-memory devices which will terminate the background task. For more information on memory constraints, see [Support your app with background tasks](/windows/uwp/launch-resume/support-your-app-with-background-tasks).
     * @param {IBackgroundTaskInstance} taskInstance An interface to an instance of the background task. The system creates this instance when the task has been triggered to run.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.xamlrenderingbackgroundtask.onrun
     */
    OnRun(taskInstance) {
        if (!this.HasProp("__IXamlRenderingBackgroundTaskOverrides")) {
            if ((queryResult := this.QueryInterface(IXamlRenderingBackgroundTaskOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlRenderingBackgroundTaskOverrides := IXamlRenderingBackgroundTaskOverrides(outPtr)
        }

        return this.__IXamlRenderingBackgroundTaskOverrides.OnRun(taskInstance)
    }

;@endregion Instance Methods
}
