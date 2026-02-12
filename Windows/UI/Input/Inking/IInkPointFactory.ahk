#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InkPoint.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the implementation for a type that generates [InkPoint](inkpoint.md) objects used in the construction of an [InkStroke](inkstroke.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkpointfactory
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkPointFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkPointFactory
     * @type {Guid}
     */
    static IID => Guid("{29e5d51c-c98f-405d-9f3b-e53e31068d4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInkPoint"]

    /**
     * Generates an [InkPoint](inkpoint.md) object that includes position and pressure information used in the construction of an [InkStroke](inkstroke.md).
     * @param {POINT} position The screen coordinates for the [InkPoint](inkpoint.md) object.
     * @param {Float} pressure The pressure of the contact on the digitizer surface. The default is 0.5.
     * @returns {InkPoint} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkpointfactory.createinkpoint
     */
    CreateInkPoint(position, pressure) {
        result := ComCall(6, this, "ptr", position, "float", pressure, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkPoint(result_)
    }
}
