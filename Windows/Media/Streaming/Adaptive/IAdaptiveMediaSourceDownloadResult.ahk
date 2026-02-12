#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Storage\Streams\IInputStream.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class IAdaptiveMediaSourceDownloadResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveMediaSourceDownloadResult
     * @type {Guid}
     */
    static IID => Guid("{f4afdc73-bcee-4a6a-9f0a-fec41e2339b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResourceUri", "put_ResourceUri", "get_InputStream", "put_InputStream", "get_Buffer", "put_Buffer", "get_ContentType", "put_ContentType", "get_ExtendedStatus", "put_ExtendedStatus"]

    /**
     * @type {Uri} 
     */
    ResourceUri {
        get => this.get_ResourceUri()
        set => this.put_ResourceUri(value)
    }

    /**
     * @type {IInputStream} 
     */
    InputStream {
        get => this.get_InputStream()
        set => this.put_InputStream(value)
    }

    /**
     * @type {IBuffer} 
     */
    Buffer {
        get => this.get_Buffer()
        set => this.put_Buffer(value)
    }

    /**
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
        set => this.put_ContentType(value)
    }

    /**
     * @type {Integer} 
     */
    ExtendedStatus {
        get => this.get_ExtendedStatus()
        set => this.put_ExtendedStatus(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ResourceUri() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ResourceUri(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_InputStream() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(value)
    }

    /**
     * 
     * @param {IInputStream} value 
     * @returns {HRESULT} 
     */
    put_InputStream(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Buffer() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
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
    put_Buffer(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
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
    put_ContentType(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedStatus() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
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
    put_ExtendedStatus(value) {
        result := ComCall(15, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
