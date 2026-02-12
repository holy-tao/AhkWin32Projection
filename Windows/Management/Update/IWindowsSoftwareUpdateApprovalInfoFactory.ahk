#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WindowsSoftwareUpdateApprovalInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateApprovalInfoFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateApprovalInfoFactory
     * @type {Guid}
     */
    static IID => Guid("{ab291c7c-d29f-5ac5-b447-0bfcabdc2cc3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Boolean} userInitiated 
     * @param {Boolean} appClosure 
     * @param {Boolean} meteredNetwork 
     * @param {Boolean} seeker 
     * @returns {WindowsSoftwareUpdateApprovalInfo} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(userInitiated, appClosure, meteredNetwork, seeker) {
        result := ComCall(6, this, "int", userInitiated, "int", appClosure, "int", meteredNetwork, "int", seeker, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateApprovalInfo(value)
    }
}
