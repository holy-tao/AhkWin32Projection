#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\IStorageFile.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class IUserInformationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserInformationStatics
     * @type {Guid}
     */
    static IID => Guid("{77f3a910-48fa-489c-934e-2ae85ba8f772}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AccountPictureChangeEnabled", "get_NameAccessAllowed", "GetAccountPicture", "SetAccountPictureAsync", "SetAccountPicturesAsync", "SetAccountPictureFromStreamAsync", "SetAccountPicturesFromStreamsAsync", "add_AccountPictureChanged", "remove_AccountPictureChanged", "GetDisplayNameAsync", "GetFirstNameAsync", "GetLastNameAsync", "GetPrincipalNameAsync", "GetSessionInitiationProtocolUriAsync", "GetDomainNameAsync"]

    /**
     * @type {Boolean} 
     */
    AccountPictureChangeEnabled {
        get => this.get_AccountPictureChangeEnabled()
    }

    /**
     * @type {Boolean} 
     */
    NameAccessAllowed {
        get => this.get_NameAccessAllowed()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AccountPictureChangeEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NameAccessAllowed() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} kind 
     * @returns {IStorageFile} 
     */
    GetAccountPicture(kind) {
        result := ComCall(8, this, "int", kind, "ptr*", &storageFile_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageFile(storageFile_)
    }

    /**
     * 
     * @param {IStorageFile} image_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    SetAccountPictureAsync(image_) {
        result := ComCall(9, this, "ptr", image_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {IStorageFile} smallImage 
     * @param {IStorageFile} largeImage 
     * @param {IStorageFile} video 
     * @returns {IAsyncOperation<Integer>} 
     */
    SetAccountPicturesAsync(smallImage, largeImage, video) {
        result := ComCall(10, this, "ptr", smallImage, "ptr", largeImage, "ptr", video, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {IRandomAccessStream} image_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    SetAccountPictureFromStreamAsync(image_) {
        result := ComCall(11, this, "ptr", image_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {IRandomAccessStream} smallImage 
     * @param {IRandomAccessStream} largeImage 
     * @param {IRandomAccessStream} video 
     * @returns {IAsyncOperation<Integer>} 
     */
    SetAccountPicturesFromStreamsAsync(smallImage, largeImage, video) {
        result := ComCall(12, this, "ptr", smallImage, "ptr", largeImage, "ptr", video, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} changeHandler 
     * @returns {EventRegistrationToken} 
     */
    add_AccountPictureChanged(changeHandler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", changeHandler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AccountPictureChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetDisplayNameAsync() {
        result := ComCall(15, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetFirstNameAsync() {
        result := ComCall(16, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetLastNameAsync() {
        result := ComCall(17, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetPrincipalNameAsync() {
        result := ComCall(18, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Uri>} 
     */
    GetSessionInitiationProtocolUriAsync() {
        result := ComCall(19, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Uri, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetDomainNameAsync() {
        result := ComCall(20, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }
}
