#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardAutomaticResponseApdu extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardAutomaticResponseApdu
     * @type {Guid}
     */
    static IID => Guid("{52152bab-c63e-4531-a857-d756d99b986a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommandApdu", "put_CommandApdu", "get_CommandApduBitMask", "put_CommandApduBitMask", "get_ShouldMatchLength", "put_ShouldMatchLength", "get_AppletId", "put_AppletId", "get_ResponseApdu", "put_ResponseApdu"]

    /**
     * @type {IBuffer} 
     */
    CommandApdu {
        get => this.get_CommandApdu()
        set => this.put_CommandApdu(value)
    }

    /**
     * @type {IBuffer} 
     */
    CommandApduBitMask {
        get => this.get_CommandApduBitMask()
        set => this.put_CommandApduBitMask(value)
    }

    /**
     * @type {Boolean} 
     */
    ShouldMatchLength {
        get => this.get_ShouldMatchLength()
        set => this.put_ShouldMatchLength(value)
    }

    /**
     * @type {IBuffer} 
     */
    AppletId {
        get => this.get_AppletId()
        set => this.put_AppletId(value)
    }

    /**
     * @type {IBuffer} 
     */
    ResponseApdu {
        get => this.get_ResponseApdu()
        set => this.put_ResponseApdu(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_CommandApdu() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_CommandApdu(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_CommandApduBitMask() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_CommandApduBitMask(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldMatchLength() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_ShouldMatchLength(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_AppletId() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_AppletId(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ResponseApdu() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_ResponseApdu(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
