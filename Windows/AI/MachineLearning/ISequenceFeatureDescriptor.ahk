#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ILearningModelFeatureDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ISequenceFeatureDescriptor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISequenceFeatureDescriptor
     * @type {Guid}
     */
    static IID => Guid("{84f6945a-562b-4d62-a851-739aced96668}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ElementDescriptor"]

    /**
     * @type {ILearningModelFeatureDescriptor} 
     */
    ElementDescriptor {
        get => this.get_ElementDescriptor()
    }

    /**
     * 
     * @returns {ILearningModelFeatureDescriptor} 
     */
    get_ElementDescriptor() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ILearningModelFeatureDescriptor(value)
    }
}
