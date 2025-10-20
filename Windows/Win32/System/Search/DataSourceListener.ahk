#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DataSourceListener extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DataSourceListener
     * @type {Guid}
     */
    static IID => Guid("{7c0ffab2-cd84-11d0-949a-00a0c91110ed}")

    /**
     * The class identifier for DataSourceListener
     * @type {Guid}
     */
    static CLSID => Guid("{7c0ffab2-cd84-11d0-949a-00a0c91110ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["dataMemberChanged", "dataMemberAdded", "dataMemberRemoved"]

    /**
     * 
     * @param {Pointer<Integer>} bstrDM 
     * @returns {HRESULT} 
     */
    dataMemberChanged(bstrDM) {
        result := ComCall(3, this, "ushort*", bstrDM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} bstrDM 
     * @returns {HRESULT} 
     */
    dataMemberAdded(bstrDM) {
        result := ComCall(4, this, "ushort*", bstrDM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} bstrDM 
     * @returns {HRESULT} 
     */
    dataMemberRemoved(bstrDM) {
        result := ComCall(5, this, "ushort*", bstrDM, "HRESULT")
        return result
    }
}
