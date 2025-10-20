#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Describes a single event that provides access to the IMtsEvents interface of the event dispatcher for the current process.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-imtslocator
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IMTSLocator extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMTSLocator
     * @type {Guid}
     */
    static IID => Guid("{d19b8bfd-7f88-11d0-b16e-00aa00ba3258}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEventDispatcher"]

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtslocator-geteventdispatcher
     */
    GetEventDispatcher(pUnk) {
        result := ComCall(7, this, "ptr*", pUnk, "HRESULT")
        return result
    }
}
