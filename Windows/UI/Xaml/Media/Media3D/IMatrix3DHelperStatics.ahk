#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\Matrix3D.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Media3D
 * @version WindowsRuntime 1.4
 */
class IMatrix3DHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMatrix3DHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{9264545e-e158-4e74-8899-689160bd2f8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Identity", "Multiply", "FromElements", "GetHasInverse", "GetIsIdentity", "Invert"]

    /**
     * @type {Matrix3D} 
     */
    Identity {
        get => this.get_Identity()
    }

    /**
     * 
     * @returns {Matrix3D} 
     */
    get_Identity() {
        value := Matrix3D()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Multiplies two expressions.
     * @param {Matrix3D} matrix1 
     * @param {Matrix3D} matrix2 
     * @returns {Matrix3D} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/access/multiplyaccess-custom-web-app
     */
    Multiply(matrix1, matrix2) {
        result_ := Matrix3D()
        result := ComCall(7, this, "ptr", matrix1, "ptr", matrix2, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Float} m11 
     * @param {Float} m12 
     * @param {Float} m13 
     * @param {Float} m14 
     * @param {Float} m21 
     * @param {Float} m22 
     * @param {Float} m23 
     * @param {Float} m24 
     * @param {Float} m31 
     * @param {Float} m32 
     * @param {Float} m33 
     * @param {Float} m34 
     * @param {Float} offsetX 
     * @param {Float} offsetY 
     * @param {Float} offsetZ 
     * @param {Float} m44 
     * @returns {Matrix3D} 
     */
    FromElements(m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33, m34, offsetX, offsetY, offsetZ, m44) {
        result_ := Matrix3D()
        result := ComCall(8, this, "double", m11, "double", m12, "double", m13, "double", m14, "double", m21, "double", m22, "double", m23, "double", m24, "double", m31, "double", m32, "double", m33, "double", m34, "double", offsetX, "double", offsetY, "double", offsetZ, "double", m44, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Matrix3D} target 
     * @returns {Boolean} 
     */
    GetHasInverse(target) {
        result := ComCall(9, this, "ptr", target, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Matrix3D} target 
     * @returns {Boolean} 
     */
    GetIsIdentity(target) {
        result := ComCall(10, this, "ptr", target, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * The InvertRect function inverts a rectangle in a window by performing a logical NOT operation on the color values for each pixel in the rectangle's interior.
     * @remarks
     * On monochrome screens, <b>InvertRect</b> makes white pixels black and black pixels white. On color screens, the inversion depends on how colors are generated for the screen. Calling <b>InvertRect</b> twice for the same rectangle restores the display to its previous colors.
     * @param {Matrix3D} target 
     * @returns {Matrix3D} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-invertrect
     */
    Invert(target) {
        result_ := Matrix3D()
        result := ComCall(11, this, "ptr", target, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
