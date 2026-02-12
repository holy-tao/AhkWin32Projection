#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PrintWorkflowConfiguration.ahk
#Include .\PrintWorkflowPrinterJob.ahk
#Include .\PrintWorkflowPdlSourceContent.ahk
#Include .\PrintWorkflowUILauncher.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PrintWorkflowPdlTargetStream.ahk
#Include .\PrintWorkflowPdlConverter.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowPdlModificationRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowPdlModificationRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{1a339a61-2e13-5edd-a707-ceec61d7333b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Configuration", "get_PrinterJob", "get_SourceContent", "get_UILauncher", "CreateJobOnPrinter", "CreateJobOnPrinterWithAttributes", "CreateJobOnPrinterWithAttributesBuffer", "GetPdlConverter", "GetDeferral"]

    /**
     * @type {PrintWorkflowConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * @type {PrintWorkflowPrinterJob} 
     */
    PrinterJob {
        get => this.get_PrinterJob()
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
     * @returns {PrintWorkflowPrinterJob} 
     */
    get_PrinterJob() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowPrinterJob(value)
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
     * @returns {PrintWorkflowUILauncher} 
     */
    get_UILauncher() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowUILauncher(value)
    }

    /**
     * 
     * @param {HSTRING} targetContentType 
     * @returns {PrintWorkflowPdlTargetStream} 
     */
    CreateJobOnPrinter(targetContentType) {
        if(targetContentType is String) {
            pin := HSTRING.Create(targetContentType)
            targetContentType := pin.Value
        }
        targetContentType := targetContentType is Win32Handle ? NumGet(targetContentType, "ptr") : targetContentType

        result := ComCall(10, this, "ptr", targetContentType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowPdlTargetStream(result_)
    }

    /**
     * 
     * @param {IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>} jobAttributes 
     * @param {HSTRING} targetContentType 
     * @returns {PrintWorkflowPdlTargetStream} 
     */
    CreateJobOnPrinterWithAttributes(jobAttributes, targetContentType) {
        if(targetContentType is String) {
            pin := HSTRING.Create(targetContentType)
            targetContentType := pin.Value
        }
        targetContentType := targetContentType is Win32Handle ? NumGet(targetContentType, "ptr") : targetContentType

        result := ComCall(11, this, "ptr", jobAttributes, "ptr", targetContentType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowPdlTargetStream(result_)
    }

    /**
     * 
     * @param {IBuffer} jobAttributesBuffer 
     * @param {HSTRING} targetContentType 
     * @returns {PrintWorkflowPdlTargetStream} 
     */
    CreateJobOnPrinterWithAttributesBuffer(jobAttributesBuffer, targetContentType) {
        if(targetContentType is String) {
            pin := HSTRING.Create(targetContentType)
            targetContentType := pin.Value
        }
        targetContentType := targetContentType is Win32Handle ? NumGet(targetContentType, "ptr") : targetContentType

        result := ComCall(12, this, "ptr", jobAttributesBuffer, "ptr", targetContentType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowPdlTargetStream(result_)
    }

    /**
     * 
     * @param {Integer} conversionType 
     * @returns {PrintWorkflowPdlConverter} 
     */
    GetPdlConverter(conversionType) {
        result := ComCall(13, this, "int", conversionType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowPdlConverter(result_)
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(14, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}
