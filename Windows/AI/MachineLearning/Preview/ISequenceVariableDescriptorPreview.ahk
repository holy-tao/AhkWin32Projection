#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ILearningModelVariableDescriptorPreview.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class ISequenceVariableDescriptorPreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISequenceVariableDescriptorPreview
     * @type {Guid}
     */
    static IID => Guid("{9cd8f292-98b2-4530-a1b6-2ded5fecbc26}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ElementType"]

    /**
     * @type {ILearningModelVariableDescriptorPreview} 
     */
    ElementType {
        get => this.get_ElementType()
    }

    /**
     * 
     * @returns {ILearningModelVariableDescriptorPreview} 
     */
    get_ElementType() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ILearningModelVariableDescriptorPreview(value)
    }
}
