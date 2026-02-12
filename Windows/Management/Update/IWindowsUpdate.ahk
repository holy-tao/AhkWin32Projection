#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\WindowsUpdateAttentionRequiredInfo.ahk
#Include .\WindowsUpdateActionResult.ahk
#Include .\WindowsUpdateActionProgress.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Retrieves information about the version of Windows Update Agent (WUA).
 * @remarks
 * The <b>IWindowsUpdateAgentInfo</b> interface  may require  you to update WUA. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
 * 
 * You can create an instance of this interface by using the WindowsUpdateAgentInfo coclass. Use the Microsoft.Update.AgentInfo program identifier to create the object.
 * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nn-wuapi-iwindowsupdateagentinfo
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsUpdate extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsUpdate
     * @type {Guid}
     */
    static IID => Guid("{c3c88dd7-0ef3-52b2-a9ad-66bfc6bd9582}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProviderId", "get_UpdateId", "get_Title", "get_Description", "get_IsFeatureUpdate", "get_IsMinorImpact", "get_IsSecurity", "get_IsCritical", "get_IsForOS", "get_IsDriver", "get_IsMandatory", "get_IsUrgent", "get_IsSeeker", "get_MoreInfoUrl", "get_SupportUrl", "get_IsEulaAccepted", "get_EulaText", "get_Deadline", "get_AttentionRequiredInfo", "get_ActionResult", "get_CurrentAction", "get_ActionProgress", "GetPropertyValue", "AcceptEula"]

    /**
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
    }

    /**
     * @type {HSTRING} 
     */
    UpdateId {
        get => this.get_UpdateId()
    }

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {Boolean} 
     */
    IsFeatureUpdate {
        get => this.get_IsFeatureUpdate()
    }

    /**
     * @type {Boolean} 
     */
    IsMinorImpact {
        get => this.get_IsMinorImpact()
    }

    /**
     * @type {Boolean} 
     */
    IsSecurity {
        get => this.get_IsSecurity()
    }

    /**
     * @type {Boolean} 
     */
    IsCritical {
        get => this.get_IsCritical()
    }

    /**
     * @type {Boolean} 
     */
    IsForOS {
        get => this.get_IsForOS()
    }

    /**
     * @type {Boolean} 
     */
    IsDriver {
        get => this.get_IsDriver()
    }

    /**
     * @type {Boolean} 
     */
    IsMandatory {
        get => this.get_IsMandatory()
    }

    /**
     * @type {Boolean} 
     */
    IsUrgent {
        get => this.get_IsUrgent()
    }

    /**
     * @type {Boolean} 
     */
    IsSeeker {
        get => this.get_IsSeeker()
    }

    /**
     * @type {Uri} 
     */
    MoreInfoUrl {
        get => this.get_MoreInfoUrl()
    }

    /**
     * @type {Uri} 
     */
    SupportUrl {
        get => this.get_SupportUrl()
    }

    /**
     * @type {Boolean} 
     */
    IsEulaAccepted {
        get => this.get_IsEulaAccepted()
    }

    /**
     * @type {HSTRING} 
     */
    EulaText {
        get => this.get_EulaText()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    Deadline {
        get => this.get_Deadline()
    }

    /**
     * @type {WindowsUpdateAttentionRequiredInfo} 
     */
    AttentionRequiredInfo {
        get => this.get_AttentionRequiredInfo()
    }

    /**
     * @type {WindowsUpdateActionResult} 
     */
    ActionResult {
        get => this.get_ActionResult()
    }

    /**
     * @type {HSTRING} 
     */
    CurrentAction {
        get => this.get_CurrentAction()
    }

    /**
     * @type {WindowsUpdateActionProgress} 
     */
    ActionProgress {
        get => this.get_ActionProgress()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
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
    get_UpdateId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFeatureUpdate() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMinorImpact() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSecurity() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCritical() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsForOS() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDriver() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMandatory() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUrgent() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSeeker() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_MoreInfoUrl() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_SupportUrl() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEulaAccepted() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EulaText() {
        value := HSTRING()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Deadline() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {WindowsUpdateAttentionRequiredInfo} 
     */
    get_AttentionRequiredInfo() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsUpdateAttentionRequiredInfo(value)
    }

    /**
     * 
     * @returns {WindowsUpdateActionResult} 
     */
    get_ActionResult() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsUpdateActionResult(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CurrentAction() {
        value := HSTRING()
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {WindowsUpdateActionProgress} 
     */
    get_ActionProgress() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsUpdateActionProgress(value)
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @returns {IInspectable} 
     */
    GetPropertyValue(propertyName) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(28, this, "ptr", propertyName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AcceptEula() {
        result := ComCall(29, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
