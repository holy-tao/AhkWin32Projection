#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Describes the stub for a managed object.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-imanagedobjectinfo
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IManagedObjectInfo extends IUnknown{
    /**
     * The interface identifier for IManagedObjectInfo
     * @type {Guid}
     */
    static IID => Guid("{1427c51a-4584-49d8-90a0-c50d8086cbe9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    GetIUnknown(pUnk) {
        result := ComCall(3, this, "ptr", pUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectControl>} pCtrl 
     * @returns {HRESULT} 
     */
    GetIObjectControl(pCtrl) {
        result := ComCall(4, this, "ptr", pCtrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bInPool 
     * @param {Pointer<IManagedPooledObj>} pPooledObj 
     * @returns {HRESULT} 
     */
    SetInPool(bInPool, pPooledObj) {
        result := ComCall(5, this, "int", bInPool, "ptr", pPooledObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bStrong 
     * @returns {HRESULT} 
     */
    SetWrapperStrength(bStrong) {
        result := ComCall(6, this, "int", bStrong, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
