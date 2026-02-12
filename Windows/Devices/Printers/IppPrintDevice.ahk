#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIppPrintDevice.ahk
#Include .\IIppPrintDevice2.ahk
#Include .\IIppPrintDevice3.ahk
#Include .\IIppPrintDevice4.ahk
#Include .\IIppPrintDevice5.ahk
#Include .\IIppPrintDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a printer device that supports the [Internet Printing Protocol (IPP)](https://tools.ietf.org/html/rfc8011).
 * @remarks
 * For more information about this class, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppPrintDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIppPrintDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIppPrintDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves an Advanced Query Syntax (AQS) string for identifying Internet Printing Protocol (IPP) devices. You can pass that string to [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) in order to find devices.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!IppPrintDevice.HasProp("__IIppPrintDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppPrintDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppPrintDeviceStatics.IID)
            IppPrintDevice.__IIppPrintDeviceStatics := IIppPrintDeviceStatics(factoryPtr)
        }

        return IppPrintDevice.__IIppPrintDeviceStatics.GetDeviceSelector()
    }

    /**
     * Creates an [IppPrintDevice](./ippprintdevice.md) object from a printer device id.
     * @param {HSTRING} deviceId A printer device id.
     * @returns {IppPrintDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.fromid
     */
    static FromId(deviceId) {
        if (!IppPrintDevice.HasProp("__IIppPrintDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppPrintDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppPrintDeviceStatics.IID)
            IppPrintDevice.__IIppPrintDeviceStatics := IIppPrintDeviceStatics(factoryPtr)
        }

        return IppPrintDevice.__IIppPrintDeviceStatics.FromId(deviceId)
    }

    /**
     * Creates an [IppPrintDevice](./ippprintdevice.md) object from a printer name.
     * @param {HSTRING} printerName A printer name.
     * @returns {IppPrintDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.fromprintername
     */
    static FromPrinterName(printerName) {
        if (!IppPrintDevice.HasProp("__IIppPrintDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppPrintDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppPrintDeviceStatics.IID)
            IppPrintDevice.__IIppPrintDeviceStatics := IIppPrintDeviceStatics(factoryPtr)
        }

        return IppPrintDevice.__IIppPrintDeviceStatics.FromPrinterName(printerName)
    }

    /**
     * Determines whether the string argument is the name of an Internet Printing Protocol (IPP) printer.
     * @param {HSTRING} printerName A string containing a candidate printer name.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.isippprinter
     */
    static IsIppPrinter(printerName) {
        if (!IppPrintDevice.HasProp("__IIppPrintDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppPrintDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppPrintDeviceStatics.IID)
            IppPrintDevice.__IIppPrintDeviceStatics := IIppPrintDeviceStatics(factoryPtr)
        }

        return IppPrintDevice.__IIppPrintDeviceStatics.IsIppPrinter(printerName)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the name of the printer device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.printername
     * @type {HSTRING} 
     */
    PrinterName {
        get => this.get_PrinterName()
    }

    /**
     * Gets the URI of the printer device (for contacting the printer directly).
     * @remarks
     * In some cases&mdash;such as Internet Printing Protocol (IPP) over USB&mdash;the printer device URI is the default address (127.0.0.1).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.printeruri
     * @type {Uri} 
     */
    PrinterUri {
        get => this.get_PrinterUri()
    }

    /**
     * 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.isippfaxoutprinter
     * @type {Boolean} 
     */
    IsIppFaxOutPrinter {
        get => this.get_IsIppFaxOutPrinter()
    }

    /**
     * Gets a value from the [IppPrintDeviceKind](ippprintdevicekind.md) enumeration, specifying the kind of printer represented by the **IppPrintDevice**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.devicekind
     * @type {Integer} 
     */
    DeviceKind {
        get => this.get_DeviceKind()
    }

    /**
     * Gets a boolean value indicating whether the [UserDefaultPrintTicket](ippprintdevice_userdefaultprintticket.md) can be modified.
     * @remarks
     * The property will be false if the application is running in a restricted context and is not registered as a Print Support App for the current printer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.canmodifyuserdefaultprintticket
     * @type {Boolean} 
     */
    CanModifyUserDefaultPrintTicket {
        get => this.get_CanModifyUserDefaultPrintTicket()
    }

    /**
     * Gets or sets the current user default print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.userdefaultprintticket
     * @type {WorkflowPrintTicket} 
     */
    UserDefaultPrintTicket {
        get => this.get_UserDefaultPrintTicket()
        set => this.put_UserDefaultPrintTicket(value)
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
    get_PrinterName() {
        if (!this.HasProp("__IIppPrintDevice")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice := IIppPrintDevice(outPtr)
        }

        return this.__IIppPrintDevice.get_PrinterName()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_PrinterUri() {
        if (!this.HasProp("__IIppPrintDevice")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice := IIppPrintDevice(outPtr)
        }

        return this.__IIppPrintDevice.get_PrinterUri()
    }

    /**
     * Gets attributes for the current printer as specified by a buffer that contains a printer attributes group from a serialized Internet Printing Protocol (IPP) response.
     * @param {IIterable<HSTRING>} attributeNames The names of the IPP attributes to retrieve.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.getprinterattributesasbuffer
     */
    GetPrinterAttributesAsBuffer(attributeNames) {
        if (!this.HasProp("__IIppPrintDevice")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice := IIppPrintDevice(outPtr)
        }

        return this.__IIppPrintDevice.GetPrinterAttributesAsBuffer(attributeNames)
    }

    /**
     * Gets attributes for the current printer as a map of Internet Printing Protocol (IPP) attribute name and value pairs.
     * @param {IIterable<HSTRING>} attributeNames The names of the IPP attributes to retrieve.
     * @returns {IMap<HSTRING, IppAttributeValue>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.getprinterattributes
     */
    GetPrinterAttributes(attributeNames) {
        if (!this.HasProp("__IIppPrintDevice")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice := IIppPrintDevice(outPtr)
        }

        return this.__IIppPrintDevice.GetPrinterAttributes(attributeNames)
    }

    /**
     * Sets attributes for the current printer as specified by the specified buffer that contains a serialized Internet Printing Protocol (IPP) attribute group.
     * @param {IBuffer} printerAttributesBuffer A serialized Internet Printing Protocol (IPP) attribute group, as per the definition in the IPP specification.
     * @returns {IppSetAttributesResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.setprinterattributesfrombuffer
     */
    SetPrinterAttributesFromBuffer(printerAttributesBuffer) {
        if (!this.HasProp("__IIppPrintDevice")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice := IIppPrintDevice(outPtr)
        }

        return this.__IIppPrintDevice.SetPrinterAttributesFromBuffer(printerAttributesBuffer)
    }

    /**
     * Sets attributes for the current printer as specified by the specified map of Internet Printing Protocol (IPP) attribute name and value pairs.
     * @param {IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>} printerAttributes A map of Internet Printing Protocol (IPP) attribute name and value pairs.
     * @returns {IppSetAttributesResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.setprinterattributes
     */
    SetPrinterAttributes(printerAttributes) {
        if (!this.HasProp("__IIppPrintDevice")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice := IIppPrintDevice(outPtr)
        }

        return this.__IIppPrintDevice.SetPrinterAttributes(printerAttributes)
    }

    /**
     * Retrieves a value indicating the maximum supported PDF size in bytes.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.getmaxsupportedpdfsize
     */
    GetMaxSupportedPdfSize() {
        if (!this.HasProp("__IIppPrintDevice2")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice2 := IIppPrintDevice2(outPtr)
        }

        return this.__IIppPrintDevice2.GetMaxSupportedPdfSize()
    }

    /**
     * Retrieves a string indicating the maximum supported PDF version.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.getmaxsupportedpdfversion
     */
    GetMaxSupportedPdfVersion() {
        if (!this.HasProp("__IIppPrintDevice2")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice2 := IIppPrintDevice2(outPtr)
        }

        return this.__IIppPrintDevice2.GetMaxSupportedPdfVersion()
    }

    /**
     * Determines whether the Internet Printing Protocol (IPP) printer device supports page description language (PDL) pass-through for a given PDL format.
     * @remarks
     * For more info about PDL, and PDL pass-through, see Remarks in [PdlPassthroughProvider](./pdlpassthroughprovider.md).
     * 
     * If a print support application (PSA) is installed, then the PSA can disable PDL pass-through.
     * @param {HSTRING} pdlContentType A string representing a PDL format. For example, "application/pdf" or "application/postscript". If *pdlContentType* is null, then the method returns `true` if the printer supports passthrough for *any* PDL.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.ispdlpassthroughsupported
     */
    IsPdlPassthroughSupported(pdlContentType) {
        if (!this.HasProp("__IIppPrintDevice2")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice2 := IIppPrintDevice2(outPtr)
        }

        return this.__IIppPrintDevice2.IsPdlPassthroughSupported(pdlContentType)
    }

    /**
     * Retrieves a [PdlPassthroughProvider](./pdlpassthroughprovider.md) object representing the pass-through provider for the Internet Printing Protocol (IPP) printer. If pass-through isn't supported, then the method fails; call [IppPrintDevice.IsPdlPassthroughSupported](./ippprintdevice_ispdlpassthroughsupported_1510208979.md) first.
     * @returns {PdlPassthroughProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.getpdlpassthroughprovider
     */
    GetPdlPassthroughProvider() {
        if (!this.HasProp("__IIppPrintDevice2")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice2 := IIppPrintDevice2(outPtr)
        }

        return this.__IIppPrintDevice2.GetPdlPassthroughProvider()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIppFaxOutPrinter() {
        if (!this.HasProp("__IIppPrintDevice3")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice3 := IIppPrintDevice3(outPtr)
        }

        return this.__IIppPrintDevice3.get_IsIppFaxOutPrinter()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceKind() {
        if (!this.HasProp("__IIppPrintDevice4")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice4 := IIppPrintDevice4(outPtr)
        }

        return this.__IIppPrintDevice4.get_DeviceKind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanModifyUserDefaultPrintTicket() {
        if (!this.HasProp("__IIppPrintDevice4")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice4 := IIppPrintDevice4(outPtr)
        }

        return this.__IIppPrintDevice4.get_CanModifyUserDefaultPrintTicket()
    }

    /**
     * 
     * @returns {WorkflowPrintTicket} 
     */
    get_UserDefaultPrintTicket() {
        if (!this.HasProp("__IIppPrintDevice4")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice4 := IIppPrintDevice4(outPtr)
        }

        return this.__IIppPrintDevice4.get_UserDefaultPrintTicket()
    }

    /**
     * 
     * @param {WorkflowPrintTicket} value 
     * @returns {HRESULT} 
     */
    put_UserDefaultPrintTicket(value) {
        if (!this.HasProp("__IIppPrintDevice4")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice4 := IIppPrintDevice4(outPtr)
        }

        return this.__IIppPrintDevice4.put_UserDefaultPrintTicket(value)
    }

    /**
     * Forces a refresh of print device capabilities for the current printer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.refreshprintdevicecapabilities
     */
    RefreshPrintDeviceCapabilities() {
        if (!this.HasProp("__IIppPrintDevice4")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice4 := IIppPrintDevice4(outPtr)
        }

        return this.__IIppPrintDevice4.RefreshPrintDeviceCapabilities()
    }

    /**
     * Retrieves a string indicating the maximum supported PDL version for the specified PDL content type.
     * @param {HSTRING} pdlContentType 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.getmaxsupportedpdlversion
     */
    GetMaxSupportedPdlVersion(pdlContentType) {
        if (!this.HasProp("__IIppPrintDevice4")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice4 := IIppPrintDevice4(outPtr)
        }

        return this.__IIppPrintDevice4.GetMaxSupportedPdlVersion(pdlContentType)
    }

    /**
     * Gets a collection of properties associated with an Internet Printing Protocol (IPP) printer device.
     * @remarks
     * To update the properties for a printer device, call [ReplaceDeviceProperties](ippprintdevice_replacedeviceproperties_1875570505.md).
     * @returns {ValueSet} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.getdeviceproperties
     */
    GetDeviceProperties() {
        if (!this.HasProp("__IIppPrintDevice5")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice5 := IIppPrintDevice5(outPtr)
        }

        return this.__IIppPrintDevice5.GetDeviceProperties()
    }

    /**
     * Replaces the collection of properties associated with an Internet Printing Protocol (IPP) printer device.
     * @param {IIterable<IKeyValuePair<HSTRING, IInspectable>>} deviceProperties An enumerable collection of key value pairs containing the new set of properties for the printer device.
     * @returns {ReplaceDevicePropertiesResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippprintdevice.replacedeviceproperties
     */
    ReplaceDeviceProperties(deviceProperties) {
        if (!this.HasProp("__IIppPrintDevice5")) {
            if ((queryResult := this.QueryInterface(IIppPrintDevice5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDevice5 := IIppPrintDevice5(outPtr)
        }

        return this.__IIppPrintDevice5.ReplaceDeviceProperties(deviceProperties)
    }

;@endregion Instance Methods
}
