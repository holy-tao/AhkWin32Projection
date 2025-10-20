#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFFaceDetectionTransformCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFFaceDetectionTransformCallback
     * @type {Guid}
     */
    static IID => Guid("{0bfd1ade-0421-4909-acb7-7a7125416881}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnFaceDetectionResult"]

    /**
     * 
     * @param {Integer} countOfBounds 
     * @param {Pointer<DetectedFaceBound>} detectedFaceBounds 
     * @returns {String} Nothing - always returns an empty string
     */
    OnFaceDetectionResult(countOfBounds, detectedFaceBounds) {
        ComCall(3, this, "uint", countOfBounds, "ptr", detectedFaceBounds)
    }
}
