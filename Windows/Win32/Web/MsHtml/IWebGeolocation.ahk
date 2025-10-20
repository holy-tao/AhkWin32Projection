#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IWebGeolocation extends IDispatch{
    /**
     * The interface identifier for IWebGeolocation
     * @type {Guid}
     */
    static IID => Guid("{305107c5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for WebGeolocation
     * @type {Guid}
     */
    static CLSID => Guid("{305107c6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IDispatch>} successCallback 
     * @param {Pointer<IDispatch>} errorCallback 
     * @param {Pointer<IDispatch>} options 
     * @returns {HRESULT} 
     */
    getCurrentPosition(successCallback, errorCallback, options) {
        result := ComCall(7, this, "ptr", successCallback, "ptr", errorCallback, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} successCallback 
     * @param {Pointer<IDispatch>} errorCallback 
     * @param {Pointer<IDispatch>} options 
     * @param {Pointer<Int32>} watchId 
     * @returns {HRESULT} 
     */
    watchPosition(successCallback, errorCallback, options, watchId) {
        result := ComCall(8, this, "ptr", successCallback, "ptr", errorCallback, "ptr", options, "int*", watchId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} watchId 
     * @returns {HRESULT} 
     */
    clearWatch(watchId) {
        result := ComCall(9, this, "int", watchId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
