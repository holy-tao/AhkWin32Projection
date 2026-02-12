#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SpatialPointerInteractionSourcePose.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialPointerPose2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialPointerPose2
     * @type {Guid}
     */
    static IID => Guid("{9d202b17-954e-4e0c-96d1-b6790b6fc2fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetInteractionSourcePose"]

    /**
     * 
     * @param {SpatialInteractionSource} source 
     * @returns {SpatialPointerInteractionSourcePose} 
     */
    TryGetInteractionSourcePose(source) {
        result := ComCall(6, this, "ptr", source, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialPointerInteractionSourcePose(value)
    }
}
