#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class ITensorVariableDescriptorPreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITensorVariableDescriptorPreview
     * @type {Guid}
     */
    static IID => Guid("{a80f501a-9aac-4233-9784-aceaf92510b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataType", "get_Shape"]

    /**
     * @type {Integer} 
     */
    DataType {
        get => this.get_DataType()
    }

    /**
     * @type {IIterable<Integer>} 
     */
    Shape {
        get => this.get_Shape()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IIterable<Integer>} 
     */
    get_Shape() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable((ptr) => IPropertyValue(ptr).GetInt64(), value)
    }
}
