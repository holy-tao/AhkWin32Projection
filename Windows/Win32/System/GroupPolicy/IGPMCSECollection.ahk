#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMCSECollection interface contains methods that enable applications to query a collection of client-side extensions (CSEs) when you use the Group Policy Management Console (GPMC) interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmcsecollection
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMCSECollection extends IDispatch{
    /**
     * The interface identifier for IGPMCSECollection
     * @type {Guid}
     */
    static IID => Guid("{2e52a97d-0a4a-4a6f-85db-201622455da0}")

    /**
     * The class identifier for GPMCSECollection
     * @type {Guid}
     */
    static CLSID => Guid("{cf92b828-2d44-4b61-b10a-b327afd42da8}")

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
     * @param {Pointer<IEnumVARIANT>} ppIGPMCSEs 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppIGPMCSEs) {
        result := ComCall(9, this, "ptr", ppIGPMCSEs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
