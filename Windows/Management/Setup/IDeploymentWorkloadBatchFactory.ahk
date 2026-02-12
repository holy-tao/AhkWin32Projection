#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DeploymentWorkloadBatch.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class IDeploymentWorkloadBatchFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeploymentWorkloadBatchFactory
     * @type {Guid}
     */
    static IID => Guid("{d0209697-9560-5a05-bdf6-f1af535cb0d4}")

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
     * @param {Integer} id 
     * @returns {DeploymentWorkloadBatch} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(id) {
        result := ComCall(6, this, "uint", id, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeploymentWorkloadBatch(value)
    }
}
