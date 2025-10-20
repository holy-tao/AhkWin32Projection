#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DataSourceListener extends IUnknown{
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
     * 
     * @param {Pointer<UInt16>} bstrDM 
     * @returns {HRESULT} 
     */
    dataMemberChanged(bstrDM) {
        result := ComCall(3, this, "ushort*", bstrDM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} bstrDM 
     * @returns {HRESULT} 
     */
    dataMemberAdded(bstrDM) {
        result := ComCall(4, this, "ushort*", bstrDM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} bstrDM 
     * @returns {HRESULT} 
     */
    dataMemberRemoved(bstrDM) {
        result := ComCall(5, this, "ushort*", bstrDM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
