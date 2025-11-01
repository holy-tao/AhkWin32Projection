#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * Enables manipulation of call frames such as stack frames.
 * @see https://docs.microsoft.com/windows/win32/api//callobj/nn-callobj-icallframe
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class ICallFrame extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICallFrame
     * @type {Guid}
     */
    static IID => Guid("{d573b4b0-894e-11d2-b8b6-00c04fb9618a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInfo", "GetIIDAndMethod", "GetNames", "GetStackLocation", "SetStackLocation", "SetReturnValue", "GetReturnValue", "GetParamInfo", "SetParam", "GetParam", "Copy", "Free", "FreeParam", "WalkFrame", "GetMarshalSizeMax", "Marshal", "Unmarshal", "ReleaseMarshalData", "Invoke"]

    /**
     * 
     * @param {Pointer<CALLFRAMEINFO>} pInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-getinfo
     */
    GetInfo(pInfo) {
        result := ComCall(3, this, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pIID 
     * @param {Pointer<Integer>} piMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-getiidandmethod
     */
    GetIIDAndMethod(pIID, piMethod) {
        piMethodMarshal := piMethod is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pIID, piMethodMarshal, piMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwszInterface 
     * @param {Pointer<PWSTR>} pwszMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-getnames
     */
    GetNames(pwszInterface, pwszMethod) {
        result := ComCall(5, this, "ptr", pwszInterface, "ptr", pwszMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-getstacklocation
     */
    GetStackLocation() {
        result := ComCall(6, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvStack 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-setstacklocation
     */
    SetStackLocation(pvStack) {
        pvStackMarshal := pvStack is VarRef ? "ptr" : "ptr"

        ComCall(7, this, pvStackMarshal, pvStack)
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-setreturnvalue
     */
    SetReturnValue(hr) {
        ComCall(8, this, "int", hr)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-getreturnvalue
     */
    GetReturnValue() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iparam 
     * @param {Pointer<CALLFRAMEPARAMINFO>} pInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-getparaminfo
     */
    GetParamInfo(iparam, pInfo) {
        result := ComCall(10, this, "uint", iparam, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iparam 
     * @param {Pointer<VARIANT>} pvar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-setparam
     */
    SetParam(iparam, pvar) {
        result := ComCall(11, this, "uint", iparam, "ptr", pvar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iparam 
     * @param {Pointer<VARIANT>} pvar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-getparam
     */
    GetParam(iparam, pvar) {
        result := ComCall(12, this, "uint", iparam, "ptr", pvar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} copyControl 
     * @param {ICallFrameWalker} pWalker 
     * @param {Pointer<ICallFrame>} ppFrame 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-copy
     */
    Copy(copyControl, pWalker, ppFrame) {
        result := ComCall(13, this, "int", copyControl, "ptr", pWalker, "ptr*", ppFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICallFrame} pframeArgsDest 
     * @param {ICallFrameWalker} pWalkerDestFree 
     * @param {ICallFrameWalker} pWalkerCopy 
     * @param {Integer} freeFlags 
     * @param {ICallFrameWalker} pWalkerFree 
     * @param {Integer} nullFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-free
     */
    Free(pframeArgsDest, pWalkerDestFree, pWalkerCopy, freeFlags, pWalkerFree, nullFlags) {
        result := ComCall(14, this, "ptr", pframeArgsDest, "ptr", pWalkerDestFree, "ptr", pWalkerCopy, "uint", freeFlags, "ptr", pWalkerFree, "uint", nullFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iparam 
     * @param {Integer} freeFlags 
     * @param {ICallFrameWalker} pWalkerFree 
     * @param {Integer} nullFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-freeparam
     */
    FreeParam(iparam, freeFlags, pWalkerFree, nullFlags) {
        result := ComCall(15, this, "uint", iparam, "uint", freeFlags, "ptr", pWalkerFree, "uint", nullFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} walkWhat 
     * @param {ICallFrameWalker} pWalker 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-walkframe
     */
    WalkFrame(walkWhat, pWalker) {
        result := ComCall(16, this, "uint", walkWhat, "ptr", pWalker, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pmshlContext 
     * @param {Integer} mshlflags 
     * @param {Pointer<Integer>} pcbBufferNeeded 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-getmarshalsizemax
     */
    GetMarshalSizeMax(pmshlContext, mshlflags, pcbBufferNeeded) {
        pcbBufferNeededMarshal := pcbBufferNeeded is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "ptr", pmshlContext, "int", mshlflags, pcbBufferNeededMarshal, pcbBufferNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pmshlContext 
     * @param {Integer} mshlflags 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} pcbBufferUsed 
     * @param {Pointer<Integer>} pdataRep 
     * @param {Pointer<Integer>} prpcFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-marshal
     */
    Marshal(pmshlContext, mshlflags, pBuffer, cbBuffer, pcbBufferUsed, pdataRep, prpcFlags) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pcbBufferUsedMarshal := pcbBufferUsed is VarRef ? "uint*" : "ptr"
        pdataRepMarshal := pdataRep is VarRef ? "uint*" : "ptr"
        prpcFlagsMarshal := prpcFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ptr", pmshlContext, "int", mshlflags, pBufferMarshal, pBuffer, "uint", cbBuffer, pcbBufferUsedMarshal, pcbBufferUsed, pdataRepMarshal, pdataRep, prpcFlagsMarshal, prpcFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} cbBuffer 
     * @param {Integer} dataRep 
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pcontext 
     * @param {Pointer<Integer>} pcbUnmarshalled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-unmarshal
     */
    Unmarshal(pBuffer, cbBuffer, dataRep, pcontext, pcbUnmarshalled) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pcbUnmarshalledMarshal := pcbUnmarshalled is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, pBufferMarshal, pBuffer, "uint", cbBuffer, "uint", dataRep, "ptr", pcontext, pcbUnmarshalledMarshal, pcbUnmarshalled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} cbBuffer 
     * @param {Integer} ibFirstRelease 
     * @param {Integer} dataRep 
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pcontext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-releasemarshaldata
     */
    ReleaseMarshalData(pBuffer, cbBuffer, ibFirstRelease, dataRep, pcontext) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

        result := ComCall(20, this, pBufferMarshal, pBuffer, "uint", cbBuffer, "uint", ibFirstRelease, "uint", dataRep, "ptr", pcontext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvReceiver 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframe-invoke
     */
    Invoke(pvReceiver) {
        pvReceiverMarshal := pvReceiver is VarRef ? "ptr" : "ptr"

        result := ComCall(21, this, pvReceiverMarshal, pvReceiver, "HRESULT")
        return result
    }
}
