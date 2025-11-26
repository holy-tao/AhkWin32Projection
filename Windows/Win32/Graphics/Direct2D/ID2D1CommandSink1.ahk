#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1CommandSink.ahk

/**
 * This interface performs all the same functions as the existing ID2D1CommandSink interface. It also enables access to the new primitive blend modes, MIN and ADD, through its SetPrimitiveBlend1 method.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/nn-d2d1_2-id2d1commandsink1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1CommandSink1 extends ID2D1CommandSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1CommandSink1
     * @type {Guid}
     */
    static IID => Guid("{9eb767fd-4269-4467-b8c2-eb30cb305743}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPrimitiveBlend1"]

    /**
     * Sets a new primitive blend mode.
     * @param {Integer} primitiveBlend Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_primitive_blend">D2D1_PRIMITIVE_BLEND</a></b>
     * 
     * The primitive blend that will apply to subsequent primitives.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/nf-d2d1_2-id2d1commandsink1-setprimitiveblend1
     */
    SetPrimitiveBlend1(primitiveBlend) {
        result := ComCall(28, this, "int", primitiveBlend, "HRESULT")
        return result
    }
}
