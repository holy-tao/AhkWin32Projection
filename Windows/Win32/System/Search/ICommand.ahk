#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The ICommandTree interface is optional for providers that support commands. It contains methods for manipulating query trees. Providers that support command trees must also support specifying the same functionality through the ICommandText interface.
 * @see https://learn.microsoft.com/windows/win32/api/cmdtree/nn-cmdtree-icommandtree
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommand extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommand
     * @type {Guid}
     */
    static IID => Guid("{0c733a63-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "Execute", "GetDBSession"]

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
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Calls the DsReplicaConsistencyCheck function, which invokes the Knowledge Consistency Checker (KCC) to verify the replication topology.
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<DBPARAMS>} pParams 
     * @param {Pointer<Pointer>} pcRowsAffected 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/AD/executekcc-msad-domaincontroller
     */
    Execute(pUnkOuter, riid, pParams, pcRowsAffected, ppRowset) {
        pcRowsAffectedMarshal := pcRowsAffected is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pUnkOuter, "ptr", riid, "ptr", pParams, pcRowsAffectedMarshal, pcRowsAffected, "ptr*", ppRowset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetDBSession(riid) {
        result := ComCall(5, this, "ptr", riid, "ptr*", &ppSession := 0, "HRESULT")
        return IUnknown(ppSession)
    }
}
