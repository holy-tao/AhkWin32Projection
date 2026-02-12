#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowSpoolStreamContent.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents print data in the form of an XPS data stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowspoolstreamcontent
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowSpoolStreamContent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowSpoolStreamContent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowSpoolStreamContent.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns this print data as an input stream.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowspoolstreamcontent.getinputstream
     */
    GetInputStream() {
        if (!this.HasProp("__IPrintWorkflowSpoolStreamContent")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowSpoolStreamContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowSpoolStreamContent := IPrintWorkflowSpoolStreamContent(outPtr)
        }

        return this.__IPrintWorkflowSpoolStreamContent.GetInputStream()
    }

;@endregion Instance Methods
}
