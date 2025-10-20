#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables containers and other objects to receive notifications of data changes, view changes, and compound-document changes occurring in objects of interest.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iadvisesink
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAdviseSink extends IUnknown{
    /**
     * The interface identifier for IAdviseSink
     * @type {Guid}
     */
    static IID => Guid("{0000010f-0000-0000-c000-000000000046}")

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
    OnDataChange(pFormatetc, pStgmed) {
        ComCall(3, this, "ptr", pFormatetc, "ptr", pStgmed)
        return result
    }

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {Integer} lindex 
     * @returns {String} Nothing - always returns an empty string
     */
    OnViewChange(dwAspect, lindex) {
        ComCall(4, this, "uint", dwAspect, "int", lindex)
        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pmk 
     * @returns {String} Nothing - always returns an empty string
     */
    OnRename(pmk) {
        ComCall(5, this, "ptr", pmk)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnSave() {
        ComCall(6, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnClose() {
        ComCall(7, this)
        return result
    }
}
