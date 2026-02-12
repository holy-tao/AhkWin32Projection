#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Matrix.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IMatrixHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMatrixHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{c18606a6-39f4-4b8a-8403-28e5e5f033b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Identity", "FromElements", "GetIsIdentity", "Transform"]

    /**
     * @type {Matrix} 
     */
    Identity {
        get => this.get_Identity()
    }

    /**
     * 
     * @returns {Matrix} 
     */
    get_Identity() {
        value := Matrix()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} m11 
     * @param {Float} m12 
     * @param {Float} m21 
     * @param {Float} m22 
     * @param {Float} offsetX 
     * @param {Float} offsetY 
     * @returns {Matrix} 
     */
    FromElements(m11, m12, m21, m22, offsetX, offsetY) {
        result_ := Matrix()
        result := ComCall(7, this, "double", m11, "double", m12, "double", m21, "double", m22, "double", offsetX, "double", offsetY, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Matrix} target 
     * @returns {Boolean} 
     */
    GetIsIdentity(target) {
        result := ComCall(8, this, "ptr", target, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Initializes a new instance of the [Transform3D](transform3d.md) class.
     * @param {Matrix} target 
     * @param {POINT} point_ 
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.transform3d.#ctor
     */
    Transform(target, point_) {
        result_ := POINT()
        result := ComCall(9, this, "ptr", target, "ptr", point_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
