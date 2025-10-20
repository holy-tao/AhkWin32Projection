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
     * 
     * @returns {HRESULT} 
     */
    Activate() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Deactivate() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbPoolable 
     * @returns {HRESULT} 
     */
    CanBePooled(pbPoolable) {
        result := ComCall(5, this, "ptr", pbPoolable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
