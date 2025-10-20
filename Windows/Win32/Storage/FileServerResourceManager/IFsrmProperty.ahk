#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines an instance of a property.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmproperty
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmProperty extends IDispatch{
    /**
     * The interface identifier for IFsrmProperty
     * @type {Guid}
     */
    static IID => Guid("{4a73fee4-4102-4fcc-9ffb-38614f9ee768}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_Name(name) {
        result := ComCall(7, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    get_Value(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} sources 
     * @returns {HRESULT} 
     */
    get_Sources(sources) {
        result := ComCall(9, this, "ptr", sources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    get_PropertyFlags(flags) {
        result := ComCall(10, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
