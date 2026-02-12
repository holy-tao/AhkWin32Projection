#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITouchpadGlobalActionEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class TouchpadGlobalActionEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITouchpadGlobalActionEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITouchpadGlobalActionEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * @type {PointerDevice} 
     */
    PointerDevice {
        get => this.get_PointerDevice()
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
    get_Action() {
        if (!this.HasProp("__ITouchpadGlobalActionEventArgs")) {
            if ((queryResult := this.QueryInterface(ITouchpadGlobalActionEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGlobalActionEventArgs := ITouchpadGlobalActionEventArgs(outPtr)
        }

        return this.__ITouchpadGlobalActionEventArgs.get_Action()
    }

    /**
     * 
     * @returns {PointerDevice} 
     */
    get_PointerDevice() {
        if (!this.HasProp("__ITouchpadGlobalActionEventArgs")) {
            if ((queryResult := this.QueryInterface(ITouchpadGlobalActionEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGlobalActionEventArgs := ITouchpadGlobalActionEventArgs(outPtr)
        }

        return this.__ITouchpadGlobalActionEventArgs.get_PointerDevice()
    }

;@endregion Instance Methods
}
