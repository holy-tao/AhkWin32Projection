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
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdaentitlementdescriptor-gettag
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdaentitlementdescriptor-getlength
     */
    GetLength(pwVal) {
        result := ComCall(4, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppbTokenBuffer 
     * @param {Pointer<Integer>} pdwTokenLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdaentitlementdescriptor-gettoken
     */
    GetToken(ppbTokenBuffer, pdwTokenLength) {
        result := ComCall(5, this, "ptr*", ppbTokenBuffer, "uint*", pdwTokenLength, "HRESULT")
        return result
    }
}
