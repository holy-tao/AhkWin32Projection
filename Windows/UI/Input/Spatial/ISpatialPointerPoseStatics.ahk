#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SpatialPointerPose.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialPointerPoseStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialPointerPoseStatics
     * @type {Guid}
     */
    static IID => Guid("{a25591a9-aca1-3ee0-9816-785cfb2e3fb8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetAtTimestamp"]

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {PerceptionTimestamp} timestamp_ 
     * @returns {SpatialPointerPose} 
     */
    TryGetAtTimestamp(coordinateSystem, timestamp_) {
        result := ComCall(6, this, "ptr", coordinateSystem, "ptr", timestamp_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialPointerPose(value)
    }
}
