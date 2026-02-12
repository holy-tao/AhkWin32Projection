#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\Uri.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IRemoteLauncherOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteLauncherOptions
     * @type {Guid}
     */
    static IID => Guid("{9e3a2788-2891-4cdf-a2d6-9dff7d02e693}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FallbackUri", "put_FallbackUri", "get_PreferredAppIds"]

    /**
     * @type {Uri} 
     */
    FallbackUri {
        get => this.get_FallbackUri()
        set => this.put_FallbackUri(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    PreferredAppIds {
        get => this.get_PreferredAppIds()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_FallbackUri() {
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
    put_FallbackUri(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_PreferredAppIds() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
