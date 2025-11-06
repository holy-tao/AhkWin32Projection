#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IWebGeolocation extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getCurrentPosition", "watchPosition", "clearWatch"]

    /**
     * 
     * @param {IDispatch} successCallback 
     * @param {IDispatch} errorCallback 
     * @param {IDispatch} options 
     * @returns {HRESULT} 
     */
    getCurrentPosition(successCallback, errorCallback, options) {
        result := ComCall(7, this, "ptr", successCallback, "ptr", errorCallback, "ptr", options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} successCallback 
     * @param {IDispatch} errorCallback 
     * @param {IDispatch} options 
     * @returns {Integer} 
     */
    watchPosition(successCallback, errorCallback, options) {
        result := ComCall(8, this, "ptr", successCallback, "ptr", errorCallback, "ptr", options, "int*", &watchId := 0, "HRESULT")
        return watchId
    }

    /**
     * 
     * @param {Integer} watchId 
     * @returns {HRESULT} 
     */
    clearWatch(watchId) {
        result := ComCall(9, this, "int", watchId, "HRESULT")
        return result
    }
}
