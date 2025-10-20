#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfPreservedKeyNotifySink interface is implemented by an application or TSF text service to receive notifications when keys are preserved, unpreserved, or when a preserved key description changes.
 * @remarks
 * 
  * Preserved keys are keyboard shortcuts that an application or TSF text service can register with the TSF manager.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfpreservedkeynotifysink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfPreservedKeyNotifySink extends IUnknown{
    /**
     * The interface identifier for ITfPreservedKeyNotifySink
     * @type {Guid}
     */
    static IID => Guid("{6f77c993-d2b1-446e-853e-5912efc8a286}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<TF_PRESERVEDKEY>} pprekey 
     * @returns {HRESULT} 
     */
    OnUpdated(pprekey) {
        result := ComCall(3, this, "ptr", pprekey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
