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
     * Informs the event sink if it receives a method call on the interceptor. The sink is provided with an ICallFrame instance which is bound to the intercepted incoming method invocation. Through that sink the call frame can be manipulated in various ways.
     * @param {ICallFrame} pFrame A call frame bound to the just-received invocation.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframeevents-oncall
     */
    OnCall(pFrame) {
        result := ComCall(3, this, "ptr", pFrame, "HRESULT")
        return result
    }
}
