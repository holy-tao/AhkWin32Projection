#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppUriHandlerHost.ahk
#Include .\IAppUriHandlerHost2.ahk
#Include .\IAppUriHandlerHostFactory.ahk
#Include ..\..\Guid.ahk

/**
 * An object representation of the Host field in an AppUriHandler registration. These are used in conjunction with [AppUriHandlerRegistration](appurihandlerregistration.md).
 * @remarks
 * This corresponds to the Host field in an AppUriHandler registration:
 * 
 * <uap3:AppUriHandler uap7:Name ="Runtime">
 *     <uap3:Host Name="www.appurihandler.com" />
 * </uap3:AppUriHandler>
 * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerhost
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppUriHandlerHost extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppUriHandlerHost

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppUriHandlerHost.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Constructor for AppUriHandlerHost which sets the name as well.
     * @param {HSTRING} name A website hostname.
     * @returns {AppUriHandlerHost} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerhost.#ctor
     */
    static CreateInstance(name) {
        if (!AppUriHandlerHost.HasProp("__IAppUriHandlerHostFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.AppUriHandlerHost")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppUriHandlerHostFactory.IID)
            AppUriHandlerHost.__IAppUriHandlerHostFactory := IAppUriHandlerHostFactory(factoryPtr)
        }

        return AppUriHandlerHost.__IAppUriHandlerHostFactory.CreateInstance(name)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * A website hostname.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerhost.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets a value specifying if the host is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerhost.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Default constructor for AppUriHandlerHost.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.System.AppUriHandlerHost")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IAppUriHandlerHost")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerHost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerHost := IAppUriHandlerHost(outPtr)
        }

        return this.__IAppUriHandlerHost.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IAppUriHandlerHost")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerHost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerHost := IAppUriHandlerHost(outPtr)
        }

        return this.__IAppUriHandlerHost.put_Name(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IAppUriHandlerHost2")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerHost2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerHost2 := IAppUriHandlerHost2(outPtr)
        }

        return this.__IAppUriHandlerHost2.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IAppUriHandlerHost2")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerHost2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerHost2 := IAppUriHandlerHost2(outPtr)
        }

        return this.__IAppUriHandlerHost2.put_IsEnabled(value)
    }

;@endregion Instance Methods
}
