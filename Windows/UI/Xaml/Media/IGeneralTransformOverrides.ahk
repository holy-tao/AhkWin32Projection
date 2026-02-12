#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GeneralTransform.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IGeneralTransformOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeneralTransformOverrides
     * @type {Guid}
     */
    static IID => Guid("{4f121083-24cf-4524-90ad-8a42b1c12783}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InverseCore", "TryTransformCore", "TransformBoundsCore"]

    /**
     * @type {GeneralTransform} 
     */
    InverseCore {
        get => this.get_InverseCore()
    }

    /**
     * 
     * @returns {GeneralTransform} 
     */
    get_InverseCore() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeneralTransform(value)
    }

    /**
     * 
     * @param {POINT} inPoint 
     * @param {Pointer<POINT>} outPoint 
     * @returns {Boolean} 
     */
    TryTransformCore(inPoint, outPoint) {
        result := ComCall(7, this, "ptr", inPoint, "ptr", outPoint, "int*", &returnValue := 0, "int")
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
    TransformBoundsCore(rect_) {
        result_ := RECT()
        result := ComCall(8, this, "ptr", rect_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
