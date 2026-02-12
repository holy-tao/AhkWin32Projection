#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class PCHANNEL_OPEN_EVENT_FN extends IUnknown {

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
     * @param {Integer} openHandle 
     * @param {Integer} event 
     * @param {Pointer<Void>} pData 
     * @param {Integer} dataLength 
     * @param {Integer} totalLength 
     * @param {Integer} dataFlags 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(openHandle, event, pData, dataLength, totalLength, dataFlags) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "uint", openHandle, "uint", event, pDataMarshal, pData, "uint", dataLength, "uint", totalLength, "uint", dataFlags)
    }
}
