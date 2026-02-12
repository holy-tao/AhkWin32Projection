#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PrintWorkflowPdlTargetStream.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowPdlModificationRequestedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowPdlModificationRequestedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{8d692147-6c62-5e31-a0e7-d49f92c111c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateJobOnPrinterWithAttributes", "CreateJobOnPrinterWithAttributesBuffer"]

    /**
     * 
     * @param {IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>} jobAttributes 
     * @param {HSTRING} targetContentType 
     * @param {IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>} operationAttributes 
     * @param {Integer} jobAttributesMergePolicy 
     * @param {Integer} operationAttributesMergePolicy 
     * @returns {PrintWorkflowPdlTargetStream} 
     */
    CreateJobOnPrinterWithAttributes(jobAttributes, targetContentType, operationAttributes, jobAttributesMergePolicy, operationAttributesMergePolicy) {
        if(targetContentType is String) {
            pin := HSTRING.Create(targetContentType)
            targetContentType := pin.Value
        }
        targetContentType := targetContentType is Win32Handle ? NumGet(targetContentType, "ptr") : targetContentType

        result := ComCall(6, this, "ptr", jobAttributes, "ptr", targetContentType, "ptr", operationAttributes, "int", jobAttributesMergePolicy, "int", operationAttributesMergePolicy, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowPdlTargetStream(result_)
    }

    /**
     * 
     * @param {IBuffer} jobAttributesBuffer 
     * @param {HSTRING} targetContentType 
     * @param {IBuffer} operationAttributesBuffer 
     * @param {Integer} jobAttributesMergePolicy 
     * @param {Integer} operationAttributesMergePolicy 
     * @returns {PrintWorkflowPdlTargetStream} 
     */
    CreateJobOnPrinterWithAttributesBuffer(jobAttributesBuffer, targetContentType, operationAttributesBuffer, jobAttributesMergePolicy, operationAttributesMergePolicy) {
        if(targetContentType is String) {
            pin := HSTRING.Create(targetContentType)
            targetContentType := pin.Value
        }
        targetContentType := targetContentType is Win32Handle ? NumGet(targetContentType, "ptr") : targetContentType

        result := ComCall(7, this, "ptr", jobAttributesBuffer, "ptr", targetContentType, "ptr", operationAttributesBuffer, "int", jobAttributesMergePolicy, "int", operationAttributesMergePolicy, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowPdlTargetStream(result_)
    }
}
