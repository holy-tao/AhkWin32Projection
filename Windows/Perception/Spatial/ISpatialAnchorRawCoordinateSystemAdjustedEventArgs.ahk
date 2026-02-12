#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Matrix4x4.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialAnchorRawCoordinateSystemAdjustedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAnchorRawCoordinateSystemAdjustedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a1e81eb8-56c7-3117-a2e4-81e0fcf28e00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OldRawCoordinateSystemToNewRawCoordinateSystemTransform"]

    /**
     * @type {Matrix4x4} 
     */
    OldRawCoordinateSystemToNewRawCoordinateSystemTransform {
        get => this.get_OldRawCoordinateSystemToNewRawCoordinateSystemTransform()
    }

    /**
     * 
     * @returns {Matrix4x4} 
     */
    get_OldRawCoordinateSystemToNewRawCoordinateSystemTransform() {
        value := Matrix4x4()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
