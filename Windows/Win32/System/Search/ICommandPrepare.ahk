#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommandPrepare extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandPrepare
     * @type {Guid}
     */
    static IID => Guid("{0c733a26-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Prepare", "Unprepare"]

    /**
     * 
     * @param {Integer} cExpectedRuns 
     * @returns {HRESULT} 
     */
    Prepare(cExpectedRuns) {
        result := ComCall(3, this, "uint", cExpectedRuns, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unprepare() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
