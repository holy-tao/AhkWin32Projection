#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Visual.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\Foundation\Numerics\Vector2.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IVisual2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisual2
     * @type {Guid}
     */
    static IID => Guid("{3052b611-56c3-4c3e-8bf3-f6e1ad473f06}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ParentForTransform", "put_ParentForTransform", "get_RelativeOffsetAdjustment", "put_RelativeOffsetAdjustment", "get_RelativeSizeAdjustment", "put_RelativeSizeAdjustment"]

    /**
     * @type {Visual} 
     */
    ParentForTransform {
        get => this.get_ParentForTransform()
        set => this.put_ParentForTransform(value)
    }

    /**
     * @type {Vector3} 
     */
    RelativeOffsetAdjustment {
        get => this.get_RelativeOffsetAdjustment()
        set => this.put_RelativeOffsetAdjustment(value)
    }

    /**
     * @type {Vector2} 
     */
    RelativeSizeAdjustment {
        get => this.get_RelativeSizeAdjustment()
        set => this.put_RelativeSizeAdjustment(value)
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_ParentForTransform() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Visual(value)
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_ParentForTransform(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_RelativeOffsetAdjustment() {
        value := Vector3()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_RelativeOffsetAdjustment(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_RelativeSizeAdjustment() {
        value := Vector2()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_RelativeSizeAdjustment(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
