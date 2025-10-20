#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Callback interface implemented by components that need to perform special processing of window messages on an ASTA thread.
 * @see https://docs.microsoft.com/windows/win32/api//imessagedispatcher/nn-imessagedispatcher-imessagedispatcher
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IMessageDispatcher extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMessageDispatcher
     * @type {Guid}
     */
    static IID => Guid("{f5f84c8f-cfd0-4cd6-b66b-c5d26ff1689d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PumpMessages"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imessagedispatcher/nf-imessagedispatcher-imessagedispatcher-pumpmessages
     */
    PumpMessages() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
