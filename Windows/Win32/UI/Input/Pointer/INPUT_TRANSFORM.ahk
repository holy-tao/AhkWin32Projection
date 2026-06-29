#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the matrix that represents a transform on a message consumer.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-input_transform
 * @namespace Windows.Win32.UI.Input.Pointer
 */
export default struct INPUT_TRANSFORM {
    #StructPack 4

    _11 : Float32

    _12 : Float32

    _13 : Float32

    _14 : Float32

    _21 : Float32

    _22 : Float32

    _23 : Float32

    _24 : Float32

    _31 : Float32

    _32 : Float32

    _33 : Float32

    _34 : Float32

    _41 : Float32

    _42 : Float32

    _43 : Float32

    _44 : Float32

    static __New() {
        DefineProp(this.Prototype, 'm', { type: Float32[16], offset: 0 })
        this.DeleteProp("__New")
    }
}
