#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemUpdateLastErrorInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Information about the last failed system update.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatelasterrorinfo
 * @namespace Windows.System.Update
 * @version WindowsRuntime 1.4
 */
class SystemUpdateLastErrorInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemUpdateLastErrorInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemUpdateLastErrorInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **SystemUpdateManager** state when the last error occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatelasterrorinfo.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Extended error description.
     * @remarks
     * May be set even when an exception is not thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatelasterrorinfo.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Specifies if the last update error occurred during an interactive update.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatelasterrorinfo.isinteractive
     * @type {Boolean} 
     */
    IsInteractive {
        get => this.get_IsInteractive()
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
    get_State() {
        if (!this.HasProp("__ISystemUpdateLastErrorInfo")) {
            if ((queryResult := this.QueryInterface(ISystemUpdateLastErrorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemUpdateLastErrorInfo := ISystemUpdateLastErrorInfo(outPtr)
        }

        return this.__ISystemUpdateLastErrorInfo.get_State()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__ISystemUpdateLastErrorInfo")) {
            if ((queryResult := this.QueryInterface(ISystemUpdateLastErrorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemUpdateLastErrorInfo := ISystemUpdateLastErrorInfo(outPtr)
        }

        return this.__ISystemUpdateLastErrorInfo.get_ExtendedError()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInteractive() {
        if (!this.HasProp("__ISystemUpdateLastErrorInfo")) {
            if ((queryResult := this.QueryInterface(ISystemUpdateLastErrorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemUpdateLastErrorInfo := ISystemUpdateLastErrorInfo(outPtr)
        }

        return this.__ISystemUpdateLastErrorInfo.get_IsInteractive()
    }

;@endregion Instance Methods
}
