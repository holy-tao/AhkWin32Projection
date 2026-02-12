#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include .\ManipulationDelta.ahk
#Include .\ManipulationVelocities.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IManipulationCompletedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IManipulationCompletedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{b34ab22b-d19b-46ff-9f38-dec7754bb9e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PointerDeviceType", "get_Position", "get_Cumulative", "get_Velocities"]

    /**
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {ManipulationDelta} 
     */
    Cumulative {
        get => this.get_Cumulative()
    }

    /**
     * @type {ManipulationVelocities} 
     */
    Velocities {
        get => this.get_Velocities()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerDeviceType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        value := POINT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Cumulative() {
        value := ManipulationDelta()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ManipulationVelocities} 
     */
    get_Velocities() {
        value := ManipulationVelocities()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
