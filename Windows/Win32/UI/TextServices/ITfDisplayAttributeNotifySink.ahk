#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfDisplayAttributeNotifySink interface is implemented by an application to receive a notification when display attribute information is updated.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfdisplayattributenotifysink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfDisplayAttributeNotifySink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfDisplayAttributeNotifySink
     * @type {Guid}
     */
    static IID => Guid("{ad56f402-e162-4f25-908f-7d577cf9bda9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUpdateInfo"]

    /**
     * ITfDisplayAttributeNotifySink::OnUpdateInfo method
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfdisplayattributenotifysink-onupdateinfo
     */
    OnUpdateInfo() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
