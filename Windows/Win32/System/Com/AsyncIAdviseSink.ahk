#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class AsyncIAdviseSink extends IUnknown{
    /**
     * The interface identifier for AsyncIAdviseSink
     * @type {Guid}
     */
    static IID => Guid("{00000150-0000-0000-c000-000000000046}")

    /**
     * The class identifier for AsyncIAdviseSink
     * @type {Guid}
     */
    static CLSID => Guid("{00000150-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<FORMATETC>} pFormatetc 
     * @param {Pointer<STGMEDIUM>} pStgmed 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnDataChange(pFormatetc, pStgmed) {
        ComCall(3, this, "ptr", pFormatetc, "ptr", pStgmed)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnDataChange() {
        ComCall(4, this)
        return result
    }

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {Integer} lindex 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnViewChange(dwAspect, lindex) {
        ComCall(5, this, "uint", dwAspect, "int", lindex)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnViewChange() {
        ComCall(6, this)
        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pmk 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnRename(pmk) {
        ComCall(7, this, "ptr", pmk)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnRename() {
        ComCall(8, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnSave() {
        ComCall(9, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnSave() {
        ComCall(10, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnClose() {
        ComCall(11, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnClose() {
        ComCall(12, this)
        return result
    }
}
