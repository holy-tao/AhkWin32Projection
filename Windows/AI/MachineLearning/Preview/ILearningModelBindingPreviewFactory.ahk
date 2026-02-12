#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\LearningModelBindingPreview.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class ILearningModelBindingPreviewFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelBindingPreviewFactory
     * @type {Guid}
     */
    static IID => Guid("{48b8219f-1e51-4d77-ae50-3ec164ad3480}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromModel"]

    /**
     * 
     * @param {LearningModelPreview} model 
     * @returns {LearningModelBindingPreview} 
     */
    CreateFromModel(model) {
        result := ComCall(6, this, "ptr", model, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModelBindingPreview(value)
    }
}
