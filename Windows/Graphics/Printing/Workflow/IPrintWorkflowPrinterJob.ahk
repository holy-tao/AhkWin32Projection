#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Devices\Printers\IppPrintDevice.ahk
#Include ..\PrintTicket\WorkflowPrintTicket.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Devices\Printers\IppAttributeValue.ahk
#Include ..\..\..\Devices\Printers\IppSetAttributesResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowPrinterJob extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowPrinterJob
     * @type {Guid}
     */
    static IID => Guid("{12009f94-0d14-5443-bc09-250311ce570b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_JobId", "get_Printer", "GetJobStatus", "GetJobPrintTicket", "GetJobAttributesAsBuffer", "GetJobAttributes", "SetJobAttributesFromBuffer", "SetJobAttributes"]

    /**
     * @type {Integer} 
     */
    JobId {
        get => this.get_JobId()
    }

    /**
     * @type {IppPrintDevice} 
     */
    Printer {
        get => this.get_Printer()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_JobId() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
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
     * @returns {Integer} 
     */
    GetJobStatus() {
        result := ComCall(8, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
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
     * @param {IIterable<HSTRING>} attributeNames 
     * @returns {IBuffer} 
     */
    GetJobAttributesAsBuffer(attributeNames) {
        result := ComCall(10, this, "ptr", attributeNames, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} attributeNames 
     * @returns {IMap<HSTRING, IppAttributeValue>} 
     */
    GetJobAttributes(attributeNames) {
        result := ComCall(11, this, "ptr", attributeNames, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), IppAttributeValue, result_)
    }

    /**
     * 
     * @param {IBuffer} jobAttributesBuffer 
     * @returns {IppSetAttributesResult} 
     */
    SetJobAttributesFromBuffer(jobAttributesBuffer) {
        result := ComCall(12, this, "ptr", jobAttributesBuffer, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppSetAttributesResult(result_)
    }

    /**
     * 
     * @param {IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>} jobAttributes 
     * @returns {IppSetAttributesResult} 
     */
    SetJobAttributes(jobAttributes) {
        result := ComCall(13, this, "ptr", jobAttributes, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppSetAttributesResult(result_)
    }
}
