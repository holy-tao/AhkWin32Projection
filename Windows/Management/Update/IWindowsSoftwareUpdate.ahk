#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Uri.ahk
#Include .\WindowsSoftwareUpdateVersion.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\WindowsSoftwareUpdateResult.ahk
#Include .\WindowsSoftwareUpdateActionResultInfo.ahk
#Include .\WindowsSoftwareUpdateApprovalInfo.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\WindowsUpdateAttentionRequiredInfo.ahk
#Include .\WindowsSoftwareUpdateActionProgress.ahk
#Include .\WindowsSoftwareUpdateAppPackageInfo.ahk
#Include .\WindowsSoftwareUpdateExecutionInfo.ahk
#Include .\WindowsSoftwareUpdateOptionalInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdate extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdate
     * @type {Guid}
     */
    static IID => Guid("{d8f19211-98fe-58dd-af0f-470532aa3341}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InstallationType", "get_ProviderId", "get_UpdateId", "get_Title", "get_Description", "get_MoreInfoUrl", "get_DownloadSizeInBytes", "get_InstallSizeInBytes", "get_SourceVersion", "get_TargetVersion", "get_ProductCode", "get_PackageFamilyName", "Approve", "ApproveCurrentAction", "get_CurrentAction", "get_ActionResultInfo", "get_ApprovalInfo", "get_ApprovedActions", "get_AttentionRequiredInfo", "get_ActionProgress", "get_RestartReason", "get_AppPackageInfo", "get_ExecutionInfo", "get_OptionalInfo"]

    /**
     * @type {Integer} 
     */
    InstallationType {
        get => this.get_InstallationType()
    }

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
     * @type {Uri} 
     */
    MoreInfoUrl {
        get => this.get_MoreInfoUrl()
    }

    /**
     * @type {Integer} 
     */
    DownloadSizeInBytes {
        get => this.get_DownloadSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    InstallSizeInBytes {
        get => this.get_InstallSizeInBytes()
    }

    /**
     * @type {WindowsSoftwareUpdateVersion} 
     */
    SourceVersion {
        get => this.get_SourceVersion()
    }

    /**
     * @type {WindowsSoftwareUpdateVersion} 
     */
    TargetVersion {
        get => this.get_TargetVersion()
    }

    /**
     * @type {IReference<Guid>} 
     */
    ProductCode {
        get => this.get_ProductCode()
    }

    /**
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
    }

    /**
     * @type {HSTRING} 
     */
    CurrentAction {
        get => this.get_CurrentAction()
    }

    /**
     * @type {WindowsSoftwareUpdateActionResultInfo} 
     */
    ActionResultInfo {
        get => this.get_ActionResultInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateApprovalInfo} 
     */
    ApprovalInfo {
        get => this.get_ApprovalInfo()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    ApprovedActions {
        get => this.get_ApprovedActions()
    }

    /**
     * @type {WindowsUpdateAttentionRequiredInfo} 
     */
    AttentionRequiredInfo {
        get => this.get_AttentionRequiredInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateActionProgress} 
     */
    ActionProgress {
        get => this.get_ActionProgress()
    }

    /**
     * @type {IReference<Integer>} 
     */
    RestartReason {
        get => this.get_RestartReason()
    }

    /**
     * @type {WindowsSoftwareUpdateAppPackageInfo} 
     */
    AppPackageInfo {
        get => this.get_AppPackageInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateExecutionInfo} 
     */
    ExecutionInfo {
        get => this.get_ExecutionInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateOptionalInfo} 
     */
    OptionalInfo {
        get => this.get_OptionalInfo()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallationType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
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
    get_UpdateId() {
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
    get_Title() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
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
        result := ComCall(10, this, "ptr", value, "int")
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
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadSizeInBytes() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallSizeInBytes() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateVersion} 
     */
    get_SourceVersion() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateVersion(value)
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateVersion} 
     */
    get_TargetVersion() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateVersion(value)
    }

    /**
     * 
     * @returns {IReference<Guid>} 
     */
    get_ProductCode() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetGuid(), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {WindowsSoftwareUpdateApprovalInfo} approvalInfo 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    Approve(approvalInfo) {
        result := ComCall(18, this, "ptr", approvalInfo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateResult(result_)
    }

    /**
     * 
     * @param {Boolean} approve 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    ApproveCurrentAction(approve) {
        result := ComCall(19, this, "int", approve, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateResult(result_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CurrentAction() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateActionResultInfo} 
     */
    get_ActionResultInfo() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateActionResultInfo(value)
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateApprovalInfo} 
     */
    get_ApprovalInfo() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateApprovalInfo(value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_ApprovedActions() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
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
     * @returns {WindowsSoftwareUpdateActionProgress} 
     */
    get_ActionProgress() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateActionProgress(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RestartReason() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateAppPackageInfo} 
     */
    get_AppPackageInfo() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateAppPackageInfo(value)
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateExecutionInfo} 
     */
    get_ExecutionInfo() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateExecutionInfo(value)
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateOptionalInfo} 
     */
    get_OptionalInfo() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateOptionalInfo(value)
    }
}
