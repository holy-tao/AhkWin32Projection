#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Callback flags for canceling data fetching for a placeholder file or folder.
 * @see https://learn.microsoft.com/windows/win32/api//content/cfapi/ne-cfapi-cf_callback_cancel_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK extends IUnknown {

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
     * @param {Pointer<CF_CALLBACK_INFO>} CallbackInfo 
     * @param {Pointer<CF_CALLBACK_PARAMETERS>} CallbackParameters 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(CallbackInfo, CallbackParameters) {
        ComCall(3, this, "ptr", CallbackInfo, "ptr", CallbackParameters)
    }
}
