#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Data\Xml\Dom\IXmlNode.ahk
#Include .\PrintTicketCapabilities.ahk
#Include .\PrintTicketFeature.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\WorkflowPrintTicketValidationResult.ahk
#Include .\PrintTicketParameterInitializer.ahk
#Include .\WorkflowPrintTicket.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class IWorkflowPrintTicket extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkflowPrintTicket
     * @type {Guid}
     */
    static IID => Guid("{41d52285-35e8-448e-a8c5-e4b6a2cf826c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_XmlNamespace", "get_XmlNode", "GetCapabilities", "get_DocumentBindingFeature", "get_DocumentCollateFeature", "get_DocumentDuplexFeature", "get_DocumentHolePunchFeature", "get_DocumentInputBinFeature", "get_DocumentNUpFeature", "get_DocumentStapleFeature", "get_JobPasscodeFeature", "get_PageBorderlessFeature", "get_PageMediaSizeFeature", "get_PageMediaTypeFeature", "get_PageOrientationFeature", "get_PageOutputColorFeature", "get_PageOutputQualityFeature", "get_PageResolutionFeature", "GetFeature", "NotifyXmlChangedAsync", "ValidateAsync", "GetParameterInitializer", "SetParameterInitializerAsInteger", "SetParameterInitializerAsString", "MergeAndValidateTicket"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {HSTRING} 
     */
    XmlNamespace {
        get => this.get_XmlNamespace()
    }

    /**
     * @type {IXmlNode} 
     */
    XmlNode {
        get => this.get_XmlNode()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    DocumentBindingFeature {
        get => this.get_DocumentBindingFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    DocumentCollateFeature {
        get => this.get_DocumentCollateFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    DocumentDuplexFeature {
        get => this.get_DocumentDuplexFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    DocumentHolePunchFeature {
        get => this.get_DocumentHolePunchFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    DocumentInputBinFeature {
        get => this.get_DocumentInputBinFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    DocumentNUpFeature {
        get => this.get_DocumentNUpFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    DocumentStapleFeature {
        get => this.get_DocumentStapleFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    JobPasscodeFeature {
        get => this.get_JobPasscodeFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    PageBorderlessFeature {
        get => this.get_PageBorderlessFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    PageMediaSizeFeature {
        get => this.get_PageMediaSizeFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    PageMediaTypeFeature {
        get => this.get_PageMediaTypeFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    PageOrientationFeature {
        get => this.get_PageOrientationFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    PageOutputColorFeature {
        get => this.get_PageOutputColorFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    PageOutputQualityFeature {
        get => this.get_PageOutputQualityFeature()
    }

    /**
     * @type {PrintTicketFeature} 
     */
    PageResolutionFeature {
        get => this.get_PageResolutionFeature()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_XmlNamespace() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_XmlNode() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(value)
    }

    /**
     * Retrieves the length of a monitor's capabilities string.
     * @remarks
     * This function usually returns quickly, but sometimes it can take several seconds to complete.
     * @returns {PrintTicketCapabilities} 
     * @see https://learn.microsoft.com/windows/win32/api//content/lowlevelmonitorconfigurationapi/nf-lowlevelmonitorconfigurationapi-getcapabilitiesstringlength
     */
    GetCapabilities() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketCapabilities(result_)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentBindingFeature() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentCollateFeature() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentDuplexFeature() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentHolePunchFeature() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentInputBinFeature() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentNUpFeature() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentStapleFeature() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_JobPasscodeFeature() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageBorderlessFeature() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageMediaSizeFeature() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageMediaTypeFeature() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageOrientationFeature() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageOutputColorFeature() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageOutputQualityFeature() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageResolutionFeature() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(value)
    }

    /**
     * This function is intended for infrastructure use only. (GetFeatureEnabledState)
     * @param {HSTRING} name 
     * @param {HSTRING} xmlNamespace 
     * @returns {PrintTicketFeature} 
     * @see https://learn.microsoft.com/windows/win32/api//content/featurestagingapi/nf-featurestagingapi-getfeatureenabledstate
     */
    GetFeature(name, xmlNamespace) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(xmlNamespace is String) {
            pin := HSTRING.Create(xmlNamespace)
            xmlNamespace := pin.Value
        }
        xmlNamespace := xmlNamespace is Win32Handle ? NumGet(xmlNamespace, "ptr") : xmlNamespace

        result := ComCall(25, this, "ptr", name, "ptr", xmlNamespace, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketFeature(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    NotifyXmlChangedAsync() {
        result := ComCall(26, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<WorkflowPrintTicketValidationResult>} 
     */
    ValidateAsync() {
        result := ComCall(27, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WorkflowPrintTicketValidationResult, operation)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} xmlNamespace 
     * @returns {PrintTicketParameterInitializer} 
     */
    GetParameterInitializer(name, xmlNamespace) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(xmlNamespace is String) {
            pin := HSTRING.Create(xmlNamespace)
            xmlNamespace := pin.Value
        }
        xmlNamespace := xmlNamespace is Win32Handle ? NumGet(xmlNamespace, "ptr") : xmlNamespace

        result := ComCall(28, this, "ptr", name, "ptr", xmlNamespace, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketParameterInitializer(result_)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} xmlNamespace 
     * @param {Integer} integerValue 
     * @returns {PrintTicketParameterInitializer} 
     */
    SetParameterInitializerAsInteger(name, xmlNamespace, integerValue) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(xmlNamespace is String) {
            pin := HSTRING.Create(xmlNamespace)
            xmlNamespace := pin.Value
        }
        xmlNamespace := xmlNamespace is Win32Handle ? NumGet(xmlNamespace, "ptr") : xmlNamespace

        result := ComCall(29, this, "ptr", name, "ptr", xmlNamespace, "int", integerValue, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketParameterInitializer(result_)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} xmlNamespace 
     * @param {HSTRING} stringValue 
     * @returns {PrintTicketParameterInitializer} 
     */
    SetParameterInitializerAsString(name, xmlNamespace, stringValue) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(xmlNamespace is String) {
            pin := HSTRING.Create(xmlNamespace)
            xmlNamespace := pin.Value
        }
        xmlNamespace := xmlNamespace is Win32Handle ? NumGet(xmlNamespace, "ptr") : xmlNamespace
        if(stringValue is String) {
            pin := HSTRING.Create(stringValue)
            stringValue := pin.Value
        }
        stringValue := stringValue is Win32Handle ? NumGet(stringValue, "ptr") : stringValue

        result := ComCall(30, this, "ptr", name, "ptr", xmlNamespace, "ptr", stringValue, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketParameterInitializer(result_)
    }

    /**
     * 
     * @param {WorkflowPrintTicket} deltaShemaTicket 
     * @returns {WorkflowPrintTicket} 
     */
    MergeAndValidateTicket(deltaShemaTicket) {
        result := ComCall(31, this, "ptr", deltaShemaTicket, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WorkflowPrintTicket(result_)
    }
}
