#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMShareable.ahk

/**
 * Defines objects that are used to paint graphical objects. Classes that derive from IXpsOMBrush describe how the area is painted.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMBrush extends IXpsOMShareable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMBrush
     * @type {Guid}
     */
    static IID => Guid("{56a3f80c-ea4c-4187-a57b-a2a473b2b42b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOpacity", "SetOpacity"]

    /**
     * 
     * @param {Pointer<Float>} opacity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsombrush-getopacity
     */
    GetOpacity(opacity) {
        result := ComCall(5, this, "float*", opacity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} opacity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsombrush-setopacity
     */
    SetOpacity(opacity) {
        result := ComCall(6, this, "float", opacity, "HRESULT")
        return result
    }
}
