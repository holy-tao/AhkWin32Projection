#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateActionProgress.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateActionProgress extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateActionProgress

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateActionProgress.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * @type {Integer} 
     */
    CurrentProgress {
        get => this.get_CurrentProgress()
    }

    /**
     * @type {Integer} 
     */
    TotalProgress {
        get => this.get_TotalProgress()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Action() {
        if (!this.HasProp("__IWindowsSoftwareUpdateActionProgress")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateActionProgress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateActionProgress := IWindowsSoftwareUpdateActionProgress(outPtr)
        }

        return this.__IWindowsSoftwareUpdateActionProgress.get_Action()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentProgress() {
        if (!this.HasProp("__IWindowsSoftwareUpdateActionProgress")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateActionProgress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateActionProgress := IWindowsSoftwareUpdateActionProgress(outPtr)
        }

        return this.__IWindowsSoftwareUpdateActionProgress.get_CurrentProgress()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalProgress() {
        if (!this.HasProp("__IWindowsSoftwareUpdateActionProgress")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateActionProgress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateActionProgress := IWindowsSoftwareUpdateActionProgress(outPtr)
        }

        return this.__IWindowsSoftwareUpdateActionProgress.get_TotalProgress()
    }

;@endregion Instance Methods
}
