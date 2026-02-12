#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Numerics\Vector2.ahk
#Include ..\..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class ICameraIntrinsics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICameraIntrinsics
     * @type {Guid}
     */
    static IID => Guid("{0aa6ed32-6589-49da-afde-594270ca0aac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FocalLength", "get_PrincipalPoint", "get_RadialDistortion", "get_TangentialDistortion", "get_ImageWidth", "get_ImageHeight", "ProjectOntoFrame", "UnprojectAtUnitDepth", "ProjectManyOntoFrame", "UnprojectPixelsAtUnitDepth"]

    /**
     * @type {Vector2} 
     */
    FocalLength {
        get => this.get_FocalLength()
    }

    /**
     * @type {Vector2} 
     */
    PrincipalPoint {
        get => this.get_PrincipalPoint()
    }

    /**
     * @type {Vector3} 
     */
    RadialDistortion {
        get => this.get_RadialDistortion()
    }

    /**
     * @type {Vector2} 
     */
    TangentialDistortion {
        get => this.get_TangentialDistortion()
    }

    /**
     * @type {Integer} 
     */
    ImageWidth {
        get => this.get_ImageWidth()
    }

    /**
     * @type {Integer} 
     */
    ImageHeight {
        get => this.get_ImageHeight()
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_FocalLength() {
        value := Vector2()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_PrincipalPoint() {
        value := Vector2()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_RadialDistortion() {
        value := Vector3()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_TangentialDistortion() {
        value := Vector2()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ImageWidth() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ImageHeight() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector3} coordinate 
     * @returns {POINT} 
     */
    ProjectOntoFrame(coordinate) {
        result_ := POINT()
        result := ComCall(12, this, "ptr", coordinate, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {POINT} pixelCoordinate 
     * @returns {Vector2} 
     */
    UnprojectAtUnitDepth(pixelCoordinate) {
        result_ := Vector2()
        result := ComCall(13, this, "ptr", pixelCoordinate, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} coordinates_length 
     * @param {Pointer<Vector3>} coordinates 
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<POINT>>} results 
     * @returns {HRESULT} 
     */
    ProjectManyOntoFrame(coordinates_length, coordinates, results_length, results) {
        results_lengthMarshal := results_length is VarRef ? "uint*" : "ptr"
        resultsMarshal := results is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, "uint", coordinates_length, "ptr", coordinates, results_lengthMarshal, results_length, resultsMarshal, results, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} pixelCoordinates_length 
     * @param {Pointer<POINT>} pixelCoordinates 
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<Vector2>>} results 
     * @returns {HRESULT} 
     */
    UnprojectPixelsAtUnitDepth(pixelCoordinates_length, pixelCoordinates, results_length, results) {
        results_lengthMarshal := results_length is VarRef ? "uint*" : "ptr"
        resultsMarshal := results is VarRef ? "ptr*" : "ptr"

        result := ComCall(15, this, "uint", pixelCoordinates_length, "ptr", pixelCoordinates, results_lengthMarshal, results_length, resultsMarshal, results, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
