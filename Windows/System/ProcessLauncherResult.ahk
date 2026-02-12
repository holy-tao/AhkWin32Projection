#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessLauncherResult.ahk
#Include ..\..\Guid.ahk

/**
 * Represents the return of the launched process.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.processlauncherresult
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ProcessLauncherResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProcessLauncherResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProcessLauncherResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Represents the exit code of the process that was run from [ProcessLauncher](processlauncher.md).
     * @see https://learn.microsoft.com/uwp/api/windows.system.processlauncherresult.exitcode
     * @type {Integer} 
     */
    ExitCode {
        get => this.get_ExitCode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExitCode() {
        if (!this.HasProp("__IProcessLauncherResult")) {
            if ((queryResult := this.QueryInterface(IProcessLauncherResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessLauncherResult := IProcessLauncherResult(outPtr)
        }

        return this.__IProcessLauncherResult.get_ExitCode()
    }

;@endregion Instance Methods
}
