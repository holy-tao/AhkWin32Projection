#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID2D1Effect.ahk" { ID2D1Effect }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }

/**
 * Describes features of an effect.
 * @remarks
 * > [!NOTE]
 * > You shouldn't rely heavily on the input rectangles returned by this structure. They can change due to subtle changes in effect implementations, and due to optimization changes in the effect rendering system.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ns-d2d1_1-d2d1_effect_input_description
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_EFFECT_INPUT_DESCRIPTION {
    #StructPack 8

    /**
     * The effect whose input connection is being specified.
     */
    effect : ID2D1Effect

    /**
     * The input index of the effect that is being considered.
     */
    inputIndex : UInt32

    /**
     * The amount of data that would be available on the input. This can be used to query this information when the data is not yet available.
     */
    inputRectangle : D2D_RECT_F

}
