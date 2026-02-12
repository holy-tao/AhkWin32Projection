#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Certificate.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CmsTimestampInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICmsSignerInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICmsSignerInfo
     * @type {Guid}
     */
    static IID => Guid("{50d020db-1d2f-4c1a-b5c5-d0188ff91f47}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Certificate", "put_Certificate", "get_HashAlgorithmName", "put_HashAlgorithmName", "get_TimestampInfo"]

    /**
     * @type {Certificate} 
     */
    Certificate {
        get => this.get_Certificate()
        set => this.put_Certificate(value)
    }

    /**
     * @type {HSTRING} 
     */
    HashAlgorithmName {
        get => this.get_HashAlgorithmName()
        set => this.put_HashAlgorithmName(value)
    }

    /**
     * @type {CmsTimestampInfo} 
     */
    TimestampInfo {
        get => this.get_TimestampInfo()
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_Certificate() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Certificate(value)
    }

    /**
     * 
     * @param {Certificate} value 
     * @returns {HRESULT} 
     */
    put_Certificate(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HashAlgorithmName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_HashAlgorithmName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CmsTimestampInfo} 
     */
    get_TimestampInfo() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CmsTimestampInfo(value)
    }
}
