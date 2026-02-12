#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowStreamTarget.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an output data stream to be sent to the printer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowstreamtarget
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowStreamTarget extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowStreamTarget

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowStreamTarget.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns the print data as an output stream.
     * @returns {IOutputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowstreamtarget.getoutputstream
     */
    GetOutputStream() {
        if (!this.HasProp("__IPrintWorkflowStreamTarget")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowStreamTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowStreamTarget := IPrintWorkflowStreamTarget(outPtr)
        }

        return this.__IPrintWorkflowStreamTarget.GetOutputStream()
    }

;@endregion Instance Methods
}
