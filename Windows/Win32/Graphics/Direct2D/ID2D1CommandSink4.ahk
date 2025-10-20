#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1CommandSink3.ahk

/**
 * This interface performs all the same functions as the existing ID2D1CommandSink3 interface. It also enables access to the new primitive blend mode, MAX, through the SetPrimitiveBlend2 method.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1commandsink4
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1CommandSink4 extends ID2D1CommandSink3{
    /**
     * The interface identifier for ID2D1CommandSink4
     * @type {Guid}
     */
    static IID => Guid("{c78a6519-40d6-4218-b2de-beeeb744bb3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * 
     * @param {Integer} primitiveBlend 
     * @returns {HRESULT} 
     */
    SetPrimitiveBlend2(primitiveBlend) {
        result := ComCall(33, this, "int", primitiveBlend, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
