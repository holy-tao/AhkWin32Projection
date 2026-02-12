#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSchema.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides APIs to access a 3D printer's capabilities and print tickets.
 * @remarks
 * For more information about the XML documents returned by the methods of this class, see the [Print Schema Specification](/previous-versions/gg463385(v=msdn.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.printschema
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class PrintSchema extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSchema

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSchema.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the 3D printer's default print ticket.
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.printschema.getdefaultprintticketasync
     */
    GetDefaultPrintTicketAsync() {
        if (!this.HasProp("__IPrintSchema")) {
            if ((queryResult := this.QueryInterface(IPrintSchema.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSchema := IPrintSchema(outPtr)
        }

        return this.__IPrintSchema.GetDefaultPrintTicketAsync()
    }

    /**
     * Gets the 3D printer capabilities.
     * @param {IRandomAccessStreamWithContentType} constrainTicket The print ticket.
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.printschema.getcapabilitiesasync
     */
    GetCapabilitiesAsync(constrainTicket) {
        if (!this.HasProp("__IPrintSchema")) {
            if ((queryResult := this.QueryInterface(IPrintSchema.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSchema := IPrintSchema(outPtr)
        }

        return this.__IPrintSchema.GetCapabilitiesAsync(constrainTicket)
    }

    /**
     * Creates a new print ticket by merging the user’s selection with the default print ticket and validating that it will work for the device.
     * @remarks
     * This method attempts to merge the user's selections with a default print ticket - even one for a different 3D printer. The returned print ticket is "suggested" because it may fail upon submission to the 3D printer. If that ticket fails, it indicates that the print ticket is invalid for the printer. If that ticket succeeds, it can be reused by the 3D designer in subsequent submissions.
     * @param {IRandomAccessStreamWithContentType} deltaTicket The delta print ticket, specifies the differences between the default print ticket and the user's selections.
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.printschema.mergeandvalidatewithdefaultprintticketasync
     */
    MergeAndValidateWithDefaultPrintTicketAsync(deltaTicket) {
        if (!this.HasProp("__IPrintSchema")) {
            if ((queryResult := this.QueryInterface(IPrintSchema.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSchema := IPrintSchema(outPtr)
        }

        return this.__IPrintSchema.MergeAndValidateWithDefaultPrintTicketAsync(deltaTicket)
    }

;@endregion Instance Methods
}
