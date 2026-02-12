#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowUILauncher.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides operations for showing a UI for gathering user input that the print workflow app needs to complete the conversion to the page description language (PDL) format indicated by the printer.
 * @remarks
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowuilauncher
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowUILauncher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowUILauncher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowUILauncher.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets a value that indicates whether the ability to show the UI is enabled.
     * @remarks
     * This method will return false if the target stream is already requested or if the session is in silent mode.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowuilauncher.isuilaunchenabled
     */
    IsUILaunchEnabled() {
        if (!this.HasProp("__IPrintWorkflowUILauncher")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowUILauncher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowUILauncher := IPrintWorkflowUILauncher(outPtr)
        }

        return this.__IPrintWorkflowUILauncher.IsUILaunchEnabled()
    }

    /**
     * Shows the print workflow job UI for gathering user input that the print workflow app needs to complete the conversion to the page description language (PDL) format indicated by the printer. This is an async operation that will be completed only after the UI is closed.
     * @remarks
     * This method will fail if the [IsUILaunchEnabled](printworkflowuilauncher_isuilaunchenabled_2011926829.md) method returns false.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowuilauncher.launchandcompleteuiasync
     */
    LaunchAndCompleteUIAsync() {
        if (!this.HasProp("__IPrintWorkflowUILauncher")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowUILauncher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowUILauncher := IPrintWorkflowUILauncher(outPtr)
        }

        return this.__IPrintWorkflowUILauncher.LaunchAndCompleteUIAsync()
    }

;@endregion Instance Methods
}
