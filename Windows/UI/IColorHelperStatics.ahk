#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\Color.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI
 * @version WindowsRuntime 1.4
 */
class IColorHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColorHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{8504dbea-fb6a-4144-a6c2-33499c9284f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromArgb"]

    /**
     * 
     * @param {Integer} a 
     * @param {Integer} r 
     * @param {Integer} g 
     * @param {Integer} b 
     * @returns {Color} 
     */
    FromArgb(a, r, g, b) {
        returnValue := Color()
        result := ComCall(6, this, "char", a, "char", r, "char", g, "char", b, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }
}
