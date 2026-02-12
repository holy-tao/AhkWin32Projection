#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICallStateChangeEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Supports the [EndRequested](voipphonecall_endrequested.md), [HoldRequested](voipphonecall_holdrequested.md), and [ResumeRequested](voipphonecall_resumerequested.md) events of the [VoipPhoneCall](voipphonecall.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.callstatechangeeventargs
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class CallStateChangeEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICallStateChangeEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICallStateChangeEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current state of the VoIP call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.callstatechangeeventargs.state
     * @type {Integer} 
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
    get_State() {
        if (!this.HasProp("__ICallStateChangeEventArgs")) {
            if ((queryResult := this.QueryInterface(ICallStateChangeEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallStateChangeEventArgs := ICallStateChangeEventArgs(outPtr)
        }

        return this.__ICallStateChangeEventArgs.get_State()
    }

;@endregion Instance Methods
}
