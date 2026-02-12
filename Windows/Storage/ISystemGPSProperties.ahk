#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ISystemGPSProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemGPSProperties
     * @type {Guid}
     */
    static IID => Guid("{c0f46eb4-c174-481a-bc25-921986f6a6f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LatitudeDecimal", "get_LongitudeDecimal"]

    /**
     * @type {HSTRING} 
     */
    LatitudeDecimal {
        get => this.get_LatitudeDecimal()
    }

    /**
     * @type {HSTRING} 
     */
    LongitudeDecimal {
        get => this.get_LongitudeDecimal()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LatitudeDecimal() {
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
    get_LongitudeDecimal() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
