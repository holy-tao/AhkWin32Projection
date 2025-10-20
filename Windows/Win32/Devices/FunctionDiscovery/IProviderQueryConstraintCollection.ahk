#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is accessible to the provider through the IFunctionDiscoveryProviderQuery::GetQueryConstraints method.
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nn-functiondiscoveryprovider-iproviderqueryconstraintcollection
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IProviderQueryConstraintCollection extends IUnknown{
    /**
     * The interface identifier for IProviderQueryConstraintCollection
     * @type {Guid}
     */
    static IID => Guid("{9c243e11-3261-4bcd-b922-84a873d460ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetCount(pdwCount) {
        result := ComCall(3, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszConstraintName 
     * @param {Pointer<UInt16>} ppszConstraintValue 
     * @returns {HRESULT} 
     */
    Get(pszConstraintName, ppszConstraintValue) {
        pszConstraintName := pszConstraintName is String ? StrPtr(pszConstraintName) : pszConstraintName

        result := ComCall(4, this, "ptr", pszConstraintName, "ushort*", ppszConstraintValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<UInt16>} ppszConstraintName 
     * @param {Pointer<UInt16>} ppszConstraintValue 
     * @returns {HRESULT} 
     */
    Item(dwIndex, ppszConstraintName, ppszConstraintValue) {
        result := ComCall(5, this, "uint", dwIndex, "ushort*", ppszConstraintName, "ushort*", ppszConstraintValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} ppszConstraintName 
     * @param {Pointer<UInt16>} ppszConstraintValue 
     * @returns {HRESULT} 
     */
    Next(ppszConstraintName, ppszConstraintValue) {
        result := ComCall(6, this, "ushort*", ppszConstraintName, "ushort*", ppszConstraintValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Skip() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
