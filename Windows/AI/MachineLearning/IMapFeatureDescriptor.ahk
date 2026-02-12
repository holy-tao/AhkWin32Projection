#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ILearningModelFeatureDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class IMapFeatureDescriptor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapFeatureDescriptor
     * @type {Guid}
     */
    static IID => Guid("{530424bd-a257-436d-9e60-c2981f7cc5c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyKind", "get_ValueDescriptor"]

    /**
     * @type {Integer} 
     */
    KeyKind {
        get => this.get_KeyKind()
    }

    /**
     * @type {ILearningModelFeatureDescriptor} 
     */
    ValueDescriptor {
        get => this.get_ValueDescriptor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ILearningModelFeatureDescriptor} 
     */
    get_ValueDescriptor() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ILearningModelFeatureDescriptor(value)
    }
}
