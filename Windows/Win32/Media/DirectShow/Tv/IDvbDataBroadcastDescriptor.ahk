#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) data broadcast descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbdatabroadcastdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbDataBroadcastDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbDataBroadcastDescriptor
     * @type {Guid}
     */
    static IID => Guid("{d1ebc1d6-8b60-4c20-9caf-e59382e7c400}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetDataBroadcastID", "GetComponentTag", "GetSelectorLength", "GetSelectorBytes", "GetLangID", "GetTextLength", "GetText"]

    /**
     * Gets the tag that identifies a Digital Video Broadcast (DVB) data broadcast descriptor.
     * @returns {Integer} Receives the descriptor tag. For data broadcast descriptors, this value is 0x64.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of a Digital Video Broadcast (DVB) data broadcast descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the identifier that identifies the network broadcast from a Digital Video Broadcast (DVB) data broadcast descriptor.
     * @returns {Integer} Receives the broadcaster ID.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getdatabroadcastid
     */
    GetDataBroadcastID() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the component tag from a Digital Video Broadcast (DVB) data broadcast descriptor. The component tag identifies a compoment stream within the service.
     * @returns {Integer} Receives the component tag.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getcomponenttag
     */
    GetComponentTag() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of the selector in a DVB data broadcast descriptor, in bytes. The selector is defined by the data broadcast specification for the network.
     * @returns {Integer} Receives the selector length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getselectorlength
     */
    GetSelectorLength() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the data from the selector in a Digital Video Broadcast (DVB) data broadcast descriptor. The selector is defined by the broadcast standard for the network.
     * @param {Pointer<Integer>} pbLen On input, specifies the size of the buffer (pointed to by the <i>pbVal</i> parameter) allocated for the selector data, in bytes. On output, gets the actual length of the selector data.
     * @returns {Integer} Receives the selector bytes.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getselectorbytes
     */
    GetSelectorBytes(pbLen) {
        pbLenMarshal := pbLen is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pbLenMarshal, pbLen, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from a Digital Video Broadcast (DVB) data broadcast descriptor. This language code identifies the language used for the text description field.
     * @returns {Integer} Receives the language code. For a list of language codes, refer to the <a href="http://www-01.sil.org/iso639-3/codes.asp">ISO 639 Code Tables</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getlangid
     */
    GetLangID() {
        result := ComCall(9, this, "uint*", &pulVal := 0, "HRESULT")
        return pulVal
    }

    /**
     * Gets length of the text description, in bytes, from a Digital Video Broadcast (DVB) data broadcast descriptor.
     * @returns {Integer} Receives the text description length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-gettextlength
     */
    GetTextLength() {
        result := ComCall(10, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the text that describes the data from a Digital Video Broadcast (DVB) data broadcast descriptor.
     * @param {Pointer<Integer>} pbLen Specifies or receives the length of the
     * description, in bytes.
     * @returns {Integer} Receives the description text.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-gettext
     */
    GetText(pbLen) {
        pbLenMarshal := pbLen is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, pbLenMarshal, pbLen, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }
}
