#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class IFileSavePicker2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSavePicker2
     * @type {Guid}
     */
    static IID => Guid("{0ec313a2-d24b-449a-8197-e89104fd42cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContinuationData", "PickSaveFileAndContinue"]

    /**
     * @type {ValueSet} 
     */
    ContinuationData {
        get => this.get_ContinuationData()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_ContinuationData() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PickSaveFileAndContinue() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
