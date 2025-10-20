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
     * 
     * @param {Pointer<Single>} opacity 
     * @returns {HRESULT} 
     */
    GetOpacity(opacity) {
        result := ComCall(5, this, "float*", opacity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} opacity 
     * @returns {HRESULT} 
     */
    SetOpacity(opacity) {
        result := ComCall(6, this, "float", opacity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
