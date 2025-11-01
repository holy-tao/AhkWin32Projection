#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITMediaSupport interface provides methods that allow an application to discover the media support capabilities for an Address Object that exposes this interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itmediasupport
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITMediaSupport extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITMediaSupport
     * @type {Guid}
     */
    static IID => Guid("{b1efc384-9355-11d0-835c-00aa003ccabd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaTypes", "QueryMediaType"]

    /**
     * 
     * @param {Pointer<Integer>} plMediaTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediasupport-get_mediatypes
     */
    get_MediaTypes(plMediaTypes) {
        plMediaTypesMarshal := plMediaTypes is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plMediaTypesMarshal, plMediaTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @param {Pointer<VARIANT_BOOL>} pfSupport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediasupport-querymediatype
     */
    QueryMediaType(lMediaType, pfSupport) {
        result := ComCall(8, this, "int", lMediaType, "ptr", pfSupport, "HRESULT")
        return result
    }
}
