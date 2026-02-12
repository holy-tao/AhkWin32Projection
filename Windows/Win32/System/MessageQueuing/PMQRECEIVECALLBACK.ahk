#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class PMQRECEIVECALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HRESULT} hrStatus 
     * @param {Pointer} hSource 
     * @param {Integer} dwTimeout 
     * @param {Integer} dwAction 
     * @param {Pointer<MQMSGPROPS>} pMessageProps 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @param {HANDLE} hCursor_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hrStatus, hSource, dwTimeout, dwAction, pMessageProps, lpOverlapped, hCursor_) {
        hCursor_ := hCursor_ is Win32Handle ? NumGet(hCursor_, "ptr") : hCursor_

        ComCall(3, this, "int", hrStatus, "ptr", hSource, "uint", dwTimeout, "uint", dwAction, "ptr", pMessageProps, "ptr", lpOverlapped, "ptr", hCursor_)
    }
}
