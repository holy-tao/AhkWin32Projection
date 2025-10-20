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
     * 
     * @param {Pointer<IManagedObjectInfo>} pInfo 
     * @param {BOOL} fDist 
     * @returns {HRESULT} 
     */
    CreateManagedStub(pInfo, fDist) {
        result := ComCall(3, this, "ptr", pInfo, "int", fDist, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IManagedObjectInfo>} pInfo 
     * @returns {HRESULT} 
     */
    DestroyManagedStub(pInfo) {
        result := ComCall(4, this, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
