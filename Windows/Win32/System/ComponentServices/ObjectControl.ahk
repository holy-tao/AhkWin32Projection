#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * If you implement this interface in your component, the COM+ run-time environment automatically calls its methods on your objects at the appropriate times.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-objectcontrol
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ObjectControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ObjectControl
     * @type {Guid}
     */
    static IID => Guid("{7dc41850-0c31-11d0-8b79-00aa00b8a790}")

    /**
     * The class identifier for ObjectControl
     * @type {Guid}
     */
    static CLSID => Guid("{7dc41850-0c31-11d0-8b79-00aa00b8a790}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate", "Deactivate", "CanBePooled"]

    /**
     * Enables a COM+ object to perform context-specific initialization whenever it is activated.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontrol-activate
     */
    Activate() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Enables a COM+ object to perform cleanup required before it is recycled or destroyed.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontrol-deactivate
     */
    Deactivate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Indicates whether the object can be pooled for reuse when it is deactivated.
     * @param {Pointer<VARIANT_BOOL>} pbPoolable Indicates whether the COM+ run-time environment can pool this object on deactivation for later reuse.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontrol-canbepooled
     */
    CanBePooled(pbPoolable) {
        pbPoolableMarshal := pbPoolable is VarRef ? "short*" : "ptr"

        result := ComCall(5, this, pbPoolableMarshal, pbPoolable, "HRESULT")
        return result
    }
}
