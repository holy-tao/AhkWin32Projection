#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WindowsSoftwareUpdateScanResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateScanResultFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateScanResultFactory
     * @type {Guid}
     */
    static IID => Guid("{21148e4c-e7ce-574e-bfa7-69dc77457d21}")

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
     * @param {Boolean} succeeded 
     * @param {Integer} resultCode 
     * @param {IIterable<WindowsSoftwareUpdate>} updates 
     * @returns {WindowsSoftwareUpdateScanResult} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(succeeded, resultCode, updates) {
        result := ComCall(6, this, "int", succeeded, "uint", resultCode, "ptr", updates, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateScanResult(value)
    }

    /**
     * 
     * @param {Boolean} succeeded 
     * @param {Integer} resultCode 
     * @param {Integer} extendedError 
     * @param {IIterable<WindowsSoftwareUpdate>} updates 
     * @returns {WindowsSoftwareUpdateScanResult} 
     */
    CreateInstance2(succeeded, resultCode, extendedError, updates) {
        result := ComCall(7, this, "int", succeeded, "uint", resultCode, "uint", extendedError, "ptr", updates, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateScanResult(value)
    }
}
