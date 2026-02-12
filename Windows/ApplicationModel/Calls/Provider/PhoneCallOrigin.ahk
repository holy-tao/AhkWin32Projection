#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallOrigin.ahk
#Include .\IPhoneCallOrigin2.ahk
#Include .\IPhoneCallOrigin3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A collection of information about the origin of a phone call.
  * 
  * > [!NOTE]
  * > This class is deprecated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.provider.phonecallorigin
 * @namespace Windows.ApplicationModel.Calls.Provider
 * @version WindowsRuntime 1.4
 */
class PhoneCallOrigin extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallOrigin

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallOrigin.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the category for the caller.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.provider.phonecallorigin.category
     * @type {HSTRING} 
     */
    Category {
        get => this.get_Category()
        set => this.put_Category(value)
    }

    /**
     * Gets or sets the description of the caller's [Category](phonecallorigin_category.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.provider.phonecallorigin.categorydescription
     * @type {HSTRING} 
     */
    CategoryDescription {
        get => this.get_CategoryDescription()
        set => this.put_CategoryDescription(value)
    }

    /**
     * Gets or sets the location of the caller.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.provider.phonecallorigin.location
     * @type {HSTRING} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * Gets or sets the display name for the [PhoneCallOriginManager](phonecalloriginmanager.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.provider.phonecallorigin.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets the display picture for the [PhoneCallOriginManager](phonecalloriginmanager.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.provider.phonecallorigin.displaypicture
     * @type {StorageFile} 
     */
    DisplayPicture {
        get => this.get_DisplayPicture()
        set => this.put_DisplayPicture(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [PhoneCallOrigin](phonecallorigin.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.Provider.PhoneCallOrigin")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Category() {
        if (!this.HasProp("__IPhoneCallOrigin")) {
            if ((queryResult := this.QueryInterface(IPhoneCallOrigin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallOrigin := IPhoneCallOrigin(outPtr)
        }

        return this.__IPhoneCallOrigin.get_Category()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Category(value) {
        if (!this.HasProp("__IPhoneCallOrigin")) {
            if ((queryResult := this.QueryInterface(IPhoneCallOrigin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallOrigin := IPhoneCallOrigin(outPtr)
        }

        return this.__IPhoneCallOrigin.put_Category(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CategoryDescription() {
        if (!this.HasProp("__IPhoneCallOrigin")) {
            if ((queryResult := this.QueryInterface(IPhoneCallOrigin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallOrigin := IPhoneCallOrigin(outPtr)
        }

        return this.__IPhoneCallOrigin.get_CategoryDescription()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CategoryDescription(value) {
        if (!this.HasProp("__IPhoneCallOrigin")) {
            if ((queryResult := this.QueryInterface(IPhoneCallOrigin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallOrigin := IPhoneCallOrigin(outPtr)
        }

        return this.__IPhoneCallOrigin.put_CategoryDescription(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Location() {
        if (!this.HasProp("__IPhoneCallOrigin")) {
            if ((queryResult := this.QueryInterface(IPhoneCallOrigin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallOrigin := IPhoneCallOrigin(outPtr)
        }

        return this.__IPhoneCallOrigin.get_Location()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Location(value) {
        if (!this.HasProp("__IPhoneCallOrigin")) {
            if ((queryResult := this.QueryInterface(IPhoneCallOrigin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallOrigin := IPhoneCallOrigin(outPtr)
        }

        return this.__IPhoneCallOrigin.put_Location(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPhoneCallOrigin2")) {
            if ((queryResult := this.QueryInterface(IPhoneCallOrigin2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallOrigin2 := IPhoneCallOrigin2(outPtr)
        }

        return this.__IPhoneCallOrigin2.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IPhoneCallOrigin2")) {
            if ((queryResult := this.QueryInterface(IPhoneCallOrigin2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallOrigin2 := IPhoneCallOrigin2(outPtr)
        }

        return this.__IPhoneCallOrigin2.put_DisplayName(value)
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_DisplayPicture() {
        if (!this.HasProp("__IPhoneCallOrigin3")) {
            if ((queryResult := this.QueryInterface(IPhoneCallOrigin3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallOrigin3 := IPhoneCallOrigin3(outPtr)
        }

        return this.__IPhoneCallOrigin3.get_DisplayPicture()
    }

    /**
     * 
     * @param {StorageFile} value 
     * @returns {HRESULT} 
     */
    put_DisplayPicture(value) {
        if (!this.HasProp("__IPhoneCallOrigin3")) {
            if ((queryResult := this.QueryInterface(IPhoneCallOrigin3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallOrigin3 := IPhoneCallOrigin3(outPtr)
        }

        return this.__IPhoneCallOrigin3.put_DisplayPicture(value)
    }

;@endregion Instance Methods
}
