#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * Delivers method call notifications.
 * @see https://docs.microsoft.com/windows/win32/api//callobj/nn-callobj-icallframeevents
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class ICallFrameEvents extends IUnknown{
    /**
     * The interface identifier for ICallFrameEvents
     * @type {Guid}
     */
    static IID => Guid("{fd5e0843-fc91-11d0-97d7-00c04fb9618a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ICallFrame>} pFrame 
     * @returns {HRESULT} 
     */
    OnCall(pFrame) {
        result := ComCall(3, this, "ptr", pFrame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
