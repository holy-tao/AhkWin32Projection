#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class ISceneBoundingBox extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneBoundingBox
     * @type {Guid}
     */
    static IID => Guid("{5d8ffc70-c618-4083-8251-9962593114aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Center", "get_Extents", "get_Max", "get_Min", "get_Size"]

    /**
     * @type {Vector3} 
     */
    Center {
        get => this.get_Center()
    }

    /**
     * @type {Vector3} 
     */
    Extents {
        get => this.get_Extents()
    }

    /**
     * @type {Vector3} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * @type {Vector3} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * @type {Vector3} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Center() {
        value := Vector3()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Extents() {
        value := Vector3()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Max() {
        value := Vector3()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Min() {
        value := Vector3()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Size() {
        value := Vector3()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
