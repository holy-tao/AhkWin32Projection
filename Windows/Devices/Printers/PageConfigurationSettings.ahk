#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPageConfigurationSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies page configuration sources. By default, all property values are set to [PageConfigurationSource.PrintJobConfiguration](./pageconfigurationsource.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.pageconfigurationsettings
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class PageConfigurationSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPageConfigurationSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPageConfigurationSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.pageconfigurationsettings.orientationsource
     * @type {Integer} 
     */
    OrientationSource {
        get => this.get_OrientationSource()
        set => this.put_OrientationSource(value)
    }

    /**
     * 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.pageconfigurationsettings.sizesource
     * @type {Integer} 
     */
    SizeSource {
        get => this.get_SizeSource()
        set => this.put_SizeSource(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * 
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.PageConfigurationSettings")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OrientationSource() {
        if (!this.HasProp("__IPageConfigurationSettings")) {
            if ((queryResult := this.QueryInterface(IPageConfigurationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPageConfigurationSettings := IPageConfigurationSettings(outPtr)
        }

        return this.__IPageConfigurationSettings.get_OrientationSource()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OrientationSource(value) {
        if (!this.HasProp("__IPageConfigurationSettings")) {
            if ((queryResult := this.QueryInterface(IPageConfigurationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPageConfigurationSettings := IPageConfigurationSettings(outPtr)
        }

        return this.__IPageConfigurationSettings.put_OrientationSource(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SizeSource() {
        if (!this.HasProp("__IPageConfigurationSettings")) {
            if ((queryResult := this.QueryInterface(IPageConfigurationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPageConfigurationSettings := IPageConfigurationSettings(outPtr)
        }

        return this.__IPageConfigurationSettings.get_SizeSource()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SizeSource(value) {
        if (!this.HasProp("__IPageConfigurationSettings")) {
            if ((queryResult := this.QueryInterface(IPageConfigurationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPageConfigurationSettings := IPageConfigurationSettings(outPtr)
        }

        return this.__IPageConfigurationSettings.put_SizeSource(value)
    }

;@endregion Instance Methods
}
