#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfClientId interface is implemented by the TSF manager. This interface is used to obtain a client identifier for TSF objects. An instance of this interface is obtained by querying the thread manager with IID_ITfClientId.
 * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nn-msctf-itfclientid
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfClientId extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfClientId
     * @type {Guid}
     */
    static IID => Guid("{d60a7b49-1b9f-4be2-b702-47e9dc05dec3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClientId"]

    /**
     * ITfClientId::GetClientId method
     * @remarks
     * An application obtains its client identifier by calling <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-activate">ITfThreadMgr::Activate</a> and a text service receives its client identifier in its <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftextinputprocessor-activate">ITfTextInputProcessor::Activate</a> method. <b>ITfClientId::GetClientId</b> enables TSF objects that do not fit either of these categories to obtain their own client identifier.
     * @param {Pointer<Guid>} rclsid CLSID to obtain the client identifier for.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfclientid">TfClientId</a> value that receives the client identifier.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfclientid-getclientid
     */
    GetClientId(rclsid) {
        result := ComCall(3, this, "ptr", rclsid, "uint*", &ptid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ptid
    }
}
