#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICallAnswerEventArgs.ahk
#Include .\ICallAnswerEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Supports the [AnswerRequested](voipphonecall_answerrequested.md) event of the [VoipPhoneCall](voipphonecall.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.callanswereventargs
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class CallAnswerEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICallAnswerEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICallAnswerEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the media types that the user selected when answering the call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.callanswereventargs.acceptedmedia
     * @type {Integer} 
     */
    AcceptedMedia {
        get => this.get_AcceptedMedia()
    }

    /**
     * Gets the ID of the call control peripheral device that initiated the answer request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.callanswereventargs.sourcedeviceid
     * @type {HSTRING} 
     */
    SourceDeviceId {
        get => this.get_SourceDeviceId()
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
    get_AcceptedMedia() {
        if (!this.HasProp("__ICallAnswerEventArgs")) {
            if ((queryResult := this.QueryInterface(ICallAnswerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallAnswerEventArgs := ICallAnswerEventArgs(outPtr)
        }

        return this.__ICallAnswerEventArgs.get_AcceptedMedia()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceDeviceId() {
        if (!this.HasProp("__ICallAnswerEventArgs2")) {
            if ((queryResult := this.QueryInterface(ICallAnswerEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallAnswerEventArgs2 := ICallAnswerEventArgs2(outPtr)
        }

        return this.__ICallAnswerEventArgs2.get_SourceDeviceId()
    }

;@endregion Instance Methods
}
