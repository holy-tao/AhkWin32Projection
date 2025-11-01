#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enumerates component categories registered in the system.
 * @see https://docs.microsoft.com/windows/win32/api//comcat/nn-comcat-ienumcategoryinfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IEnumCATEGORYINFO extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumCATEGORYINFO
     * @type {Guid}
     */
    static IID => Guid("{0002e011-0000-0000-c000-000000000046}")

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
     * @param {Pointer<CATEGORYINFO>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-ienumcategoryinfo-next
     */
    Next(celt, rgelt, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", rgelt, "uint*", pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-ienumcategoryinfo-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-ienumcategoryinfo-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumCATEGORYINFO>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-ienumcategoryinfo-clone
     */
    Clone(ppenum) {
        result := ComCall(6, this, "ptr*", ppenum, "HRESULT")
        return result
    }
}
