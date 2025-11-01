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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIUnknown", "GetIObjectControl", "SetInPool", "SetWrapperStrength"]

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedobjectinfo-getiunknown
     */
    GetIUnknown(pUnk) {
        result := ComCall(3, this, "ptr*", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IObjectControl>} pCtrl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedobjectinfo-getiobjectcontrol
     */
    GetIObjectControl(pCtrl) {
        result := ComCall(4, this, "ptr*", pCtrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bInPool 
     * @param {IManagedPooledObj} pPooledObj 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedobjectinfo-setinpool
     */
    SetInPool(bInPool, pPooledObj) {
        result := ComCall(5, this, "int", bInPool, "ptr", pPooledObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bStrong 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedobjectinfo-setwrapperstrength
     */
    SetWrapperStrength(bStrong) {
        result := ComCall(6, this, "int", bStrong, "HRESULT")
        return result
    }
}
