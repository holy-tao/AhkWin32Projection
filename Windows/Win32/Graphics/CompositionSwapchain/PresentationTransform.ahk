#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an arbitrary affine 2D transformation defined by a 3-by-2 matrix. (PresentationTransform)
 * @see https://learn.microsoft.com/windows/win32/api/presentationtypes/ns-presentationtypes-presentationtransform
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct PresentationTransform {
    #StructPack 4

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the first row and first column of this transform matrix structure.
     */
    M11 : Float32

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the first row and second column of this transform matrix structure.
     */
    M12 : Float32

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the second row and first column of this transform matrix structure.
     */
    M21 : Float32

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the second row and second column of this transform matrix structure.
     */
    M22 : Float32

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the third row and first column of this transform matrix structure.
     */
    M31 : Float32

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the third row and second column of this transform matrix structure.
     */
    M32 : Float32

}
