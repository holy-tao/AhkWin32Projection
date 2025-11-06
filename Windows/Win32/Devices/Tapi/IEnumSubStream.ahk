#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITSubStream.ahk
#Include .\IEnumSubStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumSubStream interface provides COM-standard enumeration methods for the ITSubStream interface. The ITSubStreamControl::EnumerateSubStreams method returns a pointer to IEnumSubStream.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ienumsubstream
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumSubStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSubStream
     * @type {Guid}
     */
    static IID => Guid("{ee3bd609-3868-11d2-a045-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Reset", "Skip", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {ITSubStream} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumsubstream-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &ppElements := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ITSubStream(ppElements)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumsubstream-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumsubstream-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSubStream} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumsubstream-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSubStream(ppEnum)
    }
}
