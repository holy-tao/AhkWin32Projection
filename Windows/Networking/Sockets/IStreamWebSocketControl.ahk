#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IStreamWebSocketControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamWebSocketControl
     * @type {Guid}
     */
    static IID => Guid("{b4f478b1-a45a-48db-953a-645b7d964c07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NoDelay", "put_NoDelay"]

    /**
     * @type {Boolean} 
     */
    NoDelay {
        get => this.get_NoDelay()
        set => this.put_NoDelay(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NoDelay() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_NoDelay(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
