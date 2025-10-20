#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Scans documents for text and properties (also called attributes).
 * @remarks
 * 
  * <b>IFilter</b> components for Indexing Service run in the Local Security context and should be written to manage buffers and to stack correctly. All string copies must have explicit checks to guard against buffer overruns. You should always verify the allocated size of the buffer and test the size of the data against the size of the buffer.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//filter/nn-filter-ifilter
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class IFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFilter
     * @type {Guid}
     */
    static IID => Guid("{89bcb740-6119-101a-bcb7-00dd010655af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "GetChunk", "GetText", "GetValue", "BindRegion"]

    /**
     * 
     * @param {Integer} grfFlags 
     * @param {Integer} cAttributes 
     * @param {Pointer<FULLPROPSPEC>} aAttributes 
     * @param {Pointer<Integer>} pFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/filter/nf-filter-ifilter-init
     */
    Init(grfFlags, cAttributes, aAttributes, pFlags) {
        result := ComCall(3, this, "uint", grfFlags, "uint", cAttributes, "ptr", aAttributes, "uint*", pFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<STAT_CHUNK>} pStat 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/filter/nf-filter-ifilter-getchunk
     */
    GetChunk(pStat) {
        result := ComCall(4, this, "ptr", pStat, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcwcBuffer 
     * @param {PWSTR} awcBuffer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/filter/nf-filter-ifilter-gettext
     */
    GetText(pcwcBuffer, awcBuffer) {
        awcBuffer := awcBuffer is String ? StrPtr(awcBuffer) : awcBuffer

        result := ComCall(5, this, "uint*", pcwcBuffer, "ptr", awcBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<PROPVARIANT>>} ppPropValue 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/filter/nf-filter-ifilter-getvalue
     */
    GetValue(ppPropValue) {
        result := ComCall(6, this, "ptr*", ppPropValue, "int")
        return result
    }

    /**
     * 
     * @param {FILTERREGION} origPos 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppunk 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/filter/nf-filter-ifilter-bindregion
     */
    BindRegion(origPos, riid, ppunk) {
        result := ComCall(7, this, "ptr", origPos, "ptr", riid, "ptr*", ppunk, "int")
        return result
    }
}
