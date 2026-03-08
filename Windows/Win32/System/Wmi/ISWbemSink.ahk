#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemSink extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemSink
     * @type {Guid}
     */
    static IID => Guid("{75718c9f-f029-11d1-a1ac-00c04fb6c223}")

    /**
     * The class identifier for SWbemSink
     * @type {Guid}
     */
    static CLSID => Guid("{75718c9a-f029-11d1-a1ac-00c04fb6c223}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel"]

    /**
     * Use the Cancel-Session packet to terminate the upload session with the BITS server.
     * @remarks
     * This packet cancels an upload job if it is sent before the last fragment is sent. Cancel-Session has no effect on a file whose last fragment has already been sent. When the BITS server receives the last fragment, it writes the file to its final destination and, in the case of an upload-reply, posts the file to the server application. In the upload-reply case, the Cancel-Session packet cancels the reply portion of an upload-reply job.
     * 
     * The BITS server releases all resources and deletes all temporary files when it receives this packet.
     * 
     * The BITS client sends this packet when the user cancels the job.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Bits/cancel-session
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
