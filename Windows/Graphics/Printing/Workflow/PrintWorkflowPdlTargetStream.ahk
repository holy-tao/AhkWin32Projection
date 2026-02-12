#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowPdlTargetStream.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the target page description language (PDL) stream for the current print job operation.
 * @remarks
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdltargetstream
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowPdlTargetStream extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowPdlTargetStream

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowPdlTargetStream.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the page description language (PDL) output stream for the current print job operation. Bytes written to the output stream will be given to the printer without any changes
     * @returns {IOutputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdltargetstream.getoutputstream
     */
    GetOutputStream() {
        if (!this.HasProp("__IPrintWorkflowPdlTargetStream")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlTargetStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlTargetStream := IPrintWorkflowPdlTargetStream(outPtr)
        }

        return this.__IPrintWorkflowPdlTargetStream.GetOutputStream()
    }

    /**
     * Completes the target page description language (PDL) stream submission with the specified status.
     * @param {Integer} status_ The status of the submission.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdltargetstream.completestreamsubmission
     */
    CompleteStreamSubmission(status_) {
        if (!this.HasProp("__IPrintWorkflowPdlTargetStream")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlTargetStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlTargetStream := IPrintWorkflowPdlTargetStream(outPtr)
        }

        return this.__IPrintWorkflowPdlTargetStream.CompleteStreamSubmission(status_)
    }

;@endregion Instance Methods
}
