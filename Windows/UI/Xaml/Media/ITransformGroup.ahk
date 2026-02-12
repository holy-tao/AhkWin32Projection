#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TransformCollection.ahk
#Include .\Matrix.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ITransformGroup extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransformGroup
     * @type {Guid}
     */
    static IID => Guid("{63418ccc-8d2d-4737-b951-2afce1ddc4c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Children", "put_Children", "get_Value"]

    /**
     * @type {TransformCollection} 
     */
    Children {
        get => this.get_Children()
        set => this.put_Children(value)
    }

    /**
     * @type {Matrix} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {TransformCollection} 
     */
    get_Children() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TransformCollection(value)
    }

    /**
     * 
     * @param {TransformCollection} value 
     * @returns {HRESULT} 
     */
    put_Children(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Matrix} 
     */
    get_Value() {
        value := Matrix()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
