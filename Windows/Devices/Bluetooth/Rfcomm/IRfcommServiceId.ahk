#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Rfcomm
 * @version WindowsRuntime 1.4
 */
class IRfcommServiceId extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRfcommServiceId
     * @type {Guid}
     */
    static IID => Guid("{22629204-7e02-4017-8136-da1b6a1b9bbf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Uuid", "AsShortId", "AsString"]

    /**
     * @type {Guid} 
     */
    Uuid {
        get => this.get_Uuid()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Uuid() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    AsShortId() {
        result := ComCall(7, this, "uint*", &shortId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return shortId
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    AsString() {
        id := HSTRING()
        result := ComCall(8, this, "ptr", id, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return id
    }
}
