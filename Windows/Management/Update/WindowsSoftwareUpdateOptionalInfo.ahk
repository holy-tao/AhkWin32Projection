#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateOptionalInfo.ahk
#Include .\IWindowsSoftwareUpdateOptionalInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateOptionalInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateOptionalInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateOptionalInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {IReference<Integer>} complianceDeadlineInDays 
     * @param {IReference<Integer>} complianceGracePeriodInDays 
     * @returns {WindowsSoftwareUpdateOptionalInfo} 
     */
    static CreateInstance(complianceDeadlineInDays, complianceGracePeriodInDays) {
        if (!WindowsSoftwareUpdateOptionalInfo.HasProp("__IWindowsSoftwareUpdateOptionalInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateOptionalInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateOptionalInfoFactory.IID)
            WindowsSoftwareUpdateOptionalInfo.__IWindowsSoftwareUpdateOptionalInfoFactory := IWindowsSoftwareUpdateOptionalInfoFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateOptionalInfo.__IWindowsSoftwareUpdateOptionalInfoFactory.CreateInstance(complianceDeadlineInDays, complianceGracePeriodInDays)
    }

    /**
     * 
     * @param {IIterable<WindowsSoftwareUpdateLocalizationInfo>} localizationInfo 
     * @param {IReference<Integer>} complianceDeadlineInDays 
     * @param {IReference<Integer>} complianceGracePeriodInDays 
     * @returns {WindowsSoftwareUpdateOptionalInfo} 
     */
    static CreateInstance2(localizationInfo, complianceDeadlineInDays, complianceGracePeriodInDays) {
        if (!WindowsSoftwareUpdateOptionalInfo.HasProp("__IWindowsSoftwareUpdateOptionalInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateOptionalInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateOptionalInfoFactory.IID)
            WindowsSoftwareUpdateOptionalInfo.__IWindowsSoftwareUpdateOptionalInfoFactory := IWindowsSoftwareUpdateOptionalInfoFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateOptionalInfo.__IWindowsSoftwareUpdateOptionalInfoFactory.CreateInstance2(localizationInfo, complianceDeadlineInDays, complianceGracePeriodInDays)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {IVectorView<WindowsSoftwareUpdateLocalizationInfo>} 
     */
    LocalizationInfo {
        get => this.get_LocalizationInfo()
    }

    /**
     * @type {IReference<Integer>} 
     */
    ComplianceDeadlineInDays {
        get => this.get_ComplianceDeadlineInDays()
    }

    /**
     * @type {IReference<Integer>} 
     */
    ComplianceGracePeriodInDays {
        get => this.get_ComplianceGracePeriodInDays()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<WindowsSoftwareUpdateLocalizationInfo>} 
     */
    get_LocalizationInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdateOptionalInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateOptionalInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateOptionalInfo := IWindowsSoftwareUpdateOptionalInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateOptionalInfo.get_LocalizationInfo()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ComplianceDeadlineInDays() {
        if (!this.HasProp("__IWindowsSoftwareUpdateOptionalInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateOptionalInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateOptionalInfo := IWindowsSoftwareUpdateOptionalInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateOptionalInfo.get_ComplianceDeadlineInDays()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ComplianceGracePeriodInDays() {
        if (!this.HasProp("__IWindowsSoftwareUpdateOptionalInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateOptionalInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateOptionalInfo := IWindowsSoftwareUpdateOptionalInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateOptionalInfo.get_ComplianceGracePeriodInDays()
    }

;@endregion Instance Methods
}
