#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMuteChangeEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Supports the [NotifyMuted](voipcallcoordinator_notifymuted_910830725.md) and [NotifyUnmuted](voipcallcoordinator_notifyunmuted_41225160.md) events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.mutechangeeventargs
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class MuteChangeEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMuteChangeEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMuteChangeEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the call is currently muted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.mutechangeeventargs.muted
     * @type {Boolean} 
     */
    Muted {
        get => this.get_Muted()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Muted() {
        if (!this.HasProp("__IMuteChangeEventArgs")) {
            if ((queryResult := this.QueryInterface(IMuteChangeEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMuteChangeEventArgs := IMuteChangeEventArgs(outPtr)
        }

        return this.__IMuteChangeEventArgs.get_Muted()
    }

;@endregion Instance Methods
}
