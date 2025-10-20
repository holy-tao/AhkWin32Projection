#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IEnumDebugExtendedPropertyInfo extends IUnknown{
    /**
     * The interface identifier for IEnumDebugExtendedPropertyInfo
     * @type {Guid}
     */
    static IID => Guid("{51973c53-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<ExtendedDebugPropertyInfo>} rgExtendedPropertyInfo 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, rgExtendedPropertyInfo, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", rgExtendedPropertyInfo, "uint*", pceltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDebugExtendedPropertyInfo>} pedpe 
     * @returns {HRESULT} 
     */
    Clone(pedpe) {
        result := ComCall(6, this, "ptr", pedpe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcelt 
     * @returns {HRESULT} 
     */
    GetCount(pcelt) {
        result := ComCall(7, this, "uint*", pcelt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
