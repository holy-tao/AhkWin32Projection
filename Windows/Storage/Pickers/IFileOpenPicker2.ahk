#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class IFileOpenPicker2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileOpenPicker2
     * @type {Guid}
     */
    static IID => Guid("{8ceb6cd2-b446-46f7-b265-90f8e55ad650}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContinuationData", "PickSingleFileAndContinue", "PickMultipleFilesAndContinue"]

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
    PickSingleFileAndContinue() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PickMultipleFilesAndContinue() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
