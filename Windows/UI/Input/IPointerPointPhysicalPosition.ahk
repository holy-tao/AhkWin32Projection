#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IPointerPointPhysicalPosition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointerPointPhysicalPosition
     * @type {Guid}
     */
    static IID => Guid("{003185a3-a5e7-4859-9c0b-89340204806c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPhysicalPositionSupported", "get_PhysicalPosition"]

    /**
     * @type {Boolean} 
     */
    IsPhysicalPositionSupported {
        get => this.get_IsPhysicalPositionSupported()
    }

    /**
     * @type {POINT} 
     */
    PhysicalPosition {
        get => this.get_PhysicalPosition()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPhysicalPositionSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_PhysicalPosition() {
        value := POINT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
