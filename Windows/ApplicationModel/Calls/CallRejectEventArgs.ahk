#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICallRejectEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Supports the [RejectRequested](voipphonecall_rejectrequested.md) event of the [VoipPhoneCall](voipphonecall.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.callrejecteventargs
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class CallRejectEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICallRejectEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICallRejectEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the reason the incoming call was rejected.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.callrejecteventargs.rejectreason
     * @type {Integer} 
     */
    RejectReason {
        get => this.get_RejectReason()
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
    get_RejectReason() {
        if (!this.HasProp("__ICallRejectEventArgs")) {
            if ((queryResult := this.QueryInterface(ICallRejectEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallRejectEventArgs := ICallRejectEventArgs(outPtr)
        }

        return this.__ICallRejectEventArgs.get_RejectReason()
    }

;@endregion Instance Methods
}
