#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IDispatchEx extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDispID", "InvokeEx", "DeleteMemberByName", "DeleteMemberByDispID", "GetMemberProperties", "GetMemberName", "GetNextDispID", "GetNameSpaceParent"]

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Integer} grfdex 
     * @returns {Integer} 
     */
    GetDispID(bstrName, grfdex) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, "ptr", bstrName, "uint", grfdex, "int*", &pid := 0, "HRESULT")
        return pid
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Integer} lcid 
     * @param {Integer} wFlags 
     * @param {Pointer<DISPPARAMS>} pdp 
     * @param {Pointer<VARIANT>} pvarRes 
     * @param {Pointer<EXCEPINFO>} pei 
     * @param {IServiceProvider} pspCaller 
     * @returns {HRESULT} 
     */
    InvokeEx(id, lcid, wFlags, pdp, pvarRes, pei, pspCaller) {
        result := ComCall(8, this, "int", id, "uint", lcid, "ushort", wFlags, "ptr", pdp, "ptr", pvarRes, "ptr", pei, "ptr", pspCaller, "HRESULT")
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

        result := ComCall(9, this, "ptr", bstrName, "uint", grfdex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    DeleteMemberByDispID(id) {
        result := ComCall(10, this, "int", id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Integer} grfdexFetch 
     * @returns {Integer} 
     */
    GetMemberProperties(id, grfdexFetch) {
        result := ComCall(11, this, "int", id, "uint", grfdexFetch, "uint*", &pgrfdex := 0, "HRESULT")
        return pgrfdex
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {BSTR} 
     */
    GetMemberName(id) {
        pbstrName := BSTR()
        result := ComCall(12, this, "int", id, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {Integer} grfdex 
     * @param {Integer} id 
     * @returns {Integer} 
     */
    GetNextDispID(grfdex, id) {
        result := ComCall(13, this, "uint", grfdex, "int", id, "int*", &pid := 0, "HRESULT")
        return pid
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetNameSpaceParent() {
        result := ComCall(14, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }
}
