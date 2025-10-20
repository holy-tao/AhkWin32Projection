#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMSOMCollection interface represents a collection of GPMSOM objects.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmsomcollection
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMSOMCollection extends IDispatch{
    /**
     * The interface identifier for IGPMSOMCollection
     * @type {Guid}
     */
    static IID => Guid("{adc1688e-00e4-4495-abba-bed200df0cab}")

    /**
     * The class identifier for GPMSOMCollection
     * @type {Guid}
     */
    static CLSID => Guid("{24c1f147-3720-4f5b-a9c3-06b4e4f931d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Count(pVal) {
        result := ComCall(7, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    get_Item(lIndex, pVal) {
        result := ComCall(8, this, "int", lIndex, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} ppIGPMSOM 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppIGPMSOM) {
        result := ComCall(9, this, "ptr", ppIGPMSOM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
