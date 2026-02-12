#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Numerics\Matrix3x2.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\InkPoint.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkStroke2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStroke2
     * @type {Guid}
     */
    static IID => Guid("{5db9e4f4-bafa-4de1-89d3-201b1ed7d89b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PointTransform", "put_PointTransform", "GetInkPoints"]

    /**
     * @type {Matrix3x2} 
     */
    PointTransform {
        get => this.get_PointTransform()
        set => this.put_PointTransform(value)
    }

    /**
     * 
     * @returns {Matrix3x2} 
     */
    get_PointTransform() {
        value := Matrix3x2()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Matrix3x2} value 
     * @returns {HRESULT} 
     */
    put_PointTransform(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<InkPoint>} 
     */
    GetInkPoints() {
        result := ComCall(8, this, "ptr*", &inkPoints := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(InkPoint, inkPoints)
    }
}
