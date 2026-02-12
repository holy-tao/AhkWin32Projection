#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Graphics\SizeInt32.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class IMiracastReceiverVideoStreamSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMiracastReceiverVideoStreamSettings
     * @type {Guid}
     */
    static IID => Guid("{169b5e1b-149d-52d0-b126-6f89744e4f50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Size", "put_Size", "get_Bitrate", "put_Bitrate"]

    /**
     * @type {SizeInt32} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * @type {Integer} 
     */
    Bitrate {
        get => this.get_Bitrate()
        set => this.put_Bitrate(value)
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_Size() {
        value := SizeInt32()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SizeInt32} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
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
    get_Bitrate() {
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
    put_Bitrate(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
