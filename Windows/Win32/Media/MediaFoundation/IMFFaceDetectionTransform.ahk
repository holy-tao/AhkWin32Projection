#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFFaceDetectionTransform extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDetectionCallback", "ClearDetectionCallback"]

    /**
     * 
     * @param {IMFFaceDetectionTransformCallback} callback 
     * @returns {Pointer<Void>} 
     */
    SetDetectionCallback(callback) {
        result := ComCall(3, this, "ptr", callback, "ptr*", &callbackToken := 0, "HRESULT")
        return callbackToken
    }

    /**
     * 
     * @param {Pointer<Void>} callbackToken 
     * @returns {HRESULT} 
     */
    ClearDetectionCallback(callbackToken) {
        callbackTokenMarshal := callbackToken is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, callbackTokenMarshal, callbackToken, "HRESULT")
        return result
    }
}
