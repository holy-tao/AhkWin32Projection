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
     * @type {Integer} 
     */
    MediaTypes {
        get => this.get_MediaTypes()
    }

    /**
     * The get_MediaTypes method gets the media type or types supported on the current address.
     * @returns {Integer} Pointer to bitmask of ORed of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media type</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itmediasupport-get_mediatypes
     */
    get_MediaTypes() {
        result := ComCall(7, this, "int*", &plMediaTypes := 0, "HRESULT")
        return plMediaTypes
    }

    /**
     * The QueryMediaType method indicates whether the service provider associated with the current address supports the media type or types indicated by lMediaType.
     * @param {Integer} lMediaType <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">Media type</a> or types being queried.
     * @returns {VARIANT_BOOL} Pointer to a VARIANT_BOOL indicating whether the media type is supported. If the returned value is VARIANT_TRUE, the media is supported; if it is VARIANT_FALSE, the media is not supported.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itmediasupport-querymediatype
     */
    QueryMediaType(lMediaType) {
        result := ComCall(8, this, "int", lMediaType, "short*", &pfSupport := 0, "HRESULT")
        return pfSupport
    }
}
