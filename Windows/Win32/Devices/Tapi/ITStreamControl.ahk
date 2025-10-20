#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} lMediaType 
     * @param {Integer} td 
     * @param {Pointer<ITStream>} ppStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstreamcontrol-createstream
     */
    CreateStream(lMediaType, td, ppStream) {
        result := ComCall(7, this, "int", lMediaType, "int", td, "ptr*", ppStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITStream} pStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstreamcontrol-removestream
     */
    RemoveStream(pStream) {
        result := ComCall(8, this, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumStream>} ppEnumStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstreamcontrol-enumeratestreams
     */
    EnumerateStreams(ppEnumStream) {
        result := ComCall(9, this, "ptr*", ppEnumStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstreamcontrol-get_streams
     */
    get_Streams(pVariant) {
        result := ComCall(10, this, "ptr", pVariant, "HRESULT")
        return result
    }
}
