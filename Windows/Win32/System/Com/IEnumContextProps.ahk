#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Provides a mechanism for enumerating the context properties associated with a COM+ object context.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ienumcontextprops
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IEnumContextProps extends IUnknown{
    /**
     * The interface identifier for IEnumContextProps
     * @type {Guid}
     */
    static IID => Guid("{000001c1-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<ContextProperty>} pContextProperties 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, pContextProperties, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", pContextProperties, "uint*", pceltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumContextProps>} ppEnumContextProps 
     * @returns {HRESULT} 
     */
    Clone(ppEnumContextProps) {
        result := ComCall(6, this, "ptr", ppEnumContextProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcelt 
     * @returns {HRESULT} 
     */
    Count(pcelt) {
        result := ComCall(7, this, "uint*", pcelt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
