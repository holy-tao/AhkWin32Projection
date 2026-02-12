#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * MSGCALLRELEASE defines a callback function that can free an IStorage interface after the final release of an IMessage object.
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/msgcallrelease
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class MSGCALLRELEASE extends IUnknown {

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
     * @param {Integer} ulCallerData 
     * @param {IMessage} lpMessage 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ulCallerData, lpMessage) {
        ComCall(3, this, "uint", ulCallerData, "ptr", lpMessage)
    }
}
