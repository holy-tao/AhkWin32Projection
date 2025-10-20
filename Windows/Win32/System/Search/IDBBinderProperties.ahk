#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDBProperties.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDBBinderProperties extends IDBProperties{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDBBinderProperties
     * @type {Guid}
     */
    static IID => Guid("{0c733ab3-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
