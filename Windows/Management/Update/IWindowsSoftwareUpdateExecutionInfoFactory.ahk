#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WindowsSoftwareUpdateExecutionInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateExecutionInfoFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateExecutionInfoFactory
     * @type {Guid}
     */
    static IID => Guid("{88596f7e-b9ef-5583-8135-94d62ed66ed4}")

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
     * @param {WindowsSoftwareUpdateActionInfo} downloadInfo 
     * @param {WindowsSoftwareUpdateActionInfo} installInfo 
     * @param {WindowsSoftwareUpdateOptionalActionInfo} actions 
     * @returns {WindowsSoftwareUpdateExecutionInfo} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(downloadInfo, installInfo, actions) {
        result := ComCall(6, this, "ptr", downloadInfo, "ptr", installInfo, "ptr", actions, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateExecutionInfo(value)
    }

    /**
     * 
     * @param {WindowsSoftwareUpdateActionInfo} deployInfo 
     * @param {WindowsSoftwareUpdateOptionalActionInfo} actions 
     * @returns {WindowsSoftwareUpdateExecutionInfo} 
     */
    CreateInstance2(deployInfo, actions) {
        result := ComCall(7, this, "ptr", deployInfo, "ptr", actions, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateExecutionInfo(value)
    }
}
