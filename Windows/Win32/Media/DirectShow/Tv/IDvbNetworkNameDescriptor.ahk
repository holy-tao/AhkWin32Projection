#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) network name descriptor. The network name descriptor gets text format information about the network that originated the broadcast.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbnetworknamedescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbNetworkNameDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbNetworkNameDescriptor
     * @type {Guid}
     */
    static IID => Guid("{5b2a80cf-35b9-446c-b3e4-048b761dbc51}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetNetworkName", "GetNetworkNameW"]

    /**
     * Gets the tag that identifies a Digital Video Broadcast (DVB) network name descriptor.
     * @returns {Integer} Receives the identifier tag. For DVB network name descriptors, this value is "0x40".
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbnetworknamedescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) network name descriptor.
     * @returns {Integer} Receives the descriptor length, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbnetworknamedescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the network name, in ASCII string format, from a Digital Video Broadcast (DVB) network name descriptor.
     * @returns {Pointer<Integer>} Pointer to a buffer that receives the network name. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbnetworknamedescriptor-getnetworkname
     */
    GetNetworkName() {
        result := ComCall(5, this, "ptr*", &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * Gets the network name, in Unicode string format, from a Digital Video Broadcast (DVB) network name descriptor.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to a string buffer that receives the network name. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbnetworknamedescriptor-getnetworknamew
     */
    GetNetworkNameW(convMode) {
        pbstrName := BSTR()
        result := ComCall(6, this, "int", convMode, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }
}
