#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowPdlConverter.ahk
#Include .\IPrintWorkflowPdlConverter2.ahk
#Include .\IPrintWorkflowPdlConverter3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a method that can be used to convert a print document from one page description language (PDL) format to another PDL format.
 * @remarks
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlconverter
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowPdlConverter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowPdlConverter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowPdlConverter.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Converts a print document from one page description language (PDL) format to another PDL format, with the ability to specify which conversion operations should be performed by the host.
     * @param {WorkflowPrintTicket} printTicket The current XML PrintTicket document containing instructions on how the printer should set its various features for a printing task.
     * @param {IInputStream} inputStream The print document that needs to be converted from the original PDL format.
     * @param {IOutputStream} outputStream The converted print document in the translated PDL format.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlconverter.convertpdlasync
     */
    ConvertPdlAsync(printTicket, inputStream, outputStream) {
        if (!this.HasProp("__IPrintWorkflowPdlConverter")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlConverter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlConverter := IPrintWorkflowPdlConverter(outPtr)
        }

        return this.__IPrintWorkflowPdlConverter.ConvertPdlAsync(printTicket, inputStream, outputStream)
    }

    /**
     * Converts a print document from one page description language (PDL) format to another PDL format.
     * @param {WorkflowPrintTicket} printTicket The current XML PrintTicket document containing instructions on how the printer should set its various features for a printing task.
     * @param {IInputStream} inputStream The print document that needs to be converted from the original PDL format.
     * @param {IOutputStream} outputStream The converted print document in the translated PDL format.
     * @param {Integer} hostBasedProcessingOperations 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlconverter.convertpdlasync
     */
    ConvertPdlAsync1(printTicket, inputStream, outputStream, hostBasedProcessingOperations) {
        if (!this.HasProp("__IPrintWorkflowPdlConverter2")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlConverter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlConverter2 := IPrintWorkflowPdlConverter2(outPtr)
        }

        return this.__IPrintWorkflowPdlConverter2.ConvertPdlAsync(printTicket, inputStream, outputStream, hostBasedProcessingOperations)
    }

    /**
     * 
     * @param {WorkflowPrintTicket} printTicket 
     * @param {IPrintWorkflowObjectModelProvider} objectModelProvider 
     * @param {IOutputStream} outputStream 
     * @param {Integer} hostBasedProcessingOperations 
     * @returns {IAsyncAction} 
     */
    ConvertPdlFromObjectModelAsync(printTicket, objectModelProvider, outputStream, hostBasedProcessingOperations) {
        if (!this.HasProp("__IPrintWorkflowPdlConverter3")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlConverter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlConverter3 := IPrintWorkflowPdlConverter3(outPtr)
        }

        return this.__IPrintWorkflowPdlConverter3.ConvertPdlFromObjectModelAsync(printTicket, objectModelProvider, outputStream, hostBasedProcessingOperations)
    }

;@endregion Instance Methods
}
