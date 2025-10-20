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
     * 
     * @param {Pointer<Int64>} ptStart 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    StartAt(ptStart, dwCookie) {
        result := ComCall(3, this, "int64*", ptStart, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} ptStop 
     * @param {BOOL} bSendExtra 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    StopAt(ptStop, bSendExtra, dwCookie) {
        result := ComCall(4, this, "int64*", ptStop, "int", bSendExtra, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_STREAM_INFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetInfo(pInfo) {
        result := ComCall(5, this, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
