#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IObjectControl.ahk

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
     * Retrieves the IUnknown interface that is associated with the managed object.
     * @returns {IUnknown} A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imanagedobjectinfo-getiunknown
     */
    GetIUnknown() {
        result := ComCall(3, this, "ptr*", &pUnk := 0, "HRESULT")
        return IUnknown(pUnk)
    }

    /**
     * Retrieves the IObjectControl interface that is associated with the managed object.
     * @returns {IObjectControl} A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontrol">IObjectControl</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imanagedobjectinfo-getiobjectcontrol
     */
    GetIObjectControl() {
        result := ComCall(4, this, "ptr*", &pCtrl := 0, "HRESULT")
        return IObjectControl(pCtrl)
    }

    /**
     * Sets whether the managed object belongs to the COM+ object pool.
     * @param {BOOL} bInPool Indicates whether the managed object belongs to the COM+ object pool.
     * @param {IManagedPooledObj} pPooledObj A reference to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imanagedpooledobj">IManagedPooledObj</a> that describes how this managed object is used in the COM+ object pool.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imanagedobjectinfo-setinpool
     */
    SetInPool(bInPool, pPooledObj) {
        result := ComCall(5, this, "int", bInPool, "ptr", pPooledObj, "HRESULT")
        return result
    }

    /**
     * Sets whether the managed object holds a strong or a weak reference to the COM+ context.
     * @param {BOOL} bStrong Indicates whether the managed object holds a strong or a weak reference to the COM+ context. A strong reference keeps the object alive and prevents it from being destroyed during garbage collection.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imanagedobjectinfo-setwrapperstrength
     */
    SetWrapperStrength(bStrong) {
        result := ComCall(6, this, "int", bStrong, "HRESULT")
        return result
    }
}
