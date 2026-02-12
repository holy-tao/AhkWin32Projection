#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowObjectModelSourceFileContent.ahk
#Include .\IPrintWorkflowObjectModelSourceFileContentFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents print content in the form of the COM-based XPS object model.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowobjectmodelsourcefilecontent
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowObjectModelSourceFileContent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowObjectModelSourceFileContent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowObjectModelSourceFileContent.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the **PrintWorkflowObjectModelSourceFileContent** class using the specified input stream object.
     * @param {IInputStream} xpsStream The input stream.
     * @returns {PrintWorkflowObjectModelSourceFileContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowobjectmodelsourcefilecontent.#ctor
     */
    static CreateInstance(xpsStream) {
        if (!PrintWorkflowObjectModelSourceFileContent.HasProp("__IPrintWorkflowObjectModelSourceFileContentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.Workflow.PrintWorkflowObjectModelSourceFileContent")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintWorkflowObjectModelSourceFileContentFactory.IID)
            PrintWorkflowObjectModelSourceFileContent.__IPrintWorkflowObjectModelSourceFileContentFactory := IPrintWorkflowObjectModelSourceFileContentFactory(factoryPtr)
        }

        return PrintWorkflowObjectModelSourceFileContent.__IPrintWorkflowObjectModelSourceFileContentFactory.CreateInstance(xpsStream)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
