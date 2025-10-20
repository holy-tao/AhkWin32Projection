#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerObjectEnum extends IUnknown{
    /**
     * The interface identifier for ICorProfilerObjectEnum
     * @type {Guid}
     */
    static IID => Guid("{2c6269bd-2d13-4321-ae12-6686365fd6af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(3, this, "uint", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICorProfilerObjectEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(5, this, "ptr", ppEnum, "int")
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
        result := ComCall(6, this, "uint*", pcelt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<UIntPtr>} objects 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, objects, pceltFetched) {
        result := ComCall(7, this, "uint", celt, "ptr*", objects, "uint*", pceltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
