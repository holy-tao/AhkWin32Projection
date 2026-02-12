#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneLineWatcherEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a class that contains the information about which phone line was added, removed, or updated.
 * @remarks
 * This class is used in the event arguments for the events raised by the [PhoneLineWatcher](phonelinewatcher.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinewatchereventargs
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneLineWatcherEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneLineWatcherEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneLineWatcherEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the phone line that triggered the [LineAdded](phonelinewatcher_lineadded.md), [LineRemoved](phonelinewatcher_lineremoved.md), or [LineUpdated](phonelinewatcher_lineupdated.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinewatchereventargs.lineid
     * @type {Guid} 
     */
    LineId {
        get => this.get_LineId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LineId() {
        if (!this.HasProp("__IPhoneLineWatcherEventArgs")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcherEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcherEventArgs := IPhoneLineWatcherEventArgs(outPtr)
        }

        return this.__IPhoneLineWatcherEventArgs.get_LineId()
    }

;@endregion Instance Methods
}
