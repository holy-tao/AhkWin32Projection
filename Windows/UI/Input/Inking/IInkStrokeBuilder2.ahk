#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InkStroke.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkStrokeBuilder2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStrokeBuilder2
     * @type {Guid}
     */
    static IID => Guid("{bd82bc27-731f-4cbc-bbbf-6d468044f1e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateStrokeFromInkPoints"]

    /**
     * 
     * @param {IIterable<InkPoint>} inkPoints 
     * @param {Matrix3x2} transform_ 
     * @returns {InkStroke} 
     */
    CreateStrokeFromInkPoints(inkPoints, transform_) {
        result := ComCall(6, this, "ptr", inkPoints, "ptr", transform_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkStroke(result_)
    }
}
