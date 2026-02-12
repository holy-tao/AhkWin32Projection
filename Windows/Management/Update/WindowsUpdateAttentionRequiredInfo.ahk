#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateAttentionRequiredInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a tuple of a [WindowsUpdateAttentionRequiredReason](./windowsupdateattentionrequiredreason.md) and a timestamp.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateattentionrequiredinfo
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateAttentionRequiredInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateAttentionRequiredInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateAttentionRequiredInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the specific reason that attention is required for an update that was blocked from proceeding.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateattentionrequiredinfo.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

    /**
     * Gets the timestamp at which an update was blocked due to needing additional attention.
     * @remarks
     * The time is reported in the local time of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateattentionrequiredinfo.timestamp
     * @type {IReference<DateTime>} 
     */
    Timestamp {
        get => this.get_Timestamp()
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
    get_Reason() {
        if (!this.HasProp("__IWindowsUpdateAttentionRequiredInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateAttentionRequiredInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateAttentionRequiredInfo := IWindowsUpdateAttentionRequiredInfo(outPtr)
        }

        return this.__IWindowsUpdateAttentionRequiredInfo.get_Reason()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IWindowsUpdateAttentionRequiredInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateAttentionRequiredInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateAttentionRequiredInfo := IWindowsUpdateAttentionRequiredInfo(outPtr)
        }

        return this.__IWindowsUpdateAttentionRequiredInfo.get_Timestamp()
    }

;@endregion Instance Methods
}
