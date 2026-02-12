#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CameraOcclusionState.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ICameraOcclusionStateChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICameraOcclusionStateChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{8512d848-c0de-57ca-a1ca-fb2c3d23df55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_State"]

    /**
     * @type {CameraOcclusionState} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {CameraOcclusionState} 
     */
    get_State() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CameraOcclusionState(value)
    }
}
