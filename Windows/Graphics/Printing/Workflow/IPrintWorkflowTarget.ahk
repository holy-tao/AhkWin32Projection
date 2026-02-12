#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PrintWorkflowStreamTarget.ahk
#Include .\PrintWorkflowObjectModelTargetPackage.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowTarget extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowTarget
     * @type {Guid}
     */
    static IID => Guid("{29da276c-0a73-5aed-4f3d-970d3251f057}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetAsStream", "get_TargetAsXpsObjectModelPackage"]

    /**
     * @type {PrintWorkflowStreamTarget} 
     */
    TargetAsStream {
        get => this.get_TargetAsStream()
    }

    /**
     * @type {PrintWorkflowObjectModelTargetPackage} 
     */
    TargetAsXpsObjectModelPackage {
        get => this.get_TargetAsXpsObjectModelPackage()
    }

    /**
     * 
     * @returns {PrintWorkflowStreamTarget} 
     */
    get_TargetAsStream() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowStreamTarget(value)
    }

    /**
     * 
     * @returns {PrintWorkflowObjectModelTargetPackage} 
     */
    get_TargetAsXpsObjectModelPackage() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowObjectModelTargetPackage(value)
    }
}
