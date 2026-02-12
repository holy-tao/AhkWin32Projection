#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayManagerResultWithState.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the status of a [DisplayManager](displaymanager.md) operation, and a resulting [DisplayState](displaystate.md) if the operation was successful.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerresultwithstate
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayManagerResultWithState extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayManagerResultWithState

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayManagerResultWithState.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the success or error status of the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerresultwithstate.errorcode
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * Gets an HRESULT value indicating how the operation succeeded or failed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerresultwithstate.extendederrorcode
     * @type {HRESULT} 
     */
    ExtendedErrorCode {
        get => this.get_ExtendedErrorCode()
    }

    /**
     * Gets the [DisplayState](displaystate.md) object that resulted from the operation, if successful.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerresultwithstate.state
     * @type {DisplayState} 
     */
    State {
        get => this.get_State()
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
    get_ErrorCode() {
        if (!this.HasProp("__IDisplayManagerResultWithState")) {
            if ((queryResult := this.QueryInterface(IDisplayManagerResultWithState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManagerResultWithState := IDisplayManagerResultWithState(outPtr)
        }

        return this.__IDisplayManagerResultWithState.get_ErrorCode()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedErrorCode() {
        if (!this.HasProp("__IDisplayManagerResultWithState")) {
            if ((queryResult := this.QueryInterface(IDisplayManagerResultWithState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManagerResultWithState := IDisplayManagerResultWithState(outPtr)
        }

        return this.__IDisplayManagerResultWithState.get_ExtendedErrorCode()
    }

    /**
     * 
     * @returns {DisplayState} 
     */
    get_State() {
        if (!this.HasProp("__IDisplayManagerResultWithState")) {
            if ((queryResult := this.QueryInterface(IDisplayManagerResultWithState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManagerResultWithState := IDisplayManagerResultWithState(outPtr)
        }

        return this.__IDisplayManagerResultWithState.get_State()
    }

;@endregion Instance Methods
}
