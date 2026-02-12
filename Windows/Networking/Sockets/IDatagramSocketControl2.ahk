#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IDatagramSocketControl2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDatagramSocketControl2
     * @type {Guid}
     */
    static IID => Guid("{33ead5c2-979c-4415-82a1-3cfaf646c192}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InboundBufferSizeInBytes", "put_InboundBufferSizeInBytes", "get_DontFragment", "put_DontFragment"]

    /**
     * @type {Integer} 
     */
    InboundBufferSizeInBytes {
        get => this.get_InboundBufferSizeInBytes()
        set => this.put_InboundBufferSizeInBytes(value)
    }

    /**
     * @type {Boolean} 
     */
    DontFragment {
        get => this.get_DontFragment()
        set => this.put_DontFragment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InboundBufferSizeInBytes() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
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
    put_InboundBufferSizeInBytes(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DontFragment() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_DontFragment(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
