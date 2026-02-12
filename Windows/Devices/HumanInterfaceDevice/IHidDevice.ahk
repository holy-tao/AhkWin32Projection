#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\HidInputReport.ahk
#Include .\HidFeatureReport.ahk
#Include .\HidOutputReport.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\HidBooleanControlDescription.ahk
#Include .\HidNumericControlDescription.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class IHidDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHidDevice
     * @type {Guid}
     */
    static IID => Guid("{5f8a14e7-2200-432e-95da-d09b87d574a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VendorId", "get_ProductId", "get_Version", "get_UsagePage", "get_UsageId", "GetInputReportAsync", "GetInputReportByIdAsync", "GetFeatureReportAsync", "GetFeatureReportByIdAsync", "CreateOutputReport", "CreateOutputReportById", "CreateFeatureReport", "CreateFeatureReportById", "SendOutputReportAsync", "SendFeatureReportAsync", "GetBooleanControlDescriptions", "GetNumericControlDescriptions", "add_InputReportReceived", "remove_InputReportReceived"]

    /**
     * @type {Integer} 
     */
    VendorId {
        get => this.get_VendorId()
    }

    /**
     * @type {Integer} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {Integer} 
     */
    UsagePage {
        get => this.get_UsagePage()
    }

    /**
     * @type {Integer} 
     */
    UsageId {
        get => this.get_UsageId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VendorId() {
        result := ComCall(6, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProductId() {
        result := ComCall(7, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Version() {
        result := ComCall(8, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsagePage() {
        result := ComCall(9, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageId() {
        result := ComCall(10, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<HidInputReport>} 
     */
    GetInputReportAsync() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HidInputReport, value)
    }

    /**
     * 
     * @param {Integer} reportId 
     * @returns {IAsyncOperation<HidInputReport>} 
     */
    GetInputReportByIdAsync(reportId) {
        result := ComCall(12, this, "ushort", reportId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HidInputReport, value)
    }

    /**
     * 
     * @returns {IAsyncOperation<HidFeatureReport>} 
     */
    GetFeatureReportAsync() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HidFeatureReport, value)
    }

    /**
     * 
     * @param {Integer} reportId 
     * @returns {IAsyncOperation<HidFeatureReport>} 
     */
    GetFeatureReportByIdAsync(reportId) {
        result := ComCall(14, this, "ushort", reportId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HidFeatureReport, value)
    }

    /**
     * 
     * @returns {HidOutputReport} 
     */
    CreateOutputReport() {
        result := ComCall(15, this, "ptr*", &outputReport := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HidOutputReport(outputReport)
    }

    /**
     * 
     * @param {Integer} reportId 
     * @returns {HidOutputReport} 
     */
    CreateOutputReportById(reportId) {
        result := ComCall(16, this, "ushort", reportId, "ptr*", &outputReport := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HidOutputReport(outputReport)
    }

    /**
     * 
     * @returns {HidFeatureReport} 
     */
    CreateFeatureReport() {
        result := ComCall(17, this, "ptr*", &featureReport := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HidFeatureReport(featureReport)
    }

    /**
     * 
     * @param {Integer} reportId 
     * @returns {HidFeatureReport} 
     */
    CreateFeatureReportById(reportId) {
        result := ComCall(18, this, "ushort", reportId, "ptr*", &featureReport := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HidFeatureReport(featureReport)
    }

    /**
     * 
     * @param {HidOutputReport} outputReport 
     * @returns {IAsyncOperation<Integer>} 
     */
    SendOutputReportAsync(outputReport) {
        result := ComCall(19, this, "ptr", outputReport, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }

    /**
     * 
     * @param {HidFeatureReport} featureReport 
     * @returns {IAsyncOperation<Integer>} 
     */
    SendFeatureReportAsync(featureReport) {
        result := ComCall(20, this, "ptr", featureReport, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }

    /**
     * 
     * @param {Integer} reportType 
     * @param {Integer} usagePage 
     * @param {Integer} usageId 
     * @returns {IVectorView<HidBooleanControlDescription>} 
     */
    GetBooleanControlDescriptions(reportType, usagePage, usageId) {
        result := ComCall(21, this, "int", reportType, "ushort", usagePage, "ushort", usageId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HidBooleanControlDescription, value)
    }

    /**
     * 
     * @param {Integer} reportType 
     * @param {Integer} usagePage 
     * @param {Integer} usageId 
     * @returns {IVectorView<HidNumericControlDescription>} 
     */
    GetNumericControlDescriptions(reportType, usagePage, usageId) {
        result := ComCall(22, this, "int", reportType, "ushort", usagePage, "ushort", usageId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HidNumericControlDescription, value)
    }

    /**
     * 
     * @param {TypedEventHandler<HidDevice, HidInputReportReceivedEventArgs>} reportHandler 
     * @returns {EventRegistrationToken} 
     */
    add_InputReportReceived(reportHandler) {
        token := EventRegistrationToken()
        result := ComCall(23, this, "ptr", reportHandler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_InputReportReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(24, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
