#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SpatialInteractionSourceState.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteractionSourceEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionSourceEventArgs
     * @type {Guid}
     */
    static IID => Guid("{23b786cf-ec23-3979-b27c-eb0e12feb7c7}")

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
     * @type {SpatialInteractionSourceState} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {SpatialInteractionSourceState} 
     */
    get_State() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialInteractionSourceState(value)
    }
}
