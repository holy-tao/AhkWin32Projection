#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILaunchUriResult.ahk
#Include ..\..\Guid.ahk

/**
 * Represents the results of a Uri launch.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.launchuriresult
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class LaunchUriResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILaunchUriResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILaunchUriResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the Uri launch.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launchuriresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the result of the Uri launch.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launchuriresult.result
     * @type {ValueSet} 
     */
    Result {
        get => this.get_Result()
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
    get_Status() {
        if (!this.HasProp("__ILaunchUriResult")) {
            if ((queryResult := this.QueryInterface(ILaunchUriResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILaunchUriResult := ILaunchUriResult(outPtr)
        }

        return this.__ILaunchUriResult.get_Status()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Result() {
        if (!this.HasProp("__ILaunchUriResult")) {
            if ((queryResult := this.QueryInterface(ILaunchUriResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILaunchUriResult := ILaunchUriResult(outPtr)
        }

        return this.__ILaunchUriResult.get_Result()
    }

;@endregion Instance Methods
}
