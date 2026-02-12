#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerReport.ahk
#Include .\IBarcodeScannerReportFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the barcode scanner data.
 * @remarks
 * This object is accessed when you retrieve the [Report](barcodescannerdatareceivedeventargs_report.md) property of the [BarcodeScannerDataReceivedEventArgs](barcodescannerdatareceivedeventargs.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannerreport
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerReport.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [BarcodeScannerReport](barcodescannerreport.md).
     * @param {Integer} scanDataType The decoded barcode label type.
     * @param {IBuffer} scanData The full raw scan data.
     * @param {IBuffer} scanDataLabel The decoded barcode label.
     * @returns {BarcodeScannerReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannerreport.#ctor
     */
    static CreateInstance(scanDataType, scanData, scanDataLabel) {
        if (!BarcodeScannerReport.HasProp("__IBarcodeScannerReportFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeScannerReport")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeScannerReportFactory.IID)
            BarcodeScannerReport.__IBarcodeScannerReportFactory := IBarcodeScannerReportFactory(factoryPtr)
        }

        return BarcodeScannerReport.__IBarcodeScannerReportFactory.CreateInstance(scanDataType, scanData, scanDataLabel)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the decoded barcode label type. Possible values are defined in the [BarcodeSymbologies](barcodesymbologies.md) class.
     * @remarks
     * The return value of this property depends on the value of [IsDecodeDataEnabled](claimedbarcodescanner_isdecodedataenabled.md) property. If [IsDecodeDataEnabled](claimedbarcodescanner_isdecodedataenabled.md) is true, this property contains the barcode symbology. If [IsDecodeDataEnabled](claimedbarcodescanner_isdecodedataenabled.md) is false, this property contains the [BarcodeSymbology.Unknown](barcodesymbologies_unknown.md) value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannerreport.scandatatype
     * @type {Integer} 
     */
    ScanDataType {
        get => this.get_ScanDataType()
    }

    /**
     * Gets the full raw data from the [DataReceived](claimedbarcodescanner_datareceived.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannerreport.scandata
     * @type {IBuffer} 
     */
    ScanData {
        get => this.get_ScanData()
    }

    /**
     * Gets the decoded barcode label, which does not include the header, checksum, and other miscellaneous information.
     * @remarks
     * If [IsDecodeDataEnabled](claimedbarcodescanner_isdecodedataenabled.md) is true, then this property contains the decoded barcode label. If [IsDecodeDataEnabled](claimedbarcodescanner_isdecodedataenabled.md) is false, then this property is set to `null`.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannerreport.scandatalabel
     * @type {IBuffer} 
     */
    ScanDataLabel {
        get => this.get_ScanDataLabel()
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
    get_ScanDataType() {
        if (!this.HasProp("__IBarcodeScannerReport")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerReport := IBarcodeScannerReport(outPtr)
        }

        return this.__IBarcodeScannerReport.get_ScanDataType()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ScanData() {
        if (!this.HasProp("__IBarcodeScannerReport")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerReport := IBarcodeScannerReport(outPtr)
        }

        return this.__IBarcodeScannerReport.get_ScanData()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ScanDataLabel() {
        if (!this.HasProp("__IBarcodeScannerReport")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerReport := IBarcodeScannerReport(outPtr)
        }

        return this.__IBarcodeScannerReport.get_ScanDataLabel()
    }

;@endregion Instance Methods
}
