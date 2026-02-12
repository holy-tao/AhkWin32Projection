#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportCommunicationErrorDetectedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [PrintSupportExtensionSession.CommunicationErrorDetected](printsupportextensionsession_communicationerrordetected.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportcommunicationerrordetectedeventargs
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportCommunicationErrorDetectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportCommunicationErrorDetectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportCommunicationErrorDetectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A value from the [IppPrinterCommunicationKind](ippcommunicationerrorkind.md) enumeration specifying the kind of error that was encountered.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportcommunicationerrordetectedeventargs.errorkind
     * @type {Integer} 
     */
    ErrorKind {
        get => this.get_ErrorKind()
    }

    /**
     * Gets the extended error associated with the IPP printer communication.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportcommunicationerrordetectedeventargs.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets a [PrintSupportIppCommunicationConfiguration](printsupportippcommunicationconfiguration.md) object that allows the caller to configure Internet Printing Protocol (IPP) communication parameters.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportcommunicationerrordetectedeventargs.communicationconfiguration
     * @type {PrintSupportIppCommunicationConfiguration} 
     */
    CommunicationConfiguration {
        get => this.get_CommunicationConfiguration()
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
    get_ErrorKind() {
        if (!this.HasProp("__IPrintSupportCommunicationErrorDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportCommunicationErrorDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportCommunicationErrorDetectedEventArgs := IPrintSupportCommunicationErrorDetectedEventArgs(outPtr)
        }

        return this.__IPrintSupportCommunicationErrorDetectedEventArgs.get_ErrorKind()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IPrintSupportCommunicationErrorDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportCommunicationErrorDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportCommunicationErrorDetectedEventArgs := IPrintSupportCommunicationErrorDetectedEventArgs(outPtr)
        }

        return this.__IPrintSupportCommunicationErrorDetectedEventArgs.get_ExtendedError()
    }

    /**
     * 
     * @returns {PrintSupportIppCommunicationConfiguration} 
     */
    get_CommunicationConfiguration() {
        if (!this.HasProp("__IPrintSupportCommunicationErrorDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportCommunicationErrorDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportCommunicationErrorDetectedEventArgs := IPrintSupportCommunicationErrorDetectedEventArgs(outPtr)
        }

        return this.__IPrintSupportCommunicationErrorDetectedEventArgs.get_CommunicationConfiguration()
    }

    /**
     * Informs the system that the resource response task might continue to perform work after the [PrintSupportExtensionSession.CommunicationErrorDetected](printsupportextensionsession_communicationerrordetected.md) handler returns.
     * @remarks
     * The print job operation is delayed until the app calls the [Deferral.Complete](/uwp/api/windows.foundation.deferral.complete) method.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportcommunicationerrordetectedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintSupportCommunicationErrorDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportCommunicationErrorDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportCommunicationErrorDetectedEventArgs := IPrintSupportCommunicationErrorDetectedEventArgs(outPtr)
        }

        return this.__IPrintSupportCommunicationErrorDetectedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
