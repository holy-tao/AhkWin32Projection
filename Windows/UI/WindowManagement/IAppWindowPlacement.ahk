#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DisplayRegion.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IAppWindowPlacement extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppWindowPlacement
     * @type {Guid}
     */
    static IID => Guid("{03dc815e-e7a9-5857-9c03-7d670594410e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayRegion", "get_Offset", "get_Size"]

    /**
     * @type {DisplayRegion} 
     */
    DisplayRegion {
        get => this.get_DisplayRegion()
    }

    /**
     * @type {POINT} 
     */
    Offset {
        get => this.get_Offset()
    }

    /**
     * @type {SIZE} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * 
     * @returns {DisplayRegion} 
     */
    get_DisplayRegion() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayRegion(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Offset() {
        value := POINT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Size() {
        value := SIZE()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
