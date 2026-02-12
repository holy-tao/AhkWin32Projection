#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ContactChange.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactChangeReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactChangeReader
     * @type {Guid}
     */
    static IID => Guid("{217319fa-2d0c-42e0-a9da-3ecd56a78a47}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcceptChanges", "AcceptChangesThrough", "ReadBatchAsync"]

    /**
     * 
     * @returns {HRESULT} 
     */
    AcceptChanges() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ContactChange} lastChangeToAccept 
     * @returns {HRESULT} 
     */
    AcceptChangesThrough(lastChangeToAccept) {
        result := ComCall(7, this, "ptr", lastChangeToAccept, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<ContactChange>>} 
     */
    ReadBatchAsync() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ContactChange), value)
    }
}
