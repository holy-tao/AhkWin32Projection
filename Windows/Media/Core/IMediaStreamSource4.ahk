#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaStreamSource4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStreamSource4
     * @type {Guid}
     */
    static IID => Guid("{1d0cfcab-830d-417c-a3a9-2454fd6415c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_IsLive", "get_IsLive"]

    /**
     * @type {Boolean} 
     */
    IsLive {
        get => this.get_IsLive()
        set => this.put_IsLive(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLive(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLive() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
