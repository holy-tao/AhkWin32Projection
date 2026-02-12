#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControl8 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControl8
     * @type {Guid}
     */
    static IID => Guid("{009e9c46-724d-53ca-9421-7a48fc731523}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanTiltDown", "get_CanTiltUp", "get_CanZoomIn", "get_CanZoomOut"]

    /**
     * @type {Boolean} 
     */
    CanTiltDown {
        get => this.get_CanTiltDown()
    }

    /**
     * @type {Boolean} 
     */
    CanTiltUp {
        get => this.get_CanTiltUp()
    }

    /**
     * @type {Boolean} 
     */
    CanZoomIn {
        get => this.get_CanZoomIn()
    }

    /**
     * @type {Boolean} 
     */
    CanZoomOut {
        get => this.get_CanZoomOut()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanTiltDown() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanTiltUp() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanZoomIn() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanZoomOut() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
