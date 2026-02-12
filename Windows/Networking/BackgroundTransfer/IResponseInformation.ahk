#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IResponseInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResponseInformation
     * @type {Guid}
     */
    static IID => Guid("{f8bb9a12-f713-4792-8b68-d9d297f91d2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsResumable", "get_ActualUri", "get_StatusCode", "get_Headers"]

    /**
     * @type {Boolean} 
     */
    IsResumable {
        get => this.get_IsResumable()
    }

    /**
     * @type {Uri} 
     */
    ActualUri {
        get => this.get_ActualUri()
    }

    /**
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
    }

    /**
     * @type {IMapView<HSTRING, HSTRING>} 
     */
    Headers {
        get => this.get_Headers()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsResumable() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ActualUri() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMapView<HSTRING, HSTRING>} 
     */
    get_Headers() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }
}
