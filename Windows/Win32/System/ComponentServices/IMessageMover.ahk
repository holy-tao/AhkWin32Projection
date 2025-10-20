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
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_SourcePath(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_SourcePath(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(8, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_DestPath(pVal) {
        result := ComCall(9, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_DestPath(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(10, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_CommitBatchSize(pVal) {
        result := ComCall(11, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_CommitBatchSize(newVal) {
        result := ComCall(12, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMessagesMoved 
     * @returns {HRESULT} 
     */
    MoveMessages(plMessagesMoved) {
        result := ComCall(13, this, "int*", plMessagesMoved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
