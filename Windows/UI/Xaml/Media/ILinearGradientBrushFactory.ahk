#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\LinearGradientBrush.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ILinearGradientBrushFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILinearGradientBrushFactory
     * @type {Guid}
     */
    static IID => Guid("{0ae0861c-1e7a-4fed-9857-ea8caa798490}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithGradientStopCollectionAndAngle"]

    /**
     * 
     * @param {GradientStopCollection} gradientStopCollection_ 
     * @param {Float} angle 
     * @returns {LinearGradientBrush} 
     */
    CreateInstanceWithGradientStopCollectionAndAngle(gradientStopCollection_, angle) {
        result := ComCall(6, this, "ptr", gradientStopCollection_, "double", angle, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LinearGradientBrush(value)
    }
}
