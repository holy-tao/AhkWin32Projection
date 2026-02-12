#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables two instances of the Media Session to share the same protected media path (PMP) process.
 * @remarks
 * If your application creates more than one instance of the Media Session, you can use this interface to share the same PMP process among several instances. This can be more efficient than re-creating the PMP process each time.
 * 
 * Use this interface as follows:
 * 
 * <ol>
 * <li>Create the first instance of the PMP Media Session by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatepmpmediasession">MFCreatePMPMediaSession</a>.
 *           </li>
 * <li>Retrieve an <b>IMFPMPServer</b> pointer from the first Media Session by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a> with the service identifier <b>MF_PMP_SERVER_CONTEXT</b>.
 *           </li>
 * <li>Create the second instance of the PMP Media Session. Set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-session-server-context-attribute">MF_SESSION_SERVER_CONTEXT</a> attribute on the <i>pConfiguration</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatepmpmediasession">MFCreatePMPMediaSession</a> function. The attribute value is the <b>IMFPMPServer</b> pointer retrieved in step 2.
 *           </li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfpmpserver
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPMPServer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPMPServer
     * @type {Guid}
     */
    static IID => Guid("{994e23af-1cc2-493c-b9fa-46f1cb040fa4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LockProcess", "UnlockProcess", "CreateObjectByCLSID"]

    /**
     * Blocks the protected media path (PMP) process from ending. (IMFPMPServer.LockProcess)
     * @remarks
     * When this method is called, it increments the lock count on the PMP process. For every call to this method, the application should make a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpmpserver-unlockprocess">IMFPMPServer::UnlockProcess</a>, which decrements the lock count. When the PMP process is ready to exit, it waits for about 3 seconds, or until the lock count reaches zero, before exiting.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpmpserver-lockprocess
     */
    LockProcess() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Decrements the lock count on the protected media path (PMP) process. Call this method once for each call to IMFPMPServer::LockProcess.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpmpserver-unlockprocess
     */
    UnlockProcess() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates an object in the protected media path (PMP) process.
     * @param {Pointer<Guid>} clsid CLSID of the object to create.
     * @param {Pointer<Guid>} riid Interface identifier of the interface to retrieve.
     * @returns {Pointer<Pointer<Void>>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpmpserver-createobjectbyclsid
     */
    CreateObjectByCLSID(clsid, riid) {
        result := ComCall(5, this, "ptr", clsid, "ptr", riid, "ptr*", &ppObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppObject
    }
}
