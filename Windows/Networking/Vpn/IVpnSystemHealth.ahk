#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\WinRTBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnSystemHealth extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnSystemHealth
     * @type {Guid}
     */
    static IID => Guid("{99a8f8af-c0ee-4e75-817a-f231aee5123d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StatementOfHealth"]

    /**
     * @type {WinRTBuffer} 
     */
    StatementOfHealth {
        get => this.get_StatementOfHealth()
    }

    /**
     * 
     * @returns {WinRTBuffer} 
     */
    get_StatementOfHealth() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Buffer(value)
    }
}
