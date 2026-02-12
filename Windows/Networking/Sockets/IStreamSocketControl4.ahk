#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IStreamSocketControl4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamSocketControl4
     * @type {Guid}
     */
    static IID => Guid("{964e2b3d-ec27-4888-b3ce-c74b418423ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinProtectionLevel", "put_MinProtectionLevel"]

    /**
     * @type {Integer} 
     */
    MinProtectionLevel {
        get => this.get_MinProtectionLevel()
        set => this.put_MinProtectionLevel(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinProtectionLevel() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinProtectionLevel(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
