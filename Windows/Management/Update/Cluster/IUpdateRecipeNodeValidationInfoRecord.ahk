#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\UpdateScanRecord.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IUpdateRecipeNodeValidationInfoRecord extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateRecipeNodeValidationInfoRecord
     * @type {Guid}
     */
    static IID => Guid("{55dfff15-5556-51c4-80c2-af03f385d429}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NodeName", "get_RecipeValidationInfo", "get_ScanResults"]

    /**
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
    }

    /**
     * @type {HSTRING} 
     */
    RecipeValidationInfo {
        get => this.get_RecipeValidationInfo()
    }

    /**
     * @type {IVectorView<UpdateScanRecord>} 
     */
    ScanResults {
        get => this.get_ScanResults()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NodeName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RecipeValidationInfo() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<UpdateScanRecord>} 
     */
    get_ScanResults() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UpdateScanRecord, value)
    }
}
