#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1ColorContext.ahk

/**
 * Represents a color context to be used with the Color Management Effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1colorcontext1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1ColorContext1 extends ID2D1ColorContext{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1ColorContext1
     * @type {Guid}
     */
    static IID => Guid("{1ab42875-c57f-4be9-bd85-9cd78d6f55ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetColorContextType", "GetDXGIColorSpace", "GetSimpleColorProfile"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1colorcontext1-getcolorcontexttype
     */
    GetColorContextType() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1colorcontext1-getdxgicolorspace
     */
    GetDXGIColorSpace() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_SIMPLE_COLOR_PROFILE>} simpleProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1colorcontext1-getsimplecolorprofile
     */
    GetSimpleColorProfile(simpleProfile) {
        result := ComCall(9, this, "ptr", simpleProfile, "HRESULT")
        return result
    }
}
