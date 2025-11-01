#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMStreamControl interface controls individual streams on a filter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamstreamcontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMStreamControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMStreamControl
     * @type {Guid}
     */
    static IID => Guid("{36b73881-c2c8-11cf-8b46-00805f6cef60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartAt", "StopAt", "GetInfo"]

    /**
     * 
     * @param {Pointer<Integer>} ptStart 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamstreamcontrol-startat
     */
    StartAt(ptStart, dwCookie) {
        result := ComCall(3, this, "int64*", ptStart, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ptStop 
     * @param {BOOL} bSendExtra 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamstreamcontrol-stopat
     */
    StopAt(ptStop, bSendExtra, dwCookie) {
        result := ComCall(4, this, "int64*", ptStop, "int", bSendExtra, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AM_STREAM_INFO>} pInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamstreamcontrol-getinfo
     */
    GetInfo(pInfo) {
        result := ComCall(5, this, "ptr", pInfo, "HRESULT")
        return result
    }
}
