#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UpdateRecipeNodeValidationInfoRecord.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IUpdateRecipeNodeValidationInfoRecordFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateRecipeNodeValidationInfoRecordFactory
     * @type {Guid}
     */
    static IID => Guid("{e0fa2776-dd6c-5139-a93e-23e2188921af}")

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
     * @param {HSTRING} nodeName 
     * @param {HSTRING} recipeValidationInfo 
     * @param {IVectorView<UpdateScanRecord>} scanResults 
     * @returns {UpdateRecipeNodeValidationInfoRecord} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(nodeName, recipeValidationInfo, scanResults) {
        if(nodeName is String) {
            pin := HSTRING.Create(nodeName)
            nodeName := pin.Value
        }
        nodeName := nodeName is Win32Handle ? NumGet(nodeName, "ptr") : nodeName
        if(recipeValidationInfo is String) {
            pin := HSTRING.Create(recipeValidationInfo)
            recipeValidationInfo := pin.Value
        }
        recipeValidationInfo := recipeValidationInfo is Win32Handle ? NumGet(recipeValidationInfo, "ptr") : recipeValidationInfo

        result := ComCall(6, this, "ptr", nodeName, "ptr", recipeValidationInfo, "ptr", scanResults, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateRecipeNodeValidationInfoRecord(value)
    }
}
