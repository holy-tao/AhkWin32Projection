#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDialAppStateDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the state of the DIAL app.
 * @remarks
 * This object is returned when [GetAppStateAsync](dialapp_getappstateasync_2130355982.md) is called on a DIAL app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialappstatedetails
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class DialAppStateDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDialAppStateDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDialAppStateDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the state of the application at the time the [GetAppStateAsync](dialapp_getappstateasync_2130355982.md) was completed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialappstatedetails.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the entire XML response that is provided by the app when state of the app was requested.
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialappstatedetails.fullxml
     * @type {HSTRING} 
     */
    FullXml {
        get => this.get_FullXml()
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
        if (!this.HasProp("__IDialAppStateDetails")) {
            if ((queryResult := this.QueryInterface(IDialAppStateDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialAppStateDetails := IDialAppStateDetails(outPtr)
        }

        return this.__IDialAppStateDetails.get_State()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FullXml() {
        if (!this.HasProp("__IDialAppStateDetails")) {
            if ((queryResult := this.QueryInterface(IDialAppStateDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialAppStateDetails := IDialAppStateDetails(outPtr)
        }

        return this.__IDialAppStateDetails.get_FullXml()
    }

;@endregion Instance Methods
}
