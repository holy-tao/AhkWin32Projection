#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CameraIntrinsics.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class ICameraIntrinsicsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICameraIntrinsicsFactory
     * @type {Guid}
     */
    static IID => Guid("{c0ddc486-2132-4a34-a659-9bfe2a055712}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {Vector2} focalLength 
     * @param {Vector2} principalPoint 
     * @param {Vector3} radialDistortion 
     * @param {Vector2} tangentialDistortion 
     * @param {Integer} imageWidth 
     * @param {Integer} imageHeight 
     * @returns {CameraIntrinsics} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(focalLength, principalPoint, radialDistortion, tangentialDistortion, imageWidth, imageHeight) {
        result := ComCall(6, this, "ptr", focalLength, "ptr", principalPoint, "ptr", radialDistortion, "ptr", tangentialDistortion, "uint", imageWidth, "uint", imageHeight, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CameraIntrinsics(result_)
    }
}
