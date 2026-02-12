#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActionInstanceDisplayInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the display of an app action instance.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actioninstancedisplayinfo
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class ActionInstanceDisplayInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActionInstanceDisplayInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActionInstanceDisplayInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the description of the display information for an app action instance.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actioninstancedisplayinfo.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
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
    get_Description() {
        if (!this.HasProp("__IActionInstanceDisplayInfo")) {
            if ((queryResult := this.QueryInterface(IActionInstanceDisplayInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInstanceDisplayInfo := IActionInstanceDisplayInfo(outPtr)
        }

        return this.__IActionInstanceDisplayInfo.get_Description()
    }

;@endregion Instance Methods
}
