#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverApplySettingsResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of attempting to apply settings on the [MiracastReceiver](miracastreceiver.md).
 * @remarks
 * This object is returned by [MiracastReceiver.DisconnectAllAndApplySettings](miracastreceiver_disconnectallandapplysettings_1413841516.md) and [MiracastReceiver.DisconnectAllAndApplySettingsAsync](miracastreceiver_disconnectallandapplysettingsasync_404771925.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverapplysettingsresult
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverApplySettingsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverApplySettingsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverApplySettingsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of a [DisconnectAllAndApplySettings](miracastreceiver_disconnectallandapplysettings_1413841516.md) or [DisconnectAllAndApplySettingsAsync](miracastreceiver_disconnectallandapplysettingsasync_404771925.md) operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverapplysettingsresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the extended error code for the [MiracastReceiverApplySettingsResult](miracastreceiverapplysettingsresult.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverapplysettingsresult.extendederror
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
        if (!this.HasProp("__IMiracastReceiverApplySettingsResult")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverApplySettingsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverApplySettingsResult := IMiracastReceiverApplySettingsResult(outPtr)
        }

        return this.__IMiracastReceiverApplySettingsResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IMiracastReceiverApplySettingsResult")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverApplySettingsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverApplySettingsResult := IMiracastReceiverApplySettingsResult(outPtr)
        }

        return this.__IMiracastReceiverApplySettingsResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
