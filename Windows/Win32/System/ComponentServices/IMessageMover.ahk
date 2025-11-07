#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Moves messages from one queue to another queue.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-imessagemover
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IMessageMover extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMessageMover
     * @type {Guid}
     */
    static IID => Guid("{588a085a-b795-11d1-8054-00c04fc340ee}")

    /**
     * The class identifier for MessageMover
     * @type {Guid}
     */
    static CLSID => Guid("{ecabb0bf-7f19-11d2-978e-0000f8757e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourcePath", "put_SourcePath", "get_DestPath", "put_DestPath", "get_CommitBatchSize", "put_CommitBatchSize", "MoveMessages"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-get_sourcepath
     */
    get_SourcePath() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-put_sourcepath
     */
    put_SourcePath(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(8, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-get_destpath
     */
    get_DestPath() {
        pVal := BSTR()
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-put_destpath
     */
    put_DestPath(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(10, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-get_commitbatchsize
     */
    get_CommitBatchSize() {
        result := ComCall(11, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-put_commitbatchsize
     */
    put_CommitBatchSize(newVal) {
        result := ComCall(12, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imessagemover-movemessages
     */
    MoveMessages() {
        result := ComCall(13, this, "int*", &plMessagesMoved := 0, "HRESULT")
        return plMessagesMoved
    }
}
