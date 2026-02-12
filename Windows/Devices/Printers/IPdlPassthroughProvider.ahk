#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PdlPassthroughTarget.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IPdlPassthroughProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPdlPassthroughProvider
     * @type {Guid}
     */
    static IID => Guid("{23c71dd2-6117-553f-9378-180af5849a49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedPdlContentTypes", "StartPrintJobWithTaskOptions", "StartPrintJobWithPrintTicket"]

    /**
     * @type {IVectorView<HSTRING>} 
     */
    SupportedPdlContentTypes {
        get => this.get_SupportedPdlContentTypes()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_SupportedPdlContentTypes() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @param {HSTRING} jobName 
     * @param {HSTRING} pdlContentType 
     * @param {PrintTaskOptions} taskOptions 
     * @param {PageConfigurationSettings} pageConfigurationSettings_ 
     * @returns {PdlPassthroughTarget} 
     */
    StartPrintJobWithTaskOptions(jobName, pdlContentType, taskOptions, pageConfigurationSettings_) {
        if(jobName is String) {
            pin := HSTRING.Create(jobName)
            jobName := pin.Value
        }
        jobName := jobName is Win32Handle ? NumGet(jobName, "ptr") : jobName
        if(pdlContentType is String) {
            pin := HSTRING.Create(pdlContentType)
            pdlContentType := pin.Value
        }
        pdlContentType := pdlContentType is Win32Handle ? NumGet(pdlContentType, "ptr") : pdlContentType

        result := ComCall(7, this, "ptr", jobName, "ptr", pdlContentType, "ptr", taskOptions, "ptr", pageConfigurationSettings_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PdlPassthroughTarget(result_)
    }

    /**
     * 
     * @param {HSTRING} jobName 
     * @param {HSTRING} pdlContentType 
     * @param {IInputStream} printTicket 
     * @param {PageConfigurationSettings} pageConfigurationSettings_ 
     * @returns {PdlPassthroughTarget} 
     */
    StartPrintJobWithPrintTicket(jobName, pdlContentType, printTicket, pageConfigurationSettings_) {
        if(jobName is String) {
            pin := HSTRING.Create(jobName)
            jobName := pin.Value
        }
        jobName := jobName is Win32Handle ? NumGet(jobName, "ptr") : jobName
        if(pdlContentType is String) {
            pin := HSTRING.Create(pdlContentType)
            pdlContentType := pin.Value
        }
        pdlContentType := pdlContentType is Win32Handle ? NumGet(pdlContentType, "ptr") : pdlContentType

        result := ComCall(8, this, "ptr", jobName, "ptr", pdlContentType, "ptr", printTicket, "ptr", pageConfigurationSettings_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PdlPassthroughTarget(result_)
    }
}
