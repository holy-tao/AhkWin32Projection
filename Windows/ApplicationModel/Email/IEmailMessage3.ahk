#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMessage3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMessage3
     * @type {Guid}
     */
    static IID => Guid("{a1ea675c-e598-4d29-a018-fc7b7eece0a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SmimeData", "put_SmimeData", "get_SmimeKind", "put_SmimeKind"]

    /**
     * @type {IRandomAccessStreamReference} 
     */
    SmimeData {
        get => this.get_SmimeData()
        set => this.put_SmimeData(value)
    }

    /**
     * @type {Integer} 
     */
    SmimeKind {
        get => this.get_SmimeKind()
        set => this.put_SmimeKind(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_SmimeData() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_SmimeData(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SmimeKind() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_SmimeKind(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
