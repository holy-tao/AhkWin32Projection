#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Transfers the foreground window to the process hosting the COM server.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iforegroundtransfer
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IForegroundTransfer extends IUnknown{
    /**
     * The interface identifier for IForegroundTransfer
     * @type {Guid}
     */
    static IID => Guid("{00000145-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    AllowForegroundTransfer() {
        static lpvReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr", lpvReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
