#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * 
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
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-geteffectid
     */
    GetEffectId() {
        id := Guid()
        result := ComCall(3, this, "ptr", id, "HRESULT")
        return id
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<Integer>} index 
     * @param {Pointer<Integer>} mapping 
     * @returns {HRESULT} 
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getpropertycount
     */
    GetPropertyCount() {
        result := ComCall(5, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Pointer<IPropertyValue>} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getproperty
     */
    GetProperty(index) {
        result := ComCall(6, this, "uint", index, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Pointer<IGraphicsEffectSource>} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getsource
     */
    GetSource(index) {
        result := ComCall(7, this, "uint", index, "ptr*", &source := 0, "HRESULT")
        return source
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getsourcecount
     */
    GetSourceCount() {
        result := ComCall(8, this, "uint*", &count := 0, "HRESULT")
        return count
    }
}
