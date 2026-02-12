#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatCapabilities
     * @type {Guid}
     */
    static IID => Guid("{3aff77bc-39c9-4dd1-ad2d-3964dd9d403f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsOnline", "get_IsChatCapable", "get_IsFileTransferCapable", "get_IsGeoLocationPushCapable", "get_IsIntegratedMessagingCapable"]

    /**
     * @type {Boolean} 
     */
    IsOnline {
        get => this.get_IsOnline()
    }

    /**
     * @type {Boolean} 
     */
    IsChatCapable {
        get => this.get_IsChatCapable()
    }

    /**
     * @type {Boolean} 
     */
    IsFileTransferCapable {
        get => this.get_IsFileTransferCapable()
    }

    /**
     * @type {Boolean} 
     */
    IsGeoLocationPushCapable {
        get => this.get_IsGeoLocationPushCapable()
    }

    /**
     * @type {Boolean} 
     */
    IsIntegratedMessagingCapable {
        get => this.get_IsIntegratedMessagingCapable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnline() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsChatCapable() {
        result := ComCall(7, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFileTransferCapable() {
        result := ComCall(8, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGeoLocationPushCapable() {
        result := ComCall(9, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIntegratedMessagingCapable() {
        result := ComCall(10, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
