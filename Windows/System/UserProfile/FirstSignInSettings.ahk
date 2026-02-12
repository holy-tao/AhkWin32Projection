#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\IFirstSignInSettings.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include .\IFirstSignInSettingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of settings that a user can opt-in to during the first run experience.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.firstsigninsettings
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class FirstSignInSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFirstSignInSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFirstSignInSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default instance of the settings.
     * @returns {FirstSignInSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.firstsigninsettings.getdefault
     */
    static GetDefault() {
        if (!FirstSignInSettings.HasProp("__IFirstSignInSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.FirstSignInSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFirstSignInSettingsStatics.IID)
            FirstSignInSettings.__IFirstSignInSettingsStatics := IFirstSignInSettingsStatics(factoryPtr)
        }

        return FirstSignInSettings.__IFirstSignInSettingsStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Returns the number of elements in the map.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.firstsigninsettings.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[key] {
        get => this.Lookup(key)
        set => this.Insert(key, value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns the item in the map view with the specified key.
     * @param {Generic} key The key to locate in the map view.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.firstsigninsettings.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{bb78502a-f79d-54fa-92c9-90c5039fdf7e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMapView.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{bb78502a-f79d-54fa-92c9-90c5039fdf7e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMapView.get_Size()
    }

    /**
     * Determines whether the map view contains the specified key.
     * @param {Generic} key The key to locate in the map view.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.firstsigninsettings.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{bb78502a-f79d-54fa-92c9-90c5039fdf7e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMapView.HasKey(key)
    }

    /**
     * Splits the map view into two views.
     * @param {Pointer<IMapView>} first The first part of the original map.
     * @param {Pointer<IMapView>} second The second part of the original map.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.firstsigninsettings.split
     */
    Split(first, second) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{bb78502a-f79d-54fa-92c9-90c5039fdf7e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMapView.Split(first, second)
    }

    /**
     * Returns an iterator for the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.firstsigninsettings.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{fe2f3d47-5d47-5499-8374-430c7cda0204}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), IInspectable), outPtr)
        }

        return this.__IIterable.First()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
