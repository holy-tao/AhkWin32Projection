#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProtectionPolicyAuditInfo.ahk
#Include .\IProtectionPolicyAuditInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Represents the information required for auditing.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyauditinfo
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class ProtectionPolicyAuditInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProtectionPolicyAuditInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProtectionPolicyAuditInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Initializes a new instance of the class.
     * @param {Integer} action The audit action.
     * @param {HSTRING} dataDescription A description of the data being audited.
     * @param {HSTRING} sourceDescription A description of the source of the data.
     * @param {HSTRING} targetDescription A description of the target of the data.
     * @returns {ProtectionPolicyAuditInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyauditinfo.#ctor
     */
    static Create(action, dataDescription, sourceDescription, targetDescription) {
        if (!ProtectionPolicyAuditInfo.HasProp("__IProtectionPolicyAuditInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyAuditInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyAuditInfoFactory.IID)
            ProtectionPolicyAuditInfo.__IProtectionPolicyAuditInfoFactory := IProtectionPolicyAuditInfoFactory(factoryPtr)
        }

        return ProtectionPolicyAuditInfo.__IProtectionPolicyAuditInfoFactory.Create(action, dataDescription, sourceDescription, targetDescription)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Initializes a new instance of the class.
     * @param {Integer} action The audit action.
     * @param {HSTRING} dataDescription A description of the data being audited.
     * @returns {ProtectionPolicyAuditInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyauditinfo.#ctor
     */
    static CreateWithActionAndDataDescription(action, dataDescription) {
        if (!ProtectionPolicyAuditInfo.HasProp("__IProtectionPolicyAuditInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyAuditInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyAuditInfoFactory.IID)
            ProtectionPolicyAuditInfo.__IProtectionPolicyAuditInfoFactory := IProtectionPolicyAuditInfoFactory(factoryPtr)
        }

        return ProtectionPolicyAuditInfo.__IProtectionPolicyAuditInfoFactory.CreateWithActionAndDataDescription(action, dataDescription)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * The audit action.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyauditinfo.action
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
        set => this.put_Action(value)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * A description of the data being audited.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyauditinfo.datadescription
     * @type {HSTRING} 
     */
    DataDescription {
        get => this.get_DataDescription()
        set => this.put_DataDescription(value)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * A description of the source of the data.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyauditinfo.sourcedescription
     * @type {HSTRING} 
     */
    SourceDescription {
        get => this.get_SourceDescription()
        set => this.put_SourceDescription(value)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * A description of the target of the data.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyauditinfo.targetdescription
     * @type {HSTRING} 
     */
    TargetDescription {
        get => this.get_TargetDescription()
        set => this.put_TargetDescription(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Action(value) {
        if (!this.HasProp("__IProtectionPolicyAuditInfo")) {
            if ((queryResult := this.QueryInterface(IProtectionPolicyAuditInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectionPolicyAuditInfo := IProtectionPolicyAuditInfo(outPtr)
        }

        return this.__IProtectionPolicyAuditInfo.put_Action(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Action() {
        if (!this.HasProp("__IProtectionPolicyAuditInfo")) {
            if ((queryResult := this.QueryInterface(IProtectionPolicyAuditInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectionPolicyAuditInfo := IProtectionPolicyAuditInfo(outPtr)
        }

        return this.__IProtectionPolicyAuditInfo.get_Action()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DataDescription(value) {
        if (!this.HasProp("__IProtectionPolicyAuditInfo")) {
            if ((queryResult := this.QueryInterface(IProtectionPolicyAuditInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectionPolicyAuditInfo := IProtectionPolicyAuditInfo(outPtr)
        }

        return this.__IProtectionPolicyAuditInfo.put_DataDescription(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DataDescription() {
        if (!this.HasProp("__IProtectionPolicyAuditInfo")) {
            if ((queryResult := this.QueryInterface(IProtectionPolicyAuditInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectionPolicyAuditInfo := IProtectionPolicyAuditInfo(outPtr)
        }

        return this.__IProtectionPolicyAuditInfo.get_DataDescription()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SourceDescription(value) {
        if (!this.HasProp("__IProtectionPolicyAuditInfo")) {
            if ((queryResult := this.QueryInterface(IProtectionPolicyAuditInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectionPolicyAuditInfo := IProtectionPolicyAuditInfo(outPtr)
        }

        return this.__IProtectionPolicyAuditInfo.put_SourceDescription(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceDescription() {
        if (!this.HasProp("__IProtectionPolicyAuditInfo")) {
            if ((queryResult := this.QueryInterface(IProtectionPolicyAuditInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectionPolicyAuditInfo := IProtectionPolicyAuditInfo(outPtr)
        }

        return this.__IProtectionPolicyAuditInfo.get_SourceDescription()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetDescription(value) {
        if (!this.HasProp("__IProtectionPolicyAuditInfo")) {
            if ((queryResult := this.QueryInterface(IProtectionPolicyAuditInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectionPolicyAuditInfo := IProtectionPolicyAuditInfo(outPtr)
        }

        return this.__IProtectionPolicyAuditInfo.put_TargetDescription(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetDescription() {
        if (!this.HasProp("__IProtectionPolicyAuditInfo")) {
            if ((queryResult := this.QueryInterface(IProtectionPolicyAuditInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectionPolicyAuditInfo := IProtectionPolicyAuditInfo(outPtr)
        }

        return this.__IProtectionPolicyAuditInfo.get_TargetDescription()
    }

;@endregion Instance Methods
}
