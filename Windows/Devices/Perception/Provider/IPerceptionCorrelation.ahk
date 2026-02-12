#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\..\Foundation\Numerics\Quaternion.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class IPerceptionCorrelation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionCorrelation
     * @type {Guid}
     */
    static IID => Guid("{b4131a82-dff5-4047-8a19-3b4d805f7176}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetId", "get_Position", "get_Orientation"]

    /**
     * @type {HSTRING} 
     */
    TargetId {
        get => this.get_TargetId()
    }

    /**
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {Quaternion} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetId() {
        value := HSTRING()
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
    get_Position() {
        value := Vector3()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_Orientation() {
        value := Quaternion()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
