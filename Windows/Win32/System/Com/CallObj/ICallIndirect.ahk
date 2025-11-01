#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * Invokes an object with an indirect reference to the invocations arguments, rather than the traditional direct call.
 * @remarks
 * 
  * The actual detailed semantics of how to carry out an indirect call are independent of the <b>ICallIndirect</b> interface itself; they are instead specific to the implementation of the interface. For example, implementations of <b>ICallIndirect</b> found in call interceptors carry out the call by constructing and appropriate <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframe">ICallFrame</a> instance and then invoking <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nf-callobj-icallframeevents-oncall">ICallFrameEvents::OnCall</a> in the registered sink. Other implementations might do some appropriate munging of the invocations arguments, then forward the call on to some actual specific object, presumably one previously registered with the <b>ICallIndirect</b> using some implementation-specific means.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//callobj/nn-callobj-icallindirect
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class ICallIndirect extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICallIndirect
     * @type {Guid}
     */
    static IID => Guid("{d573b4b1-894e-11d2-b8b6-00c04fb9618a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CallIndirect", "GetMethodInfo", "GetStackSize", "GetIID"]

    /**
     * 
     * @param {Pointer<HRESULT>} phrReturn 
     * @param {Integer} iMethod 
     * @param {Pointer<Void>} pvArgs 
     * @param {Pointer<Integer>} cbArgs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallindirect-callindirect
     */
    CallIndirect(phrReturn, iMethod, pvArgs, cbArgs) {
        pvArgsMarshal := pvArgs is VarRef ? "ptr" : "ptr"
        cbArgsMarshal := cbArgs is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", phrReturn, "uint", iMethod, pvArgsMarshal, pvArgs, cbArgsMarshal, cbArgs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iMethod 
     * @param {Pointer<CALLFRAMEINFO>} pInfo 
     * @param {Pointer<PWSTR>} pwszMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallindirect-getmethodinfo
     */
    GetMethodInfo(iMethod, pInfo, pwszMethod) {
        result := ComCall(4, this, "uint", iMethod, "ptr", pInfo, "ptr", pwszMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iMethod 
     * @param {Pointer<Integer>} cbArgs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallindirect-getstacksize
     */
    GetStackSize(iMethod, cbArgs) {
        cbArgsMarshal := cbArgs is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", iMethod, cbArgsMarshal, cbArgs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} piid 
     * @param {Pointer<BOOL>} pfDerivesFromIDispatch 
     * @param {Pointer<Integer>} pcMethod 
     * @param {Pointer<PWSTR>} pwszInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallindirect-getiid
     */
    GetIID(piid, pfDerivesFromIDispatch, pcMethod, pwszInterface) {
        pcMethodMarshal := pcMethod is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", piid, "ptr", pfDerivesFromIDispatch, pcMethodMarshal, pcMethod, "ptr", pwszInterface, "HRESULT")
        return result
    }
}
