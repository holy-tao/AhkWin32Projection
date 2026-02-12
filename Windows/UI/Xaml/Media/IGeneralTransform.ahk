#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GeneralTransform.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IGeneralTransform extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeneralTransform
     * @type {Guid}
     */
    static IID => Guid("{a06798b7-a2ec-415f-ade2-eade9333f2c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Inverse", "TransformPoint", "TryTransform", "TransformBounds"]

    /**
     * @type {GeneralTransform} 
     */
    Inverse {
        get => this.get_Inverse()
    }

    /**
     * 
     * @returns {GeneralTransform} 
     */
    get_Inverse() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeneralTransform(value)
    }

    /**
     * 
     * @param {POINT} point_ 
     * @returns {POINT} 
     */
    TransformPoint(point_) {
        result_ := POINT()
        result := ComCall(7, this, "ptr", point_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {POINT} inPoint 
     * @param {Pointer<POINT>} outPoint 
     * @returns {Boolean} 
     */
    TryTransform(inPoint, outPoint) {
        result := ComCall(8, this, "ptr", inPoint, "ptr", outPoint, "int*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {RECT} rect_ 
     * @returns {RECT} 
     */
    TransformBounds(rect_) {
        result_ := RECT()
        result := ComCall(9, this, "ptr", rect_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
