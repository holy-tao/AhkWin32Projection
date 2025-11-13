#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAttachmentExecute.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAttachmentExecute2 extends IAttachmentExecute{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAttachmentExecute2
     * @type {Guid}
     */
    static IID => Guid("{4f2b781f-a608-4543-abf0-49c246ebbba9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SaveNoVirusCheck", "SaveWithUINoVirusCheck"]

    /**
     * 
     * @returns {HRESULT} 
     */
    SaveNoVirusCheck() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    SaveWithUINoVirusCheck(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(16, this, "ptr", hwnd, "HRESULT")
        return result
    }
}
