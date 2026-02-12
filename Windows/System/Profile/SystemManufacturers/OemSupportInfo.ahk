#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOemSupportInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides support information about the manufacturer of the device. This includes the OEM’s name, web site address, and other support details.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.oemsupportinfo
 * @namespace Windows.System.Profile.SystemManufacturers
 * @version WindowsRuntime 1.4
 */
class OemSupportInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOemSupportInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOemSupportInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) for the Original Equipment Manufacturer (OEM) support web site.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.oemsupportinfo.supportlink
     * @type {Uri} 
     */
    SupportLink {
        get => this.get_SupportLink()
    }

    /**
     * Gets the protocol handler link to the OEM-built support app that will be launched instead of the web URL.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.oemsupportinfo.supportapplink
     * @type {Uri} 
     */
    SupportAppLink {
        get => this.get_SupportAppLink()
    }

    /**
     * Gets the name of the support provider for the device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.oemsupportinfo.supportprovider
     * @type {HSTRING} 
     */
    SupportProvider {
        get => this.get_SupportProvider()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_SupportLink() {
        if (!this.HasProp("__IOemSupportInfo")) {
            if ((queryResult := this.QueryInterface(IOemSupportInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOemSupportInfo := IOemSupportInfo(outPtr)
        }

        return this.__IOemSupportInfo.get_SupportLink()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_SupportAppLink() {
        if (!this.HasProp("__IOemSupportInfo")) {
            if ((queryResult := this.QueryInterface(IOemSupportInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOemSupportInfo := IOemSupportInfo(outPtr)
        }

        return this.__IOemSupportInfo.get_SupportAppLink()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SupportProvider() {
        if (!this.HasProp("__IOemSupportInfo")) {
            if ((queryResult := this.QueryInterface(IOemSupportInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOemSupportInfo := IOemSupportInfo(outPtr)
        }

        return this.__IOemSupportInfo.get_SupportProvider()
    }

;@endregion Instance Methods
}
