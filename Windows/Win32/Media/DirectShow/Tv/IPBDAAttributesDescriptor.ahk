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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetAttributePayload"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdaattributesdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdaattributesdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppbAttributeBuffer 
     * @param {Pointer<Integer>} pdwAttributeLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdaattributesdescriptor-getattributepayload
     */
    GetAttributePayload(ppbAttributeBuffer, pdwAttributeLength) {
        ppbAttributeBufferMarshal := ppbAttributeBuffer is VarRef ? "ptr*" : "ptr"
        pdwAttributeLengthMarshal := pdwAttributeLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, ppbAttributeBufferMarshal, ppbAttributeBuffer, pdwAttributeLengthMarshal, pdwAttributeLength, "HRESULT")
        return result
    }
}
