#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Graphics\Imaging\BitmapSize.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.SocialInfo
 * @version WindowsRuntime 1.4
 */
class ISocialItemThumbnail extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISocialItemThumbnail
     * @type {Guid}
     */
    static IID => Guid("{5cbf831a-3f08-497f-917f-57e09d84b141}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetUri", "put_TargetUri", "get_ImageUri", "put_ImageUri", "get_BitmapSize", "put_BitmapSize", "SetImageAsync"]

    /**
     * @type {Uri} 
     */
    TargetUri {
        get => this.get_TargetUri()
        set => this.put_TargetUri(value)
    }

    /**
     * @type {Uri} 
     */
    ImageUri {
        get => this.get_ImageUri()
        set => this.put_ImageUri(value)
    }

    /**
     * @type {BitmapSize} 
     */
    BitmapSize {
        get => this.get_BitmapSize()
        set => this.put_BitmapSize(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_TargetUri() {
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
    put_TargetUri(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ImageUri() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
    put_ImageUri(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BitmapSize} 
     */
    get_BitmapSize() {
        value := BitmapSize()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {BitmapSize} value 
     * @returns {HRESULT} 
     */
    put_BitmapSize(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInputStream} image_ 
     * @returns {IAsyncAction} 
     */
    SetImageAsync(image_) {
        result := ComCall(12, this, "ptr", image_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
