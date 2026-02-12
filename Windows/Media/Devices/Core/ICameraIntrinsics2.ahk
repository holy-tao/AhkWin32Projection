#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Numerics\Matrix4x4.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class ICameraIntrinsics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICameraIntrinsics2
     * @type {Guid}
     */
    static IID => Guid("{0cdaa447-0798-4b4d-839f-c5ec414db27a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UndistortedProjectionTransform", "DistortPoint", "DistortPoints", "UndistortPoint", "UndistortPoints"]

    /**
     * @type {Matrix4x4} 
     */
    UndistortedProjectionTransform {
        get => this.get_UndistortedProjectionTransform()
    }

    /**
     * 
     * @returns {Matrix4x4} 
     */
    get_UndistortedProjectionTransform() {
        value := Matrix4x4()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {POINT} input_ 
     * @returns {POINT} 
     */
    DistortPoint(input_) {
        result_ := POINT()
        result := ComCall(7, this, "ptr", input_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} inputs_length 
     * @param {Pointer<POINT>} inputs 
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<POINT>>} results 
     * @returns {HRESULT} 
     */
    DistortPoints(inputs_length, inputs, results_length, results) {
        results_lengthMarshal := results_length is VarRef ? "uint*" : "ptr"
        resultsMarshal := results is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "uint", inputs_length, "ptr", inputs, results_lengthMarshal, results_length, resultsMarshal, results, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {POINT} input_ 
     * @returns {POINT} 
     */
    UndistortPoint(input_) {
        result_ := POINT()
        result := ComCall(9, this, "ptr", input_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} inputs_length 
     * @param {Pointer<POINT>} inputs 
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<POINT>>} results 
     * @returns {HRESULT} 
     */
    UndistortPoints(inputs_length, inputs, results_length, results) {
        results_lengthMarshal := results_length is VarRef ? "uint*" : "ptr"
        resultsMarshal := results is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "uint", inputs_length, "ptr", inputs, results_lengthMarshal, results_length, resultsMarshal, results, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
