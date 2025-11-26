#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that retrieve data from the entitlement descriptor in a Protected Broadcast Driver Architecture (PBDA) transport stream.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-ipbdaentitlementdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPBDAEntitlementDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPBDAEntitlementDescriptor
     * @type {Guid}
     */
    static IID => Guid("{22632497-0de3-4587-aadc-d8d99017e760}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetToken"]

    /**
     * Gets the tag that uniquely identifies an entitlement descriptor in a Protected Broadcast Driver Architecture (PBDA) transport stream.
     * @returns {Integer} Receives the tag value. For PBDA entitlement descriptors, this value is 0x80.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbdaentitlementdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of the entitlement descriptor in a Protected Broadcast Driver Architecture (PBDA) transport stream, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbdaentitlementdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the entitlement token from the entitlement descriptor in a Protected Broadcast Driver Architecture (PBDA) transport stream.
     * @param {Pointer<Pointer<Integer>>} ppbTokenBuffer Pointer to a buffer that receives the entitlement token. The caller must free this memory after use.
     * @param {Pointer<Integer>} pdwTokenLength Receives the entitlement token length.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbdaentitlementdescriptor-gettoken
     */
    GetToken(ppbTokenBuffer, pdwTokenLength) {
        ppbTokenBufferMarshal := ppbTokenBuffer is VarRef ? "ptr*" : "ptr"
        pdwTokenLengthMarshal := pdwTokenLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, ppbTokenBufferMarshal, ppbTokenBuffer, pdwTokenLengthMarshal, pdwTokenLength, "HRESULT")
        return result
    }
}
