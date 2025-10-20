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
     * 
     * @param {Pointer<CALLFRAMEINFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetInfo(pInfo) {
        result := ComCall(3, this, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pIID 
     * @param {Pointer<UInt32>} piMethod 
     * @returns {HRESULT} 
     */
    GetIIDAndMethod(pIID, piMethod) {
        result := ComCall(4, this, "ptr", pIID, "uint*", piMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwszInterface 
     * @param {Pointer<PWSTR>} pwszMethod 
     * @returns {HRESULT} 
     */
    GetNames(pwszInterface, pwszMethod) {
        result := ComCall(5, this, "ptr", pwszInterface, "ptr", pwszMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    GetStackLocation() {
        result := ComCall(6, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvStack 
     * @returns {String} Nothing - always returns an empty string
     */
    SetStackLocation(pvStack) {
        ComCall(7, this, "ptr", pvStack)
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {String} Nothing - always returns an empty string
     */
    SetReturnValue(hr) {
        ComCall(8, this, "int", hr)
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetReturnValue() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iparam 
     * @param {Pointer<CALLFRAMEPARAMINFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetParamInfo(iparam, pInfo) {
        result := ComCall(10, this, "uint", iparam, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iparam 
     * @param {Pointer<VARIANT>} pvar 
     * @returns {HRESULT} 
     */
    SetParam(iparam, pvar) {
        result := ComCall(11, this, "uint", iparam, "ptr", pvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iparam 
     * @param {Pointer<VARIANT>} pvar 
     * @returns {HRESULT} 
     */
    GetParam(iparam, pvar) {
        result := ComCall(12, this, "uint", iparam, "ptr", pvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} copyControl 
     * @param {Pointer<ICallFrameWalker>} pWalker 
     * @param {Pointer<ICallFrame>} ppFrame 
     * @returns {HRESULT} 
     */
    Copy(copyControl, pWalker, ppFrame) {
        result := ComCall(13, this, "int", copyControl, "ptr", pWalker, "ptr", ppFrame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICallFrame>} pframeArgsDest 
     * @param {Pointer<ICallFrameWalker>} pWalkerDestFree 
     * @param {Pointer<ICallFrameWalker>} pWalkerCopy 
     * @param {Integer} freeFlags 
     * @param {Pointer<ICallFrameWalker>} pWalkerFree 
     * @param {Integer} nullFlags 
     * @returns {HRESULT} 
     */
    Free(pframeArgsDest, pWalkerDestFree, pWalkerCopy, freeFlags, pWalkerFree, nullFlags) {
        result := ComCall(14, this, "ptr", pframeArgsDest, "ptr", pWalkerDestFree, "ptr", pWalkerCopy, "uint", freeFlags, "ptr", pWalkerFree, "uint", nullFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iparam 
     * @param {Integer} freeFlags 
     * @param {Pointer<ICallFrameWalker>} pWalkerFree 
     * @param {Integer} nullFlags 
     * @returns {HRESULT} 
     */
    FreeParam(iparam, freeFlags, pWalkerFree, nullFlags) {
        result := ComCall(15, this, "uint", iparam, "uint", freeFlags, "ptr", pWalkerFree, "uint", nullFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} walkWhat 
     * @param {Pointer<ICallFrameWalker>} pWalker 
     * @returns {HRESULT} 
     */
    WalkFrame(walkWhat, pWalker) {
        result := ComCall(16, this, "uint", walkWhat, "ptr", pWalker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pmshlContext 
     * @param {Integer} mshlflags 
     * @param {Pointer<UInt32>} pcbBufferNeeded 
     * @returns {HRESULT} 
     */
    GetMarshalSizeMax(pmshlContext, mshlflags, pcbBufferNeeded) {
        result := ComCall(17, this, "ptr", pmshlContext, "int", mshlflags, "uint*", pcbBufferNeeded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pmshlContext 
     * @param {Integer} mshlflags 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<UInt32>} pcbBufferUsed 
     * @param {Pointer<UInt32>} pdataRep 
     * @param {Pointer<UInt32>} prpcFlags 
     * @returns {HRESULT} 
     */
    Marshal(pmshlContext, mshlflags, pBuffer, cbBuffer, pcbBufferUsed, pdataRep, prpcFlags) {
        result := ComCall(18, this, "ptr", pmshlContext, "int", mshlflags, "ptr", pBuffer, "uint", cbBuffer, "uint*", pcbBufferUsed, "uint*", pdataRep, "uint*", prpcFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} cbBuffer 
     * @param {Integer} dataRep 
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pcontext 
     * @param {Pointer<UInt32>} pcbUnmarshalled 
     * @returns {HRESULT} 
     */
    Unmarshal(pBuffer, cbBuffer, dataRep, pcontext, pcbUnmarshalled) {
        result := ComCall(19, this, "ptr", pBuffer, "uint", cbBuffer, "uint", dataRep, "ptr", pcontext, "uint*", pcbUnmarshalled, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    ReleaseMarshalData(pBuffer, cbBuffer, ibFirstRelease, dataRep, pcontext) {
        result := ComCall(20, this, "ptr", pBuffer, "uint", cbBuffer, "uint", ibFirstRelease, "uint", dataRep, "ptr", pcontext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvReceiver 
     * @returns {HRESULT} 
     */
    Invoke(pvReceiver) {
        result := ComCall(21, this, "ptr", pvReceiver, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
