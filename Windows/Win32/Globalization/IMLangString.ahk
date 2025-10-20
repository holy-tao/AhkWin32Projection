#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMLangString extends IUnknown{
    /**
     * The interface identifier for IMLangString
     * @type {Guid}
     */
    static IID => Guid("{c04d65ce-b70d-11d0-b188-00aa0038c969}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BOOL} fNoAccess 
     * @returns {HRESULT} 
     */
    Sync(fNoAccess) {
        result := ComCall(3, this, "int", fNoAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plLen 
     * @returns {HRESULT} 
     */
    GetLength(plLen) {
        result := ComCall(4, this, "int*", plLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lDestPos 
     * @param {Integer} lDestLen 
     * @param {Pointer<IUnknown>} pSrcMLStr 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcLen 
     * @returns {HRESULT} 
     */
    SetMLStr(lDestPos, lDestLen, pSrcMLStr, lSrcPos, lSrcLen) {
        result := ComCall(5, this, "int", lDestPos, "int", lDestLen, "ptr", pSrcMLStr, "int", lSrcPos, "int", lSrcLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcLen 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} piid 
     * @param {Pointer<IUnknown>} ppDestMLStr 
     * @param {Pointer<Int32>} plDestPos 
     * @param {Pointer<Int32>} plDestLen 
     * @returns {HRESULT} 
     */
    GetMLStr(lSrcPos, lSrcLen, pUnkOuter, dwClsContext, piid, ppDestMLStr, plDestPos, plDestLen) {
        result := ComCall(6, this, "int", lSrcPos, "int", lSrcLen, "ptr", pUnkOuter, "uint", dwClsContext, "ptr", piid, "ptr", ppDestMLStr, "int*", plDestPos, "int*", plDestLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
