#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IEnumCodePage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumCodePage
     * @type {Guid}
     */
    static IID => Guid("{275c23e3-3747-11d0-9fea-00aa003f8646}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "Next", "Reset", "Skip"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Clone() {
        static ppEnum := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<MIMECPINFO>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, rgelt, pceltFetched) {
        result := ComCall(4, this, "uint", celt, "ptr", rgelt, "uint*", pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(6, this, "uint", celt, "HRESULT")
        return result
    }
}
