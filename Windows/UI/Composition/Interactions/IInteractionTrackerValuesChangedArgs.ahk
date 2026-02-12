#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionTrackerValuesChangedArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionTrackerValuesChangedArgs
     * @type {Guid}
     */
    static IID => Guid("{cf1578ef-d3df-4501-b9e6-f02fb22f73d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Position", "get_RequestId", "get_Scale"]

    /**
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {Integer} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * @type {Float} 
     */
    Scale {
        get => this.get_Scale()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        value := Vector3()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestId() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Scale() {
        result := ComCall(8, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
