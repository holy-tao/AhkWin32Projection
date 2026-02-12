#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IDatagramSocketControl3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDatagramSocketControl3
     * @type {Guid}
     */
    static IID => Guid("{d4eb8256-1f6d-4598-9b57-d42a001df349}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MulticastOnly", "put_MulticastOnly"]

    /**
     * @type {Boolean} 
     */
    MulticastOnly {
        get => this.get_MulticastOnly()
        set => this.put_MulticastOnly(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MulticastOnly() {
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
    put_MulticastOnly(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
