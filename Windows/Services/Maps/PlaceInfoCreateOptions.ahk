#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlaceInfoCreateOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the information about a map location that your app can show in a light-dismissible window within your app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfocreateoptions
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class PlaceInfoCreateOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlaceInfoCreateOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlaceInfoCreateOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the display name associated with the [PlaceInfoCreateOptions](placeinfocreateoptions.md).
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfocreateoptions.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets the address associated with the [PlaceInfoCreateOptions](placeinfocreateoptions.md).
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfocreateoptions.displayaddress
     * @type {HSTRING} 
     */
    DisplayAddress {
        get => this.get_DisplayAddress()
        set => this.put_DisplayAddress(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [PlaceInfoCreateOptions](placeinfocreateoptions.md) instance.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.PlaceInfoCreateOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IPlaceInfoCreateOptions")) {
            if ((queryResult := this.QueryInterface(IPlaceInfoCreateOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaceInfoCreateOptions := IPlaceInfoCreateOptions(outPtr)
        }

        return this.__IPlaceInfoCreateOptions.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPlaceInfoCreateOptions")) {
            if ((queryResult := this.QueryInterface(IPlaceInfoCreateOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaceInfoCreateOptions := IPlaceInfoCreateOptions(outPtr)
        }

        return this.__IPlaceInfoCreateOptions.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayAddress(value) {
        if (!this.HasProp("__IPlaceInfoCreateOptions")) {
            if ((queryResult := this.QueryInterface(IPlaceInfoCreateOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaceInfoCreateOptions := IPlaceInfoCreateOptions(outPtr)
        }

        return this.__IPlaceInfoCreateOptions.put_DisplayAddress(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayAddress() {
        if (!this.HasProp("__IPlaceInfoCreateOptions")) {
            if ((queryResult := this.QueryInterface(IPlaceInfoCreateOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaceInfoCreateOptions := IPlaceInfoCreateOptions(outPtr)
        }

        return this.__IPlaceInfoCreateOptions.get_DisplayAddress()
    }

;@endregion Instance Methods
}
