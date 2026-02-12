#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InstallUpdateTaskResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IInstallUpdateTaskResultFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInstallUpdateTaskResultFactory
     * @type {Guid}
     */
    static IID => Guid("{07473356-1a87-554d-9c14-489c0d69b258}")

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
     * @param {UpdateTaskResult} result_ 
     * @param {IVectorView<UpdateInstallRecord>} installRecords 
     * @param {Boolean} shouldRollback 
     * @returns {InstallUpdateTaskResult} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(result_, installRecords, shouldRollback) {
        result := ComCall(6, this, "ptr", result_, "ptr", installRecords, "int", shouldRollback, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InstallUpdateTaskResult(value)
    }
}
