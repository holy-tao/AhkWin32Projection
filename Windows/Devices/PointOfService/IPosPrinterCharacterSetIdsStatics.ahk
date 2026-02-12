#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IPosPrinterCharacterSetIdsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPosPrinterCharacterSetIdsStatics
     * @type {Guid}
     */
    static IID => Guid("{5c709eff-709a-4fe7-b215-06a748a38b39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Utf16LE", "get_Ascii", "get_Ansi"]

    /**
     * @type {Integer} 
     */
    Utf16LE {
        get => this.get_Utf16LE()
    }

    /**
     * @type {Integer} 
     */
    Ascii {
        get => this.get_Ascii()
    }

    /**
     * @type {Integer} 
     */
    Ansi {
        get => this.get_Ansi()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Utf16LE() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ascii() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ansi() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
