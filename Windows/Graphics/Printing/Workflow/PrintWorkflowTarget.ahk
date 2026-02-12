#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowTarget.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the output document to be sent to the printer driver.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowtarget
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowTarget extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowTarget

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowTarget.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the output document in the form of a data stream.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowtarget.targetasstream
     * @type {PrintWorkflowStreamTarget} 
     */
    TargetAsStream {
        get => this.get_TargetAsStream()
    }

    /**
     * Gets the output document in the form of the COM-based XPS object model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowtarget.targetasxpsobjectmodelpackage
     * @type {PrintWorkflowObjectModelTargetPackage} 
     */
    TargetAsXpsObjectModelPackage {
        get => this.get_TargetAsXpsObjectModelPackage()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintWorkflowStreamTarget} 
     */
    get_TargetAsStream() {
        if (!this.HasProp("__IPrintWorkflowTarget")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowTarget := IPrintWorkflowTarget(outPtr)
        }

        return this.__IPrintWorkflowTarget.get_TargetAsStream()
    }

    /**
     * 
     * @returns {PrintWorkflowObjectModelTargetPackage} 
     */
    get_TargetAsXpsObjectModelPackage() {
        if (!this.HasProp("__IPrintWorkflowTarget")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowTarget := IPrintWorkflowTarget(outPtr)
        }

        return this.__IPrintWorkflowTarget.get_TargetAsXpsObjectModelPackage()
    }

;@endregion Instance Methods
}
