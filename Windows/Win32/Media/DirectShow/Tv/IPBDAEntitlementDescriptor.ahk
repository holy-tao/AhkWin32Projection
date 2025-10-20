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
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetLength(pwVal) {
        result := ComCall(4, this, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ppbTokenBuffer 
     * @param {Pointer<UInt32>} pdwTokenLength 
     * @returns {HRESULT} 
     */
    GetToken(ppbTokenBuffer, pdwTokenLength) {
        result := ComCall(5, this, "char*", ppbTokenBuffer, "uint*", pdwTokenLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
