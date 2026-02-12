#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LearningModelBinding.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelBindingFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelBindingFactory
     * @type {Guid}
     */
    static IID => Guid("{c95f7a7a-e788-475e-8917-23aa381faf0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromSession"]

    /**
     * 
     * @param {LearningModelSession} session 
     * @returns {LearningModelBinding} 
     */
    CreateFromSession(session) {
        result := ComCall(6, this, "ptr", session, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModelBinding(value)
    }
}
