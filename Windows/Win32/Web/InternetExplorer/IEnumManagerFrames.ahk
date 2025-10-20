#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IEnumManagerFrames extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumManagerFrames
     * @type {Guid}
     */
    static IID => Guid("{3caa826a-9b1f-4a79-bc81-f0430ded1648}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Count", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Pointer<HWND>>} ppWindows 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, ppWindows, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr*", ppWindows, "uint*", pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcelt 
     * @returns {HRESULT} 
     */
    Count(pcelt) {
        result := ComCall(4, this, "uint*", pcelt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumManagerFrames>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(7, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
