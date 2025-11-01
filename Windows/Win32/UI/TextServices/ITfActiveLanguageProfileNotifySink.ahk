#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfActiveLanguageProfileNotifySink interface is implemented by an application to receive a notification when the active language or text service changes.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfactivelanguageprofilenotifysink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfActiveLanguageProfileNotifySink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfActiveLanguageProfileNotifySink
     * @type {Guid}
     */
    static IID => Guid("{b246cb75-a93e-4652-bf8c-b3fe0cfd7e57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnActivated"]

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {BOOL} fActivated 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfactivelanguageprofilenotifysink-onactivated
     */
    OnActivated(clsid, guidProfile, fActivated) {
        result := ComCall(3, this, "ptr", clsid, "ptr", guidProfile, "int", fActivated, "HRESULT")
        return result
    }
}
