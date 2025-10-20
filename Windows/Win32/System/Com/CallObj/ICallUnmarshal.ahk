#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * Is used on the server (receiving) side of a remote invocation.
 * @see https://docs.microsoft.com/windows/win32/api//callobj/nn-callobj-icallunmarshal
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class ICallUnmarshal extends IUnknown{
    /**
     * The interface identifier for ICallUnmarshal
     * @type {Guid}
     */
    static IID => Guid("{5333b003-2e42-11d2-b89d-00c04fb9618a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} iMethod 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} cbBuffer 
     * @param {BOOL} fForceBufferCopy 
     * @param {Integer} dataRep 
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pcontext 
     * @param {Pointer<UInt32>} pcbUnmarshalled 
     * @param {Pointer<ICallFrame>} ppFrame 
     * @returns {HRESULT} 
     */
    Unmarshal(iMethod, pBuffer, cbBuffer, fForceBufferCopy, dataRep, pcontext, pcbUnmarshalled, ppFrame) {
        result := ComCall(3, this, "uint", iMethod, "ptr", pBuffer, "uint", cbBuffer, "int", fForceBufferCopy, "uint", dataRep, "ptr", pcontext, "uint*", pcbUnmarshalled, "ptr", ppFrame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iMethod 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} cbBuffer 
     * @param {Integer} ibFirstRelease 
     * @param {Integer} dataRep 
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pcontext 
     * @returns {HRESULT} 
     */
    ReleaseMarshalData(iMethod, pBuffer, cbBuffer, ibFirstRelease, dataRep, pcontext) {
        result := ComCall(4, this, "uint", iMethod, "ptr", pBuffer, "uint", cbBuffer, "uint", ibFirstRelease, "uint", dataRep, "ptr", pcontext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
