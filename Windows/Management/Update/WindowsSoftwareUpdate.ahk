#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdate.ahk
#Include .\IWindowsSoftwareUpdateFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdate.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} providerId 
     * @param {Integer} installationType 
     * @param {HSTRING} updateId 
     * @param {HSTRING} title 
     * @param {HSTRING} description 
     * @param {Uri} moreInfoUrl 
     * @param {Integer} downloadSizeInBytes 
     * @param {Integer} installSizeInBytes 
     * @param {WindowsSoftwareUpdateVersion} sourceVersion 
     * @param {WindowsSoftwareUpdateVersion} targetVersion 
     * @param {WindowsSoftwareUpdateAppPackageInfo} appPackageInfo 
     * @param {WindowsSoftwareUpdateExecutionInfo} executionInfo 
     * @param {WindowsSoftwareUpdateOptionalInfo} optionalInfo 
     * @returns {WindowsSoftwareUpdate} 
     */
    static CreateInstance(providerId, installationType, updateId, title, description, moreInfoUrl, downloadSizeInBytes, installSizeInBytes, sourceVersion, targetVersion, appPackageInfo, executionInfo, optionalInfo) {
        if (!WindowsSoftwareUpdate.HasProp("__IWindowsSoftwareUpdateFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdate")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateFactory.IID)
            WindowsSoftwareUpdate.__IWindowsSoftwareUpdateFactory := IWindowsSoftwareUpdateFactory(factoryPtr)
        }

        return WindowsSoftwareUpdate.__IWindowsSoftwareUpdateFactory.CreateInstance(providerId, installationType, updateId, title, description, moreInfoUrl, downloadSizeInBytes, installSizeInBytes, sourceVersion, targetVersion, appPackageInfo, executionInfo, optionalInfo)
    }

    /**
     * 
     * @param {HSTRING} providerId 
     * @param {Integer} installationType 
     * @param {HSTRING} updateId 
     * @param {HSTRING} title 
     * @param {HSTRING} description 
     * @param {Uri} moreInfoUrl 
     * @param {Integer} downloadSizeInBytes 
     * @param {Integer} installSizeInBytes 
     * @param {IReference<Guid>} productCode 
     * @param {HSTRING} packageFamilyName 
     * @param {WindowsSoftwareUpdateVersion} sourceVersion 
     * @param {WindowsSoftwareUpdateVersion} targetVersion 
     * @param {WindowsSoftwareUpdateAppPackageInfo} appPackageInfo 
     * @param {WindowsSoftwareUpdateExecutionInfo} executionInfo 
     * @param {WindowsSoftwareUpdateOptionalInfo} optionalInfo 
     * @returns {WindowsSoftwareUpdate} 
     */
    static CreateInstance2(providerId, installationType, updateId, title, description, moreInfoUrl, downloadSizeInBytes, installSizeInBytes, productCode, packageFamilyName, sourceVersion, targetVersion, appPackageInfo, executionInfo, optionalInfo) {
        if (!WindowsSoftwareUpdate.HasProp("__IWindowsSoftwareUpdateFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdate")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateFactory.IID)
            WindowsSoftwareUpdate.__IWindowsSoftwareUpdateFactory := IWindowsSoftwareUpdateFactory(factoryPtr)
        }

        return WindowsSoftwareUpdate.__IWindowsSoftwareUpdateFactory.CreateInstance2(providerId, installationType, updateId, title, description, moreInfoUrl, downloadSizeInBytes, installSizeInBytes, productCode, packageFamilyName, sourceVersion, targetVersion, appPackageInfo, executionInfo, optionalInfo)
    }

;@endregion Static Methods

;@region Instance Properties
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

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallationType() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_InstallationType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_ProviderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UpdateId() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_UpdateId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_Description()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_MoreInfoUrl() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_MoreInfoUrl()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadSizeInBytes() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_DownloadSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallSizeInBytes() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_InstallSizeInBytes()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateVersion} 
     */
    get_SourceVersion() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_SourceVersion()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateVersion} 
     */
    get_TargetVersion() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_TargetVersion()
    }

    /**
     * 
     * @returns {IReference<Guid>} 
     */
    get_ProductCode() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_ProductCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_PackageFamilyName()
    }

    /**
     * 
     * @param {WindowsSoftwareUpdateApprovalInfo} approvalInfo 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    Approve(approvalInfo) {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.Approve(approvalInfo)
    }

    /**
     * 
     * @param {Boolean} approve 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    ApproveCurrentAction(approve) {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.ApproveCurrentAction(approve)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CurrentAction() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_CurrentAction()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateActionResultInfo} 
     */
    get_ActionResultInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_ActionResultInfo()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateApprovalInfo} 
     */
    get_ApprovalInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_ApprovalInfo()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_ApprovedActions() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_ApprovedActions()
    }

    /**
     * 
     * @returns {WindowsUpdateAttentionRequiredInfo} 
     */
    get_AttentionRequiredInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_AttentionRequiredInfo()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateActionProgress} 
     */
    get_ActionProgress() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_ActionProgress()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RestartReason() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_RestartReason()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateAppPackageInfo} 
     */
    get_AppPackageInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_AppPackageInfo()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateExecutionInfo} 
     */
    get_ExecutionInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_ExecutionInfo()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateOptionalInfo} 
     */
    get_OptionalInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdate := IWindowsSoftwareUpdate(outPtr)
        }

        return this.__IWindowsSoftwareUpdate.get_OptionalInfo()
    }

;@endregion Instance Methods
}
