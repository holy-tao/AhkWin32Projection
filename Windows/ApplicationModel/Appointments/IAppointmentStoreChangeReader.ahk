#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\AppointmentStoreChange.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentStoreChangeReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentStoreChangeReader
     * @type {Guid}
     */
    static IID => Guid("{8b2409f1-65f3-42a0-961d-4c209bf30370}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadBatchAsync", "AcceptChanges", "AcceptChangesThrough"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<AppointmentStoreChange>>} 
     */
    ReadBatchAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppointmentStoreChange), result_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AcceptChanges() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {AppointmentStoreChange} lastChangeToAccept 
     * @returns {HRESULT} 
     */
    AcceptChangesThrough(lastChangeToAccept) {
        result := ComCall(8, this, "ptr", lastChangeToAccept, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
