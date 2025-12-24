#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from the default authority descriptor for a content reference identifier (CRID). The default authority descriptor is the first part of the CRID and identifies the body that created the CRID.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbdefaultauthoritydescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbDefaultAuthorityDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbDefaultAuthorityDescriptor
     * @type {Guid}
     */
    static IID => Guid("{05ec24d1-3a31-44e7-b408-67c60a352276}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetDefaultAuthority"]

    /**
     * Gets the tag from the default authority descriptor for a Digital Video Broadcast (DVB) content reference identifier (CRID).
     * @returns {Integer} Receives the content descriptor tag. For default authority descriptors, this tag value is "0x73".
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbdefaultauthoritydescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a default authority descriptor from a Digital Video Broadcast (DVB) content reference identifier (CRID).
     * @returns {Integer} Receives the number of bytes in the descriptor.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbdefaultauthoritydescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the string identifying the default authority from a Digital Video Broadcast (DVB) content reference identifier (CRID).
     * @param {Pointer<Integer>} pbLength Receives the length of the default authority string in bytes.
     * @param {Pointer<Pointer<Integer>>} ppbBytes Pointer to a buffer that receives the default authority string. The caller is responsible for releasing this memory.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbdefaultauthoritydescriptor-getdefaultauthority
     */
    GetDefaultAuthority(pbLength, ppbBytes) {
        pbLengthMarshal := pbLength is VarRef ? "char*" : "ptr"
        ppbBytesMarshal := ppbBytes is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pbLengthMarshal, pbLength, ppbBytesMarshal, ppbBytes, "HRESULT")
        return result
    }
}
