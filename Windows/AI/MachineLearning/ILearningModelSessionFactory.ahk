#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LearningModelSession.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelSessionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelSessionFactory
     * @type {Guid}
     */
    static IID => Guid("{0f6b881d-1c9b-47b6-bfe0-f1cf62a67579}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromModel", "CreateFromModelOnDevice"]

    /**
     * 
     * @param {LearningModel} model 
     * @returns {LearningModelSession} 
     */
    CreateFromModel(model) {
        result := ComCall(6, this, "ptr", model, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModelSession(value)
    }

    /**
     * 
     * @param {LearningModel} model 
     * @param {LearningModelDevice} deviceToRunOn 
     * @returns {LearningModelSession} 
     */
    CreateFromModelOnDevice(model, deviceToRunOn) {
        result := ComCall(7, this, "ptr", model, "ptr", deviceToRunOn, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModelSession(value)
    }
}
