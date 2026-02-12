#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\WindowsSoftwareUpdateLocalizationInfo.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateOptionalInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateOptionalInfo
     * @type {Guid}
     */
    static IID => Guid("{78084a73-50c4-5c33-a751-7a121f5aae70}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocalizationInfo", "get_ComplianceDeadlineInDays", "get_ComplianceGracePeriodInDays"]

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

    /**
     * 
     * @returns {IVectorView<WindowsSoftwareUpdateLocalizationInfo>} 
     */
    get_LocalizationInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(WindowsSoftwareUpdateLocalizationInfo, value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ComplianceDeadlineInDays() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ComplianceGracePeriodInDays() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
