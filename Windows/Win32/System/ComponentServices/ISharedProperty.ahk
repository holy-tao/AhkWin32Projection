#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Exposes property methods that you can use to set or retrieve the value of a shared property.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-isharedproperty
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISharedProperty extends IDispatch{
    /**
     * The interface identifier for ISharedProperty
     * @type {Guid}
     */
    static IID => Guid("{2a005c01-a5de-11cf-9e66-00aa00a3f464}")

    /**
     * The class identifier for SharedProperty
     * @type {Guid}
     */
    static CLSID => Guid("{2a005c05-a5de-11cf-9e66-00aa00a3f464}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    get_Value(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} val 
     * @returns {HRESULT} 
     */
    put_Value(val) {
        result := ComCall(8, this, "ptr", val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
