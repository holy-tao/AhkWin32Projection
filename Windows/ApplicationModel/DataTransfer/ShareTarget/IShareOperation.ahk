#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DataPackageView.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer.ShareTarget
 * @version WindowsRuntime 1.4
 */
class IShareOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShareOperation
     * @type {Guid}
     */
    static IID => Guid("{2246bab8-d0f8-41c1-a82a-4137db6504fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Data", "get_QuickLinkId", "RemoveThisQuickLink", "ReportStarted", "ReportDataRetrieved", "ReportSubmittedBackgroundTask", "ReportCompletedWithQuickLink", "ReportCompleted1", "ReportError"]

    /**
     * @type {DataPackageView} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * @type {HSTRING} 
     */
    QuickLinkId {
        get => this.get_QuickLinkId()
    }

    /**
     * 
     * @returns {DataPackageView} 
     */
    get_Data() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPackageView(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QuickLinkId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveThisQuickLink() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReportStarted() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReportDataRetrieved() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReportSubmittedBackgroundTask() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {QuickLink} quicklink_ 
     * @returns {HRESULT} 
     */
    ReportCompletedWithQuickLink(quicklink_) {
        result := ComCall(12, this, "ptr", quicklink_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReportCompleted1() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    ReportError(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
