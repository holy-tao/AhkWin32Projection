#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Describes how a managed object is used in the COM+ object pool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-imanagedpooledobj
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IManagedPooledObj extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IManagedPooledObj
     * @type {Guid}
     */
    static IID => Guid("{c5da4bea-1b42-4437-8926-b6a38860a770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHeld"]

    /**
     * Sets whether the managed object should go back into the COM+ object pool.
     * @param {BOOL} m_bHeld Indicates whether the managed object should go back into the COM+ object pool.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imanagedpooledobj-setheld
     */
    SetHeld(m_bHeld) {
        result := ComCall(3, this, "int", m_bHeld, "HRESULT")
        return result
    }
}
