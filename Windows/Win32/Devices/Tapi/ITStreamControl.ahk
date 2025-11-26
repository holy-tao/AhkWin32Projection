#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITStream.ahk
#Include .\IEnumStream.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITStreamControl interface represents the media streaming features of a call and exposes methods that allow an application to enumerate, create, or remove streams.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itstreamcontrol
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITStreamControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITStreamControl
     * @type {Guid}
     */
    static IID => Guid("{ee3bd604-3868-11d2-a045-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateStream", "RemoveStream", "EnumerateStreams", "get_Streams"]

    /**
     * @type {VARIANT} 
     */
    Streams {
        get => this.get_Streams()
    }

    /**
     * The CreateStream method creates a new media stream.
     * @param {Integer} lMediaType Indicates 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media type</a> for stream.
     * @param {Integer} td Indicates the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a>.
     * @returns {ITStream} Pointer to pointer for newly created 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstreamcontrol-createstream
     */
    CreateStream(lMediaType, td) {
        result := ComCall(7, this, "int", lMediaType, "int", td, "ptr*", &ppStream := 0, "HRESULT")
        return ITStream(ppStream)
    }

    /**
     * The RemoveStream method removes a media stream.
     * @param {ITStream} pStream Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pStream</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstreamcontrol-removestream
     */
    RemoveStream(pStream) {
        result := ComCall(8, this, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * The EnumerateStreams method enumerates currently available media streams. Provided for C and C++ applications. Automation client applications such as Visual Basic must use the get_Streams method.
     * @returns {IEnumStream} Pointer to pointer for 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumstream">IEnumStream</a> enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstreamcontrol-enumeratestreams
     */
    EnumerateStreams() {
        result := ComCall(9, this, "ptr*", &ppEnumStream := 0, "HRESULT")
        return IEnumStream(ppEnumStream)
    }

    /**
     * The get_Streams method creates a collection of media streams currently available on the call. Provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateStreams method.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itstreamcontrol-get_streams
     */
    get_Streams() {
        pVariant := VARIANT()
        result := ComCall(10, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }
}
