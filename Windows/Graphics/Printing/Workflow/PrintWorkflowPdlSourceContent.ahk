#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowPdlSourceContent.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates the source page description language (PDL) content for the current job.
 * @remarks
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlsourcecontent
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowPdlSourceContent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowPdlSourceContent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowPdlSourceContent.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the content type of the source page description language (PDL) content for the current job.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlsourcecontent.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
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
        if (!this.HasProp("__IPrintWorkflowPdlSourceContent")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlSourceContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlSourceContent := IPrintWorkflowPdlSourceContent(outPtr)
        }

        return this.__IPrintWorkflowPdlSourceContent.get_ContentType()
    }

    /**
     * Gets the input stream containing page description language (PDL) content for the current job.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlsourcecontent.getinputstream
     */
    GetInputStream() {
        if (!this.HasProp("__IPrintWorkflowPdlSourceContent")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlSourceContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlSourceContent := IPrintWorkflowPdlSourceContent(outPtr)
        }

        return this.__IPrintWorkflowPdlSourceContent.GetInputStream()
    }

    /**
     * Retrieves the complete source content for the current job.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlsourcecontent.getcontentfileasync
     */
    GetContentFileAsync() {
        if (!this.HasProp("__IPrintWorkflowPdlSourceContent")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlSourceContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlSourceContent := IPrintWorkflowPdlSourceContent(outPtr)
        }

        return this.__IPrintWorkflowPdlSourceContent.GetContentFileAsync()
    }

;@endregion Instance Methods
}
