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
     * 
     * @returns {HRESULT} 
     */
    OnUpdateInfo() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
