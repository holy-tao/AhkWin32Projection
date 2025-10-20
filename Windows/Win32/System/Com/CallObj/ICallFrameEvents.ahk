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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCall"]

    /**
     * 
     * @param {ICallFrame} pFrame 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframeevents-oncall
     */
    OnCall(pFrame) {
        result := ComCall(3, this, "ptr", pFrame, "HRESULT")
        return result
    }
}
