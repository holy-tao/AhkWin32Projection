#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskConfigurationSaveRequestedDeferral.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Called by the device app to provide an update of the status of the deferral.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printtaskconfigurationsaverequesteddeferral
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class PrintTaskConfigurationSaveRequestedDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskConfigurationSaveRequestedDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskConfigurationSaveRequestedDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Called by the device app when the deferral is completed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printtaskconfigurationsaverequesteddeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IPrintTaskConfigurationSaveRequestedDeferral")) {
            if ((queryResult := this.QueryInterface(IPrintTaskConfigurationSaveRequestedDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskConfigurationSaveRequestedDeferral := IPrintTaskConfigurationSaveRequestedDeferral(outPtr)
        }

        return this.__IPrintTaskConfigurationSaveRequestedDeferral.Complete()
    }

;@endregion Instance Methods
}
