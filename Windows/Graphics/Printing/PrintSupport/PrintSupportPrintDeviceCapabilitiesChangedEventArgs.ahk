#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportPrintDeviceCapabilitiesChangedEventArgs.ahk
#Include .\IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2.ahk
#Include .\IPrintSupportPrintDeviceCapabilitiesChangedEventArgs3.ahk
#Include .\IPrintSupportPrintDeviceCapabilitiesChangedEventArgs4.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides info for the [PrintDeviceCapabilitiesChanged](printsupportextensionsession_printdevicecapabilitieschanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprintdevicecapabilitieschangedeventargs
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportPrintDeviceCapabilitiesChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportPrintDeviceCapabilitiesChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportPrintDeviceCapabilitiesChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    ResourceLanguage {
        get => this.get_ResourceLanguage()
    }

    /**
     * @type {PrintSupportIppCommunicationConfiguration} 
     */
    CommunicationConfiguration {
        get => this.get_CommunicationConfiguration()
    }

    /**
     * @type {PrintSupportMxdcImageQualityConfiguration} 
     */
    MxdcImageQualityConfiguration {
        get => this.get_MxdcImageQualityConfiguration()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns the print capabilities of the associated Internet Printing Protocol (IPP) printer.
     * @returns {XmlDocument} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprintdevicecapabilitieschangedeventargs.getcurrentprintdevicecapabilities
     */
    GetCurrentPrintDeviceCapabilities() {
        if (!this.HasProp("__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintDeviceCapabilitiesChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs := IPrintSupportPrintDeviceCapabilitiesChangedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs.GetCurrentPrintDeviceCapabilities()
    }

    /**
     * Updates the print capabilities of the associated Internet Printing Protocol (IPP) printer.
     * @remarks
     * The updated print capabilities are subject to the customization restrictions listed in the [Standard Options](/windows-hardware/drivers/print/standard-options) article in the printer driver documentation.
     * @param {XmlDocument} updatedPdc The print capabilities to be updated.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprintdevicecapabilitieschangedeventargs.updateprintdevicecapabilities
     */
    UpdatePrintDeviceCapabilities(updatedPdc) {
        if (!this.HasProp("__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintDeviceCapabilitiesChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs := IPrintSupportPrintDeviceCapabilitiesChangedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs.UpdatePrintDeviceCapabilities(updatedPdc)
    }

    /**
     * Requests that the print capability change operation be delayed and gets a deferral object that will be invoked upon completion of the deferred action.
     * @remarks
     * The print capability change operation is delayed until the app calls the [Deferral.Complete](/uwp/api/windows.foundation.deferral.complete) method.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprintdevicecapabilitieschangedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintDeviceCapabilitiesChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs := IPrintSupportPrintDeviceCapabilitiesChangedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs.GetDeferral()
    }

    /**
     * 
     * @param {IIterable<HSTRING>} supportedPdlContentTypes 
     * @returns {HRESULT} 
     */
    SetSupportedPdlPassthroughContentTypes(supportedPdlContentTypes) {
        if (!this.HasProp("__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2 := IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2(outPtr)
        }

        return this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2.SetSupportedPdlPassthroughContentTypes(supportedPdlContentTypes)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResourceLanguage() {
        if (!this.HasProp("__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2 := IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2(outPtr)
        }

        return this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2.get_ResourceLanguage()
    }

    /**
     * 
     * @returns {XmlDocument} 
     */
    GetCurrentPrintDeviceResources() {
        if (!this.HasProp("__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2 := IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2(outPtr)
        }

        return this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2.GetCurrentPrintDeviceResources()
    }

    /**
     * 
     * @param {XmlDocument} updatedPdr 
     * @returns {HRESULT} 
     */
    UpdatePrintDeviceResources(updatedPdr) {
        if (!this.HasProp("__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2 := IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2(outPtr)
        }

        return this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2.UpdatePrintDeviceResources(updatedPdr)
    }

    /**
     * 
     * @param {PrintSupportPrintDeviceCapabilitiesUpdatePolicy} updatePolicy 
     * @returns {HRESULT} 
     */
    SetPrintDeviceCapabilitiesUpdatePolicy(updatePolicy) {
        if (!this.HasProp("__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2 := IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2(outPtr)
        }

        return this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2.SetPrintDeviceCapabilitiesUpdatePolicy(updatePolicy)
    }

    /**
     * 
     * @returns {PrintSupportIppCommunicationConfiguration} 
     */
    get_CommunicationConfiguration() {
        if (!this.HasProp("__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs3")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintDeviceCapabilitiesChangedEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs3 := IPrintSupportPrintDeviceCapabilitiesChangedEventArgs3(outPtr)
        }

        return this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs3.get_CommunicationConfiguration()
    }

    /**
     * 
     * @returns {PrintSupportMxdcImageQualityConfiguration} 
     */
    get_MxdcImageQualityConfiguration() {
        if (!this.HasProp("__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs4")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintDeviceCapabilitiesChangedEventArgs4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs4 := IPrintSupportPrintDeviceCapabilitiesChangedEventArgs4(outPtr)
        }

        return this.__IPrintSupportPrintDeviceCapabilitiesChangedEventArgs4.get_MxdcImageQualityConfiguration()
    }

;@endregion Instance Methods
}
