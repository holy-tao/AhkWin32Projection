#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class IHeadPose extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHeadPose
     * @type {Guid}
     */
    static IID => Guid("{7f5ac5a5-49db-379f-9429-32a2faf34fa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Position", "get_ForwardDirection", "get_UpDirection"]

    /**
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {Vector3} 
     */
    ForwardDirection {
        get => this.get_ForwardDirection()
    }

    /**
     * @type {Vector3} 
     */
    UpDirection {
        get => this.get_UpDirection()
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
     * @returns {Vector3} 
     */
    get_ForwardDirection() {
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
    get_UpDirection() {
        value := Vector3()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
