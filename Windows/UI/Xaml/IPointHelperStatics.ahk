#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IPointHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{015aca75-76d8-4b7e-8a33-7d79204691ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromCoordinates"]

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {POINT} 
     */
    FromCoordinates(x, y) {
        result_ := POINT()
        result := ComCall(6, this, "float", x, "float", y, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
