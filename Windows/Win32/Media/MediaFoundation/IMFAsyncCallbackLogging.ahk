#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAsyncCallback.ahk

/**
 * Provides logging information about the parent object the async callback is associated with.
 * @remarks
 * 
  * <b>IMFAsyncCallbackLogging</b> is primarily used for async callbacks to return an ID of the parent object that they are associated with.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfasynccallbacklogging
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFAsyncCallbackLogging extends IMFAsyncCallback{
    /**
     * The interface identifier for IMFAsyncCallbackLogging
     * @type {Guid}
     */
    static IID => Guid("{c7a4dca1-f5f0-47b6-b92b-bf0106d25791}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    GetObjectPointer() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetObjectTag() {
        result := ComCall(6, this, "uint")
        return result
    }
}
