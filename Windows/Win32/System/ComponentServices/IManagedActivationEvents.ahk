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
     * 
     * @param {IManagedObjectInfo} pInfo 
     * @param {BOOL} fDist 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedactivationevents-createmanagedstub
     */
    CreateManagedStub(pInfo, fDist) {
        result := ComCall(3, this, "ptr", pInfo, "int", fDist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IManagedObjectInfo} pInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedactivationevents-destroymanagedstub
     */
    DestroyManagedStub(pInfo) {
        result := ComCall(4, this, "ptr", pInfo, "HRESULT")
        return result
    }
}
