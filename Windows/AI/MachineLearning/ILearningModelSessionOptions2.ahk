#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelSessionOptions2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelSessionOptions2
     * @type {Guid}
     */
    static IID => Guid("{6fcd1dc4-175f-5bd2-8de5-2f2006a25adf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CloseModelOnSessionCreation", "put_CloseModelOnSessionCreation"]

    /**
     * @type {Boolean} 
     */
    CloseModelOnSessionCreation {
        get => this.get_CloseModelOnSessionCreation()
        set => this.put_CloseModelOnSessionCreation(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CloseModelOnSessionCreation() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CloseModelOnSessionCreation(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
