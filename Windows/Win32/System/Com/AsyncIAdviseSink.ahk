#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class AsyncIAdviseSink extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_OnDataChange", "Finish_OnDataChange", "Begin_OnViewChange", "Finish_OnViewChange", "Begin_OnRename", "Finish_OnRename", "Begin_OnSave", "Finish_OnSave", "Begin_OnClose", "Finish_OnClose"]

    /**
     * 
     * @param {Pointer<FORMATETC>} pFormatetc 
     * @param {Pointer<STGMEDIUM>} pStgmed 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnDataChange(pFormatetc, pStgmed) {
        ComCall(3, this, "ptr", pFormatetc, "ptr", pStgmed)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnDataChange() {
        ComCall(4, this)
    }

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {Integer} lindex 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnViewChange(dwAspect, lindex) {
        ComCall(5, this, "uint", dwAspect, "int", lindex)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnViewChange() {
        ComCall(6, this)
    }

    /**
     * 
     * @param {IMoniker} pmk 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnRename(pmk) {
        ComCall(7, this, "ptr", pmk)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnRename() {
        ComCall(8, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnSave() {
        ComCall(9, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnSave() {
        ComCall(10, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnClose() {
        ComCall(11, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnClose() {
        ComCall(12, this)
    }
}
