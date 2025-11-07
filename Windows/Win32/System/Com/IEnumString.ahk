#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumString.ahk
#Include .\IUnknown.ahk

/**
 * Enumerate strings. LPWSTR is the type that indicates a pointer to a zero-terminated string of wide, or Unicode, characters.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ienumstring
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IEnumString extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumString
     * @type {Guid}
     */
    static IID => Guid("{00000101-0000-0000-c000-000000000046}")

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
     * @param {Pointer<PWSTR>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumstring-next
     */
    Next(celt, rgelt, pceltFetched) {
        rgeltMarshal := rgelt is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, rgeltMarshal, rgelt, pceltFetchedMarshal, pceltFetched, "int")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumstring-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumstring-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumString} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumstring-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumString(ppenum)
    }
}
