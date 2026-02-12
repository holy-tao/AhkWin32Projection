#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ISystemImageProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemImageProperties
     * @type {Guid}
     */
    static IID => Guid("{011b2e30-8b39-4308-bea1-e8aa61e47826}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HorizontalSize", "get_VerticalSize"]

    /**
     * @type {HSTRING} 
     */
    HorizontalSize {
        get => this.get_HorizontalSize()
    }

    /**
     * @type {HSTRING} 
     */
    VerticalSize {
        get => this.get_VerticalSize()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HorizontalSize() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VerticalSize() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
