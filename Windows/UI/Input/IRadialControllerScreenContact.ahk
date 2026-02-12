#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IRadialControllerScreenContact extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialControllerScreenContact
     * @type {Guid}
     */
    static IID => Guid("{206aa434-e651-11e5-bf62-2c27d7404e85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Bounds", "get_Position"]

    /**
     * @type {RECT} 
     */
    Bounds {
        get => this.get_Bounds()
    }

    /**
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Bounds() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        value := POINT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
