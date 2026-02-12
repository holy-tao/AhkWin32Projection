#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\ApplicationModel\AppInfo.ahk
#Include ..\PrintTicket\WorkflowPrintTicket.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportPrinterSelectedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportPrinterSelectedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{7b1cb7d9-a8a4-5c09-adb2-66165f817977}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceAppInfo", "get_PrintTicket", "put_PrintTicket", "SetAdditionalFeatures", "SetAdditionalParameters", "get_AllowedAdditionalFeaturesAndParametersCount", "SetAdaptiveCard", "GetDeferral"]

    /**
     * @type {AppInfo} 
     */
    SourceAppInfo {
        get => this.get_SourceAppInfo()
    }

    /**
     * @type {WorkflowPrintTicket} 
     */
    PrintTicket {
        get => this.get_PrintTicket()
        set => this.put_PrintTicket(value)
    }

    /**
     * @type {Integer} 
     */
    AllowedAdditionalFeaturesAndParametersCount {
        get => this.get_AllowedAdditionalFeaturesAndParametersCount()
    }

    /**
     * 
     * @returns {AppInfo} 
     */
    get_SourceAppInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppInfo(value)
    }

    /**
     * 
     * @returns {WorkflowPrintTicket} 
     */
    get_PrintTicket() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WorkflowPrintTicket(value)
    }

    /**
     * 
     * @param {WorkflowPrintTicket} value 
     * @returns {HRESULT} 
     */
    put_PrintTicket(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<PrintSupportPrintTicketElement>} features 
     * @returns {HRESULT} 
     */
    SetAdditionalFeatures(features) {
        result := ComCall(9, this, "ptr", features, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<PrintSupportPrintTicketElement>} parameters 
     * @returns {HRESULT} 
     */
    SetAdditionalParameters(parameters) {
        result := ComCall(10, this, "ptr", parameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedAdditionalFeaturesAndParametersCount() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IAdaptiveCard} adaptiveCard 
     * @returns {HRESULT} 
     */
    SetAdaptiveCard(adaptiveCard) {
        result := ComCall(12, this, "ptr", adaptiveCard, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}
