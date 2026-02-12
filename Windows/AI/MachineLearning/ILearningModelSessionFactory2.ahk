#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LearningModelSession.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelSessionFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelSessionFactory2
     * @type {Guid}
     */
    static IID => Guid("{4e5c88bf-0a1f-5fec-ade0-2fd91e4ef29b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromModelOnDeviceWithSessionOptions"]

    /**
     * 
     * @param {LearningModel} model 
     * @param {LearningModelDevice} deviceToRunOn 
     * @param {LearningModelSessionOptions} learningModelSessionOptions_ 
     * @returns {LearningModelSession} 
     */
    CreateFromModelOnDeviceWithSessionOptions(model, deviceToRunOn, learningModelSessionOptions_) {
        result := ComCall(6, this, "ptr", model, "ptr", deviceToRunOn, "ptr", learningModelSessionOptions_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModelSession(value)
    }
}
