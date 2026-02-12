#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelSessionOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelSessionOptions
     * @type {Guid}
     */
    static IID => Guid("{b8f63fa1-134d-5133-8cff-3a5c3c263beb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BatchSizeOverride", "put_BatchSizeOverride"]

    /**
     * @type {Integer} 
     */
    BatchSizeOverride {
        get => this.get_BatchSizeOverride()
        set => this.put_BatchSizeOverride(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BatchSizeOverride() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BatchSizeOverride(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
