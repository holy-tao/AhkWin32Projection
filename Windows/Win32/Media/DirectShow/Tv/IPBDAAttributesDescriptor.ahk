#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from anattributes descriptor in a Protected Broadcast Device Architecture (PBDA) transport stream.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-ipbdaattributesdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPBDAAttributesDescriptor extends IUnknown{
    /**
     * The interface identifier for IPBDAAttributesDescriptor
     * @type {Guid}
     */
    static IID => Guid("{313b3620-3263-45a6-9533-968befbeac03}")

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
     * @param {Pointer<Byte>} ppbAttributeBuffer 
     * @param {Pointer<UInt32>} pdwAttributeLength 
     * @returns {HRESULT} 
     */
    GetAttributePayload(ppbAttributeBuffer, pdwAttributeLength) {
        result := ComCall(5, this, "char*", ppbAttributeBuffer, "uint*", pdwAttributeLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
