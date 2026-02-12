#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PrintWorkflowConfiguration.ahk
#Include .\PrintWorkflowPdlSourceContent.ahk
#Include .\PrintWorkflowUILauncher.ahk
#Include ..\PrintTicket\WorkflowPrintTicket.ahk
#Include .\PrintWorkflowPdlConverter.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Storage\StorageFile.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowVirtualPrinterDataAvailableEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowVirtualPrinterDataAvailableEventArgs
     * @type {Guid}
     */
    static IID => Guid("{6b7d5003-14a8-5d52-a428-07330fbab11f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Configuration", "get_SourceContent", "get_UILauncher", "GetJobPrintTicket", "GetPdlConverter", "GetTargetFileAsync", "CompleteJob"]

    /**
     * @type {PrintWorkflowConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * @type {PrintWorkflowPdlSourceContent} 
     */
    SourceContent {
        get => this.get_SourceContent()
    }

    /**
     * @type {PrintWorkflowUILauncher} 
     */
    UILauncher {
        get => this.get_UILauncher()
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
     * @returns {PrintWorkflowPdlSourceContent} 
     */
    get_SourceContent() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowPdlSourceContent(value)
    }

    /**
     * 
     * @returns {PrintWorkflowUILauncher} 
     */
    get_UILauncher() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowUILauncher(value)
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
     * @param {Integer} conversionType 
     * @returns {PrintWorkflowPdlConverter} 
     */
    GetPdlConverter(conversionType) {
        result := ComCall(10, this, "int", conversionType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowPdlConverter(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    GetTargetFileAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @param {Integer} status_ 
     * @returns {HRESULT} 
     */
    CompleteJob(status_) {
        result := ComCall(12, this, "int", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
