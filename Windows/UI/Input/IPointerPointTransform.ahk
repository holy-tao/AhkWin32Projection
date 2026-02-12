#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IPointerPointTransform.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides generalized transformation functions.
 * @remarks
 * Do not call this interface directly. IPointerPointTransform is used by a [GestureRecognizer](gesturerecognizer.md) to get transformation information for an input pointer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.ipointerpointtransform
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IPointerPointTransform extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointerPointTransform
     * @type {Guid}
     */
    static IID => Guid("{4d5fe14f-b87c-4028-bc9c-59e9947fb056}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Inverse", "TryTransform", "TransformBounds"]

    /**
     * Gets the inverse of the specified transformation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.ipointerpointtransform.inverse
     * @type {IPointerPointTransform} 
     */
    Inverse {
        get => this.get_Inverse()
    }

    /**
     * 
     * @returns {IPointerPointTransform} 
     */
    get_Inverse() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPointerPointTransform(value)
    }

    /**
     * Attempts to perform the transformation on the specified input point.
     * @param {POINT} inPoint The original input point.
     * @param {Pointer<POINT>} outPoint The transformed input point.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.ipointerpointtransform.trytransform
     */
    TryTransform(inPoint, outPoint) {
        result := ComCall(7, this, "ptr", inPoint, "ptr", outPoint, "int*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * Transforms the specified bounding rectangle.
     * @remarks
     * *rect* is typically the [ContactRect](pointerpointproperties_contactrect.md) associated with the input point that is transformed through the [TryTransform](ipointerpointtransform_trytransform_509328310.md) method. *rect* must be recalculated as it does not change with the transformation of the input point.
     * 
     * This method should return an [HResult](../windows.foundation/hresult.md) that identifies whether the transformation was successful.
     * @param {RECT} rect_ The bounding rectangle to transform.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.ipointerpointtransform.transformbounds
     */
    TransformBounds(rect_) {
        returnValue := RECT()
        result := ComCall(8, this, "ptr", rect_, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }
}
