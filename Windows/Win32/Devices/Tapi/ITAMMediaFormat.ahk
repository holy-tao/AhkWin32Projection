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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaFormat", "put_MediaFormat"]

    /**
     * 
     * @param {Pointer<Pointer<AM_MEDIA_TYPE>>} ppmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itammediaformat-get_mediaformat
     */
    get_MediaFormat(ppmt) {
        ppmtMarshal := ppmt is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppmtMarshal, ppmt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itammediaformat-put_mediaformat
     */
    put_MediaFormat(pmt) {
        result := ComCall(4, this, "ptr", pmt, "HRESULT")
        return result
    }
}
