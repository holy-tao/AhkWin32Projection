#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A matrix is a special data type that contains between one and sixteen components. Every component of a matrix must be of the same type.
 * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-matrix
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct Matrix {
    value : IntPtr

    __value {
        set {
            if (value is Matrix) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    __New(value := 0) {
        this.value := value
    }
}
