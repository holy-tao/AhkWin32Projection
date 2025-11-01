#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1EffectContext1.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1EffectContext2 extends ID2D1EffectContext1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1EffectContext2
     * @type {Guid}
     */
    static IID => Guid("{577ad2a0-9fc7-4dda-8b18-dab810140052}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateColorContextFromDxgiColorSpace", "CreateColorContextFromSimpleColorProfile"]

    /**
     * 
     * @param {Integer} colorSpace 
     * @param {Pointer<ID2D1ColorContext1>} colorContext 
     * @returns {HRESULT} 
     */
    CreateColorContextFromDxgiColorSpace(colorSpace, colorContext) {
        result := ComCall(25, this, "int", colorSpace, "ptr*", colorContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_SIMPLE_COLOR_PROFILE>} simpleProfile 
     * @param {Pointer<ID2D1ColorContext1>} colorContext 
     * @returns {HRESULT} 
     */
    CreateColorContextFromSimpleColorProfile(simpleProfile, colorContext) {
        result := ComCall(26, this, "ptr", simpleProfile, "ptr*", colorContext, "HRESULT")
        return result
    }
}
