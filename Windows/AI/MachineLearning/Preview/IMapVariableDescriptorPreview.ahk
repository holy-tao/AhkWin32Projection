#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\ILearningModelVariableDescriptorPreview.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class IMapVariableDescriptorPreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapVariableDescriptorPreview
     * @type {Guid}
     */
    static IID => Guid("{3cb38370-c02b-4236-b3e8-6bdca49c3129}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyKind", "get_ValidStringKeys", "get_ValidIntegerKeys", "get_Fields"]

    /**
     * @type {Integer} 
     */
    KeyKind {
        get => this.get_KeyKind()
    }

    /**
     * @type {IIterable<HSTRING>} 
     */
    ValidStringKeys {
        get => this.get_ValidStringKeys()
    }

    /**
     * @type {IIterable<Integer>} 
     */
    ValidIntegerKeys {
        get => this.get_ValidIntegerKeys()
    }

    /**
     * @type {ILearningModelVariableDescriptorPreview} 
     */
    Fields {
        get => this.get_Fields()
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
     * @returns {IIterable<HSTRING>} 
     */
    get_ValidStringKeys() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IIterable<Integer>} 
     */
    get_ValidIntegerKeys() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable((ptr) => IPropertyValue(ptr).GetInt64(), value)
    }

    /**
     * 
     * @returns {ILearningModelVariableDescriptorPreview} 
     */
    get_Fields() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ILearningModelVariableDescriptorPreview(value)
    }
}
