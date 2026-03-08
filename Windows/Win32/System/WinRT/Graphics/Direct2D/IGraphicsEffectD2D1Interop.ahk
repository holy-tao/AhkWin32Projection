#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * Native interoperation interface that provides a counterpart to IGraphicsEffect and allows for metadata queries. This interface is available in C++ only.
 * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nn-windows-graphics-effects-interop-igraphicseffectd2d1interop
 * @namespace Windows.Win32.System.WinRT.Graphics.Direct2D
 * @version v4.0.30319
 */
class IGraphicsEffectD2D1Interop extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEffectId", "GetNamedPropertyMapping", "GetPropertyCount", "GetProperty", "GetSource", "GetSourceCount"]

    /**
     * Retrieves the ID of the effect.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * When this method returns, this parameter will contain the ID of the effect.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-geteffectid
     */
    GetEffectId() {
        id := Guid()
        result := ComCall(3, this, "ptr", id, "HRESULT")
        return id
    }

    /**
     * Retrieves the mapping for an effect property.
     * @param {PWSTR} name Type: <b>LPCWSTR</b>
     * 
     * Name of the property.
     * @param {Pointer<Integer>} index Type: <b>UINT*</b>
     * 
     * When this method returns, this parameter will contain the index of the property.
     * @param {Pointer<Integer>} mapping Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.graphics.effects.interop/ne-windows-graphics-effects-interop-graphics_effect_property_mapping">GRAPHICS_EFFECT_PROPERTY_MAPPING</a>*</b>
     * 
     * Indicates how a strongly-typed effect property maps to an underlying Direct2D effect property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getnamedpropertymapping
     */
    GetNamedPropertyMapping(name, index, mapping) {
        name := name is String ? StrPtr(name) : name

        indexMarshal := index is VarRef ? "uint*" : "ptr"
        mappingMarshal := mapping is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", name, indexMarshal, index, mappingMarshal, mapping, "HRESULT")
        return result
    }

    /**
     * Retrieve the property count for the effect.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When the method returns, this parameter will contain the property count.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getpropertycount
     */
    GetPropertyCount() {
        result := ComCall(5, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Retrieves the effect property at the specified index.
     * @param {Integer} index Type: <b>UINT</b>
     * 
     * The index of the property to retrieve.
     * @returns {Pointer<IPropertyValue>} Type: <b>Windows::Foundation::IPropertyValue**</b>
     * 
     * When this method returns, this parameter will contain the retrieved property.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getproperty
     */
    GetProperty(index) {
        result := ComCall(6, this, "uint", index, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the effect source at the specified index.
     * @param {Integer} index Type: <b>UINT</b>
     * 
     * Index of the source the retrieve.
     * @returns {Pointer<IGraphicsEffectSource>} Type: <b>IGraphicsEffectSource**</b>
     * 
     * When the method returns, this parameter will contain the source at the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getsource
     */
    GetSource(index) {
        result := ComCall(7, this, "uint", index, "ptr*", &source := 0, "HRESULT")
        return source
    }

    /**
     * Retrieves the source count for the effect.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When the method returns, this parameter will contain the source count for the effect.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getsourcecount
     */
    GetSourceCount() {
        result := ComCall(8, this, "uint*", &count := 0, "HRESULT")
        return count
    }
}
