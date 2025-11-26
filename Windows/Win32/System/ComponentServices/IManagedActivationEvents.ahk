#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to create and destroy stubs for managed objects within the current COM+ context.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-imanagedactivationevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IManagedActivationEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IManagedActivationEvents
     * @type {Guid}
     */
    static IID => Guid("{a5f325af-572f-46da-b8ab-827c3d95d99e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateManagedStub", "DestroyManagedStub"]

    /**
     * Creates a stub for a managed object within the current COM+ context.
     * @param {IManagedObjectInfo} pInfo A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imanagedobjectinfo">IManagedObjectInfo</a> that describes the stub for a managed object.
     * @param {BOOL} fDist Indicates whether the created stub is the distinguished stub. A distinguished stub is the stub that controls the lifetime of the current COM+ context.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imanagedactivationevents-createmanagedstub
     */
    CreateManagedStub(pInfo, fDist) {
        result := ComCall(3, this, "ptr", pInfo, "int", fDist, "HRESULT")
        return result
    }

    /**
     * Destroys a stub that was created by CreateManagedStub.
     * @param {IManagedObjectInfo} pInfo A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imanagedobjectinfo">IManagedObjectInfo</a> that describes the stub for a managed object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imanagedactivationevents-destroymanagedstub
     */
    DestroyManagedStub(pInfo) {
        result := ComCall(4, this, "ptr", pInfo, "HRESULT")
        return result
    }
}
