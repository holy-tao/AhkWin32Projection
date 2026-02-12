#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AreRebootsPendingResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IAreRebootsPendingResultFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAreRebootsPendingResultFactory
     * @type {Guid}
     */
    static IID => Guid("{801c7304-1fdf-59b4-9ef6-adbd0544d98f}")

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
     * @param {UpdateOperationResult} result_ 
     * @param {Boolean} isRebootPending 
     * @returns {AreRebootsPendingResult} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(result_, isRebootPending) {
        result := ComCall(6, this, "ptr", result_, "int", isRebootPending, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AreRebootsPendingResult(value)
    }
}
