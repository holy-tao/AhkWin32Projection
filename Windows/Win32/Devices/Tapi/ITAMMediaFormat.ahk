#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITAMMediaFormat interface sets and gets DirectShow media format.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3ds/nn-tapi3ds-itammediaformat
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAMMediaFormat extends IUnknown{
    /**
     * The interface identifier for ITAMMediaFormat
     * @type {Guid}
     */
    static IID => Guid("{0364eb00-4a77-11d1-a671-006097c9a2e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} ppmt 
     * @returns {HRESULT} 
     */
    get_MediaFormat(ppmt) {
        result := ComCall(3, this, "ptr", ppmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    put_MediaFormat(pmt) {
        result := ComCall(4, this, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
