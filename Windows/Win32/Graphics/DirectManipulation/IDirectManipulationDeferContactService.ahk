#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a service for managing associations between a contact and a viewport.
 * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nn-directmanipulation-idirectmanipulationdefercontactservice
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationDeferContactService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationDeferContactService
     * @type {Guid}
     */
    static IID => Guid("{652d5c71-fe60-4a98-be70-e5f21291e7f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeferContact", "CancelContact", "CancelDeferral"]

    /**
     * Specifies the amount of time to defer the execution of a call to SetContact for this pointerId.
     * @param {Integer} pointerId The ID of the pointer.
     * @param {Integer} timeout The duration of the deferral, in milliseconds. The maximum value is 500.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationdefercontactservice-defercontact
     */
    DeferContact(pointerId, timeout) {
        result := ComCall(3, this, "uint", pointerId, "uint", timeout, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Cancel all scheduled calls to SetContact for this pointerId.
     * @remarks
     * This function fails if the timeout specified in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationdefercontactservice-defercontact">DeferContact</a> has already been reached.
     * @param {Integer} pointerId The ID of the pointer.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationdefercontactservice-cancelcontact
     */
    CancelContact(pointerId) {
        result := ComCall(4, this, "uint", pointerId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Cancel the deferral set in DeferContact and process the scheduled SetContact call for this pointerId.
     * @param {Integer} pointerId The ID of the pointer.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationdefercontactservice-canceldeferral
     */
    CancelDeferral(pointerId) {
        result := ComCall(5, this, "uint", pointerId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
