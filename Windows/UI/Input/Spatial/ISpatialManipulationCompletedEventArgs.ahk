#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SpatialManipulationDelta.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialManipulationCompletedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialManipulationCompletedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{05086802-f301-4343-9250-2fbaa5f87a37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InteractionSourceKind", "TryGetCumulativeDelta"]

    /**
     * @type {Integer} 
     */
    InteractionSourceKind {
        get => this.get_InteractionSourceKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InteractionSourceKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @returns {SpatialManipulationDelta} 
     */
    TryGetCumulativeDelta(coordinateSystem) {
        result := ComCall(7, this, "ptr", coordinateSystem, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialManipulationDelta(value)
    }
}
