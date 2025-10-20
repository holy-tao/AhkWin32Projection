#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Graphics.Direct2D
 * @version v4.0.30319
 */
class IGraphicsEffectD2D1Interop extends IUnknown{
    /**
     * The interface identifier for IGraphicsEffectD2D1Interop
     * @type {Guid}
     */
    static IID => Guid("{2fc57384-a068-44d7-a331-30982fcf7177}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} id 
     * @returns {HRESULT} 
     */
    GetEffectId(id) {
        result := ComCall(3, this, "ptr", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<UInt32>} index 
     * @param {Pointer<Int32>} mapping 
     * @returns {HRESULT} 
     */
    GetNamedPropertyMapping(name, index, mapping) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(4, this, "ptr", name, "uint*", index, "int*", mapping, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetPropertyCount(count) {
        result := ComCall(5, this, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IPropertyValue>} value 
     * @returns {HRESULT} 
     */
    GetProperty(index, value) {
        result := ComCall(6, this, "uint", index, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IGraphicsEffectSource>} source 
     * @returns {HRESULT} 
     */
    GetSource(index, source) {
        result := ComCall(7, this, "uint", index, "ptr", source, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetSourceCount(count) {
        result := ComCall(8, this, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
