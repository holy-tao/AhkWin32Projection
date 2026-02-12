#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILauncherUIOptions.ahk
#Include ..\..\Guid.ahk

/**
 * Specifies options for user interface elements such as the application picker that can be invoked by this API.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.launcheruioptions
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class LauncherUIOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILauncherUIOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILauncherUIOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the point on the screen where the user opened a file or URI.
     * @remarks
     * To get or set the selection rectangle, use the [SelectionRect](launcheruioptions_selectionrect.md) method.
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > This property is only implemented on Desktop devices.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheruioptions.invocationpoint
     * @type {IReference<POINT>} 
     */
    InvocationPoint {
        get => this.get_InvocationPoint()
        set => this.put_InvocationPoint(value)
    }

    /**
     * Gets or sets the selection rectangle on the screen where the user opened a file or URI.
     * @remarks
     * To get or set the invocation point, use the [InvocationPoint](launcheruioptions_invocationpoint.md) method.
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > This property is only implemented on Desktop devices.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheruioptions.selectionrect
     * @type {IReference<RECT>} 
     */
    SelectionRect {
        get => this.get_SelectionRect()
        set => this.put_SelectionRect(value)
    }

    /**
     * Gets or sets the preferred placement of the **Open With** and **Warning** dialog boxes when starting a default app.
     * @remarks
     * > [!IMPORTANT]
     * > This property is only implemented on Desktop devices.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheruioptions.preferredplacement
     * @type {Integer} 
     */
    PreferredPlacement {
        get => this.get_PreferredPlacement()
        set => this.put_PreferredPlacement(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<POINT>} 
     */
    get_InvocationPoint() {
        if (!this.HasProp("__ILauncherUIOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherUIOptions := ILauncherUIOptions(outPtr)
        }

        return this.__ILauncherUIOptions.get_InvocationPoint()
    }

    /**
     * 
     * @param {IReference<POINT>} value 
     * @returns {HRESULT} 
     */
    put_InvocationPoint(value) {
        if (!this.HasProp("__ILauncherUIOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherUIOptions := ILauncherUIOptions(outPtr)
        }

        return this.__ILauncherUIOptions.put_InvocationPoint(value)
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_SelectionRect() {
        if (!this.HasProp("__ILauncherUIOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherUIOptions := ILauncherUIOptions(outPtr)
        }

        return this.__ILauncherUIOptions.get_SelectionRect()
    }

    /**
     * 
     * @param {IReference<RECT>} value 
     * @returns {HRESULT} 
     */
    put_SelectionRect(value) {
        if (!this.HasProp("__ILauncherUIOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherUIOptions := ILauncherUIOptions(outPtr)
        }

        return this.__ILauncherUIOptions.put_SelectionRect(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreferredPlacement() {
        if (!this.HasProp("__ILauncherUIOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherUIOptions := ILauncherUIOptions(outPtr)
        }

        return this.__ILauncherUIOptions.get_PreferredPlacement()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PreferredPlacement(value) {
        if (!this.HasProp("__ILauncherUIOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherUIOptions := ILauncherUIOptions(outPtr)
        }

        return this.__ILauncherUIOptions.put_PreferredPlacement(value)
    }

;@endregion Instance Methods
}
