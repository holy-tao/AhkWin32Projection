#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverSessionStartResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of attempting to start the [MiracastReceiverSession](miracastreceiversession.md).
 * @remarks
 * This object is returned by [MiracastReceiverSession.Start](miracastreceiversession_start_1587696324.md) and [MiracastReceiverSession.StartAsync](miracastreceiversession_startasync_1931900819.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversessionstartresult
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverSessionStartResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverSessionStartResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverSessionStartResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the status of a [Start](miracastreceiversession_start_1587696324.md) or [StartAsync](miracastreceiversession_startasync_1931900819.md) operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversessionstartresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the extended error code for the [MiracastReceiverSessionStartResult](miracastreceiversessionstartresult.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversessionstartresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
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
    get_Status() {
        if (!this.HasProp("__IMiracastReceiverSessionStartResult")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSessionStartResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSessionStartResult := IMiracastReceiverSessionStartResult(outPtr)
        }

        return this.__IMiracastReceiverSessionStartResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IMiracastReceiverSessionStartResult")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSessionStartResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSessionStartResult := IMiracastReceiverSessionStartResult(outPtr)
        }

        return this.__IMiracastReceiverSessionStartResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
