#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFFaceDetectionTransform extends IUnknown{
    /**
     * The interface identifier for IMFFaceDetectionTransform
     * @type {Guid}
     */
    static IID => Guid("{ddd59578-d0e7-46e2-be8c-1ce76ad147c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFFaceDetectionTransformCallback>} callback 
     * @param {Pointer<Void>} callbackToken 
     * @returns {HRESULT} 
     */
    SetDetectionCallback(callback, callbackToken) {
        result := ComCall(3, this, "ptr", callback, "ptr", callbackToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} callbackToken 
     * @returns {HRESULT} 
     */
    ClearDetectionCallback(callbackToken) {
        result := ComCall(4, this, "ptr", callbackToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
