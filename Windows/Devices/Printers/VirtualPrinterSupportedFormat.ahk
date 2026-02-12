#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVirtualPrinterSupportedFormat.ahk
#Include .\IVirtualPrinterSupportedFormatFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class VirtualPrinterSupportedFormat extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVirtualPrinterSupportedFormat

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVirtualPrinterSupportedFormat.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} contentType 
     * @param {HSTRING} maxSupportedVersion 
     * @returns {VirtualPrinterSupportedFormat} 
     */
    static CreateInstance(contentType, maxSupportedVersion) {
        if (!VirtualPrinterSupportedFormat.HasProp("__IVirtualPrinterSupportedFormatFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.VirtualPrinterSupportedFormat")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualPrinterSupportedFormatFactory.IID)
            VirtualPrinterSupportedFormat.__IVirtualPrinterSupportedFormatFactory := IVirtualPrinterSupportedFormatFactory(factoryPtr)
        }

        return VirtualPrinterSupportedFormat.__IVirtualPrinterSupportedFormatFactory.CreateInstance(contentType, maxSupportedVersion)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
        set => this.put_ContentType(value)
    }

    /**
     * @type {HSTRING} 
     */
    MaxSupportedVersion {
        get => this.get_MaxSupportedVersion()
        set => this.put_MaxSupportedVersion(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        if (!this.HasProp("__IVirtualPrinterSupportedFormat")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterSupportedFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterSupportedFormat := IVirtualPrinterSupportedFormat(outPtr)
        }

        return this.__IVirtualPrinterSupportedFormat.get_ContentType()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentType(value) {
        if (!this.HasProp("__IVirtualPrinterSupportedFormat")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterSupportedFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterSupportedFormat := IVirtualPrinterSupportedFormat(outPtr)
        }

        return this.__IVirtualPrinterSupportedFormat.put_ContentType(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MaxSupportedVersion() {
        if (!this.HasProp("__IVirtualPrinterSupportedFormat")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterSupportedFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterSupportedFormat := IVirtualPrinterSupportedFormat(outPtr)
        }

        return this.__IVirtualPrinterSupportedFormat.get_MaxSupportedVersion()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MaxSupportedVersion(value) {
        if (!this.HasProp("__IVirtualPrinterSupportedFormat")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterSupportedFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterSupportedFormat := IVirtualPrinterSupportedFormat(outPtr)
        }

        return this.__IVirtualPrinterSupportedFormat.put_MaxSupportedVersion(value)
    }

;@endregion Instance Methods
}
