#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WindowsSoftwareUpdateOptionalInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateOptionalInfoFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateOptionalInfoFactory
     * @type {Guid}
     */
    static IID => Guid("{d837deed-a5f2-5c89-8beb-852d2897b2ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "CreateInstance2"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {IReference<Integer>} complianceDeadlineInDays 
     * @param {IReference<Integer>} complianceGracePeriodInDays 
     * @returns {WindowsSoftwareUpdateOptionalInfo} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(complianceDeadlineInDays, complianceGracePeriodInDays) {
        result := ComCall(6, this, "ptr", complianceDeadlineInDays, "ptr", complianceGracePeriodInDays, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateOptionalInfo(value)
    }

    /**
     * 
     * @param {IIterable<WindowsSoftwareUpdateLocalizationInfo>} localizationInfo 
     * @param {IReference<Integer>} complianceDeadlineInDays 
     * @param {IReference<Integer>} complianceGracePeriodInDays 
     * @returns {WindowsSoftwareUpdateOptionalInfo} 
     */
    CreateInstance2(localizationInfo, complianceDeadlineInDays, complianceGracePeriodInDays) {
        result := ComCall(7, this, "ptr", localizationInfo, "ptr", complianceDeadlineInDays, "ptr", complianceGracePeriodInDays, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateOptionalInfo(value)
    }
}
