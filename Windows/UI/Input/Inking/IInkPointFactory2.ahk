#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InkPoint.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkPointFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkPointFactory2
     * @type {Guid}
     */
    static IID => Guid("{e0145e85-daff-45f2-ad69-050d8256a209}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInkPointWithTiltAndTimestamp"]

    /**
     * 
     * @param {POINT} position 
     * @param {Float} pressure 
     * @param {Float} tiltX 
     * @param {Float} tiltY 
     * @param {Integer} timestamp_ 
     * @returns {InkPoint} 
     */
    CreateInkPointWithTiltAndTimestamp(position, pressure, tiltX, tiltY, timestamp_) {
        result := ComCall(6, this, "ptr", position, "float", pressure, "float", tiltX, "float", tiltY, "uint", timestamp_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkPoint(result_)
    }
}
