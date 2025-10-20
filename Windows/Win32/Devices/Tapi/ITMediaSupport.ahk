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
     * 
     * @param {Pointer<Int32>} plMediaTypes 
     * @returns {HRESULT} 
     */
    get_MediaTypes(plMediaTypes) {
        result := ComCall(7, this, "int*", plMediaTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @param {Pointer<VARIANT_BOOL>} pfSupport 
     * @returns {HRESULT} 
     */
    QueryMediaType(lMediaType, pfSupport) {
        result := ComCall(8, this, "int", lMediaType, "ptr", pfSupport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
