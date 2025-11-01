#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables clients to enumerate through a collection of class IDs for COM classes.
 * @remarks
 * 
  * Alternate names for this interface are <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd542667(v=vs.85)">IEnumCLSID</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd542661(v=vs.85)">IEnumCATID</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//comcat/nn-comcat-ienumguid
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IEnumGUID extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumGUID
     * @type {Guid}
     */
    static IID => Guid("{0002e000-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Guid>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-ienumguid-next
     */
    Next(celt, rgelt, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", rgelt, "uint*", pceltFetched, "int")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-ienumguid-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-ienumguid-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumGUID>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-ienumguid-clone
     */
    Clone(ppenum) {
        result := ComCall(6, this, "ptr*", ppenum, "HRESULT")
        return result
    }
}
