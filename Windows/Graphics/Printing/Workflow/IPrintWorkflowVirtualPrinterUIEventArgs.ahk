#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PrintWorkflowConfiguration.ahk
#Include ..\..\..\Devices\Printers\IppPrintDevice.ahk
#Include .\PrintWorkflowPdlSourceContent.ahk
#Include ..\PrintTicket\WorkflowPrintTicket.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowVirtualPrinterUIEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowVirtualPrinterUIEventArgs
     * @type {Guid}
     */
    static IID => Guid("{334dbbca-bf10-585f-b7e0-58c4aa43a03f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Configuration", "get_Printer", "get_SourceContent", "GetJobPrintTicket", "GetDeferral"]

    /**
     * @type {PrintWorkflowConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * @type {IppPrintDevice} 
     */
    Printer {
        get => this.get_Printer()
    }

    /**
     * @type {PrintWorkflowPdlSourceContent} 
     */
    SourceContent {
        get => this.get_SourceContent()
    }

    /**
     * 
     * @returns {PrintWorkflowConfiguration} 
     */
    get_Configuration() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowConfiguration(value)
    }

    /**
     * 
     * @returns {IppPrintDevice} 
     */
    get_Printer() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppPrintDevice(value)
    }

    /**
     * 
     * @returns {PrintWorkflowPdlSourceContent} 
     */
    get_SourceContent() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowPdlSourceContent(value)
    }

    /**
     * 
     * @returns {WorkflowPrintTicket} 
     */
    GetJobPrintTicket() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WorkflowPrintTicket(result_)
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}
