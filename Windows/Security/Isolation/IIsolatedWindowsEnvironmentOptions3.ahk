#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IIsolatedWindowsEnvironmentOptions3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedWindowsEnvironmentOptions3
     * @type {Guid}
     */
    static IID => Guid("{98d5aa23-161f-4cd9-8a9c-269b30122b0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowedClipboardFormatsToEnvironment", "put_AllowedClipboardFormatsToEnvironment", "get_AllowedClipboardFormatsToHost", "put_AllowedClipboardFormatsToHost", "get_CreationPriority", "put_CreationPriority"]

    /**
     * @type {Integer} 
     */
    AllowedClipboardFormatsToEnvironment {
        get => this.get_AllowedClipboardFormatsToEnvironment()
        set => this.put_AllowedClipboardFormatsToEnvironment(value)
    }

    /**
     * @type {Integer} 
     */
    AllowedClipboardFormatsToHost {
        get => this.get_AllowedClipboardFormatsToHost()
        set => this.put_AllowedClipboardFormatsToHost(value)
    }

    /**
     * @type {Integer} 
     */
    CreationPriority {
        get => this.get_CreationPriority()
        set => this.put_CreationPriority(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedClipboardFormatsToEnvironment() {
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
    put_AllowedClipboardFormatsToEnvironment(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedClipboardFormatsToHost() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
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
    put_AllowedClipboardFormatsToHost(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CreationPriority() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_CreationPriority(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
