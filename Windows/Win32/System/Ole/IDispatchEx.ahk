#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IDispatchEx extends IDispatch{
    /**
     * The interface identifier for IDispatchEx
     * @type {Guid}
     */
    static IID => Guid("{a6ef9860-c720-11d0-9337-00a0c90dcaa9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Integer} grfdex 
     * @param {Pointer<Int32>} pid 
     * @returns {HRESULT} 
     */
    GetDispID(bstrName, grfdex, pid) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, "ptr", bstrName, "uint", grfdex, "int*", pid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Integer} lcid 
     * @param {Integer} wFlags 
     * @param {Pointer<DISPPARAMS>} pdp 
     * @param {Pointer<VARIANT>} pvarRes 
     * @param {Pointer<EXCEPINFO>} pei 
     * @param {Pointer<IServiceProvider>} pspCaller 
     * @returns {HRESULT} 
     */
    InvokeEx(id, lcid, wFlags, pdp, pvarRes, pei, pspCaller) {
        result := ComCall(8, this, "int", id, "uint", lcid, "ushort", wFlags, "ptr", pdp, "ptr", pvarRes, "ptr", pei, "ptr", pspCaller, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Integer} grfdex 
     * @returns {HRESULT} 
     */
    DeleteMemberByName(bstrName, grfdex) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "uint", grfdex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    DeleteMemberByDispID(id) {
        result := ComCall(10, this, "int", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Integer} grfdexFetch 
     * @param {Pointer<UInt32>} pgrfdex 
     * @returns {HRESULT} 
     */
    GetMemberProperties(id, grfdexFetch, pgrfdex) {
        result := ComCall(11, this, "int", id, "uint", grfdexFetch, "uint*", pgrfdex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetMemberName(id, pbstrName) {
        result := ComCall(12, this, "int", id, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} grfdex 
     * @param {Integer} id 
     * @param {Pointer<Int32>} pid 
     * @returns {HRESULT} 
     */
    GetNextDispID(grfdex, id, pid) {
        result := ComCall(13, this, "uint", grfdex, "int", id, "int*", pid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    GetNameSpaceParent(ppunk) {
        result := ComCall(14, this, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
