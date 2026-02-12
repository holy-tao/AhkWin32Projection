#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerCapabilities.ahk
#Include .\IBarcodeScannerCapabilities1.ahk
#Include .\IBarcodeScannerCapabilities2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the barcode scanner capabilities.
 * @remarks
 * This object is accessed when you retrieve the [Capabilities](barcodescanner_capabilities.md) property of the [BarcodeScanner](barcodescanner.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannercapabilities
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the power reporting type for the barcode scanner.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannercapabilities.powerreportingtype
     * @type {Integer} 
     */
    PowerReportingType {
        get => this.get_PowerReportingType()
    }

    /**
     * Indicates whether the barcode scanner supports reporting of usage statistics.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannercapabilities.isstatisticsreportingsupported
     * @type {Boolean} 
     */
    IsStatisticsReportingSupported {
        get => this.get_IsStatisticsReportingSupported()
    }

    /**
     * Indicates whether the barcode scanner supports updating or resetting of usage statistics.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannercapabilities.isstatisticsupdatingsupported
     * @type {Boolean} 
     */
    IsStatisticsUpdatingSupported {
        get => this.get_IsStatisticsUpdatingSupported()
    }

    /**
     * Indicates whether the barcode scanner supports image preview.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannercapabilities.isimagepreviewsupported
     * @type {Boolean} 
     */
    IsImagePreviewSupported {
        get => this.get_IsImagePreviewSupported()
    }

    /**
     * Indicates whether the barcode scanner supports the software trigger functionality.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannercapabilities.issoftwaretriggersupported
     * @type {Boolean} 
     */
    IsSoftwareTriggerSupported {
        get => this.get_IsSoftwareTriggerSupported()
    }

    /**
     * Indicates whether the barcode scanner supports displaying a live video preview from an attached camera.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannercapabilities.isvideopreviewsupported
     * @type {Boolean} 
     */
    IsVideoPreviewSupported {
        get => this.get_IsVideoPreviewSupported()
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
    get_PowerReportingType() {
        if (!this.HasProp("__IBarcodeScannerCapabilities")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerCapabilities := IBarcodeScannerCapabilities(outPtr)
        }

        return this.__IBarcodeScannerCapabilities.get_PowerReportingType()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsReportingSupported() {
        if (!this.HasProp("__IBarcodeScannerCapabilities")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerCapabilities := IBarcodeScannerCapabilities(outPtr)
        }

        return this.__IBarcodeScannerCapabilities.get_IsStatisticsReportingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsUpdatingSupported() {
        if (!this.HasProp("__IBarcodeScannerCapabilities")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerCapabilities := IBarcodeScannerCapabilities(outPtr)
        }

        return this.__IBarcodeScannerCapabilities.get_IsStatisticsUpdatingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsImagePreviewSupported() {
        if (!this.HasProp("__IBarcodeScannerCapabilities")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerCapabilities := IBarcodeScannerCapabilities(outPtr)
        }

        return this.__IBarcodeScannerCapabilities.get_IsImagePreviewSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSoftwareTriggerSupported() {
        if (!this.HasProp("__IBarcodeScannerCapabilities1")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerCapabilities1.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerCapabilities1 := IBarcodeScannerCapabilities1(outPtr)
        }

        return this.__IBarcodeScannerCapabilities1.get_IsSoftwareTriggerSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVideoPreviewSupported() {
        if (!this.HasProp("__IBarcodeScannerCapabilities2")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerCapabilities2 := IBarcodeScannerCapabilities2(outPtr)
        }

        return this.__IBarcodeScannerCapabilities2.get_IsVideoPreviewSupported()
    }

;@endregion Instance Methods
}
